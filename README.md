## Background

Hobo is an ultra-lightweight blog engine written in Python.  It has two
dependencies, fully integrated into the codebase with no additional
downloads: bottle.py and markdown2.  Because of this fact, it is
extremely customizable and can be extended to incorporate all kinds of
scripts designed for the very popular bottle.py web framework.

Hobo is based on the wonderful software designed by Alexis Sellier named
(toto)[http://www.cloudhead.io/toto], written in Ruby.


## Installation and Setup

It's pretty much the easiest thing in the world to setup.  It can run as
a standalone client simply calling:


### Deploy Locally

'''
$ git clone git@github.com:andrewnelder/hobo.git
$ cd hobo
$ python hobo.py
'''

That being said, it's designed for use with heroku.  All you need to do
is:


### Deploy on Heroku

```
$ git clone git@github.com:andrewnelder/hobo.git personal-blog
$ cd personal-blog
$ heroku create personal-blog
$ git push heroku master
```


## Usage

Once you've got everything nicely configured -- the next step is easy.
Take a peek in the ```config.ini``` file and make sure everything there
adds up.  All that really needs to be configured are the 'title' and
'author' fields.

Then all you need to do is make your first blog-post.  Just like toto,
all it takes is putting a .txt, .md, or .markdown file in the posts
directory.  The file name should be in the form:

### Filename
```

# Format
$ YYYY-MM-DD-blog-post-title.md

# Example
$ 1984-10-21-good-books-are-hard-to-find.md

```

Then put it on heroku!

```
$ git add .
$ git commit -am 'Added a new blog post.'
$ git push heroku master
```

