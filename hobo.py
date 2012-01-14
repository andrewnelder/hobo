'''
@author: Andrew Nelder
'''

# I M P O R T S ###############################################################

import logging
import re
import os
import sqlite3

from ConfigParser import ConfigParser

from lib.markdown2 import markdown
from lib.bottle import route, run, view, template, error, static_file

# I N I T I A L I Z A T I O N #################################################

# Logger
ch = logging.StreamHandler()
ch.setLevel(logging.DEBUG)
LOGGER = logging.getLogger()
LOGGER.addHandler(ch)

# Regular Expressions
RE_VALID_FILE_EXTENSIONS = re.compile(r'''(?:.md|.markdown|.txt)$''')
RE_ARTICLE_TITLE = re.compile(r'''(?:\:title )(.*?)[\n\r]''')

# Database Queries
Q_CREATE_TABLE = \
    """CREATE TABLE posts (id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT,
    title TEXT, author TEXT, summary TEXT, body TEXT)"""
Q_INSERT_POST = \
    """INSERT INTO posts (date, title, author, summary, body)
    VALUES (?, ?, ?, ?, ?)"""
Q_SELECT_ALL_POSTS = \
    """SELECT id, date, title, author, summary FROM posts ORDER BY id DESC"""
Q_SELECT_POST = \
    """SELECT id, date, title, author, body FROM posts WHERE id = ?"""

# Database
open('hobo.db', 'w').close()
CONNECTION = sqlite3.connect('hobo.db')

# Constants
CONFIG = ConfigParser({
        'title': 'The Littlest Blog Engine', 
        'subtitle': '',
        'postsperpage': 15,
        'author': 'Hobo' ,
        'summarydelim': '~~'})
CONFIG.read('config.ini')
TITLE = CONFIG.get('blog', 'title')
SUBTITLE = CONFIG.get('blog', 'subtitle')
POSTS_PER_PAGE = CONFIG.getint('blog', 'postsperpage')
AUTHOR = CONFIG.get('blog', 'author')
SUMMARY_DELIM = CONFIG.get('blog', 'summarydelim')
POSTS = []

# F U N C T I O N S ###########################################################

def setup_database():
    '''
    Creates a fresh table in the database.

    NOTE: This is only run once -- when the server starts.
    '''
    cursor = CONNECTION.cursor()
    cursor.execute(Q_CREATE_TABLE)
    CONNECTION.commit()
    cursor.close()

def process_blog_posts():
    '''
    Migrates the text files contained in the 'posts' directory to the database.
    These files will have their meta-data removed and their markdown
    interpreted and converted to HTML.

    NOTE: This is only run once -- when the server starts.
    '''

    # Add cursor to database
    cursor = CONNECTION.cursor()

    # Open every blog post
    path = 'posts/'
    for input_file in os.listdir(path):
        if RE_VALID_FILE_EXTENSIONS.search(input_file):

            # Extract date from filename
            try:
                (yy, mm, dd) = input_file.split('-')[:3]
                yy = int('20'+yy) if len(yy) is 2 else int(yy)
                mm = int(mm)
                dd = int(dd)
            except:
                LOGGER.warning('Ignoring file <%s>.  Invalid formatting.'%
                        (input_file,))
                continue

            # Validate date
            if yy > 2500 or mm > 12 or dd > 31:
                LOGGER.warning('Ignoring file <%s>.  Invalid date range.'%
                        (input_file,))
                continue

            # Open the file
            file_handle = open(path + input_file, 'r')
            contents = file_handle.read().decode('utf-8')

            # Extract metadata
            article_title = ' '.join(input_file.split('-')[3:])
            article_title = RE_VALID_FILE_EXTENSIONS.sub('', article_title)
            try:
                article_title = RE_ARTICLE_TITLE.findall(contents)[0]
                contents = RE_ARTICLE_TITLE.sub('', contents)
            except:
                LOGGER.warning('Ignoring file <%s>.  Invalid metadata.'%
                        (input_file,))
                continue

            # Strip the contents of supurfluous whitespace -- now that the
            # metatags have been removed.
            contents = contents.strip()

            # Populate the summary
            # Look for the SUMMARY_DELIM character sequence and use it to
            # form the summary, if it exists.  Otherwise, simply take the first
            # paragraph of the post.
            summary = None
            if re.search(SUMMARY_DELIM, contents):  # Use delimiter
                summary = contents.split(SUMMARY_DELIM)[0]
                contents = re.sub(SUMMARY_DELIM, '', contents)
            else:                                   # Use first paragraph
                summary = re.split(r'''[\r\n]{2}''', contents)[0]
            html_summary = markdown(summary)

            # Enter the file into the database
            html_contents = markdown(contents)
            cursor.execute(Q_INSERT_POST, ('%d-%d-%d'%(yy,mm,dd,), 
                article_title, AUTHOR, html_summary, html_contents))

            # Remove the file
            file_handle.close()

    CONNECTION.commit()
    cursor.close()

def place_posts_in_memory():
    cursor = CONNECTION.cursor()
    cursor.execute(Q_SELECT_ALL_POSTS)
    global POSTS
    POSTS = cursor.fetchall()
    cursor.close()


# P A G E   R O U T I N G #####################################################

@route('/')
@route('/<page:int>')
@view('index')
def index(page=0):
    return { 'title': TITLE, 'page': page, 
             'posts': POSTS[page*POSTS_PER_PAGE : (page+1)*POSTS_PER_PAGE],
             'has_prev': (page > 0),
             'has_next': (len(POSTS) > (page+1)*POSTS_PER_PAGE),
            }

@route('/r/<postid:int>')
@view('readpost')
def readpost(postid):
    cursor = CONNECTION.cursor()
    cursor.execute(Q_SELECT_POST, (postid,))
    post = cursor.fetchone()
    return { 'title': TITLE, 
             'post': post }

@route('/files/<filepath:path>')
@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='files')

@error(403)
@view('error')
def error403(code):
    return dict()

@error(404)
@view('error')
def error404(code):
    return dict()

# E X E C U T I O N ###########################################################

setup_database()
process_blog_posts()
place_posts_in_memory()
run(host="0.0.0.0", port=int(os.environ.get("PORT", 5000)))

# E N D   O F   F I L E #######################################################

