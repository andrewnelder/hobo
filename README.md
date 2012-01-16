## Background

Hobo is an ultra-lightweight blog engine written in Python.  It has two
dependencies, fully integrated into the codebase with no additional
downloads: bottle.py and markdown2.  Because of this fact, it is
extremely customizable and can be extended to incorporate all kinds of
scripts designed for the very popular bottle.py web framework.

Hobo is based on the wonderful software designed by Alexis Sellier named
[toto](http://www.cloudhead.io/toto), written in Ruby.  Additionally,
special thanks goes to [clownfart](http://www.github.com/clownfart) for
his amazing work on
[markdown.css](https://github.com/clownfart/Markdown-CSS) which was used as a framework for the primary css-theme.

## Features

- About 300kb in size.
- No extra dependencies or installations.
- Easy to deploy.
- No knowledge of HTML necessary.
- Pre-packaged with a stylish theme called [theballoonist.css](http://www.imdb.com/title/tt0633266/).
- No databases.
- Supports plain-text, html, or [markdown](http://daringfireball.net/projects/markdown/).
- Supports static file serving (images, videos, documents, etc.).

## Installation and Setup

It's pretty much the easiest thing in the world to setup.  It can run as
a standalone client by changing the heroku flag in the ```config.ini```
file to 'off' and then simply calling:


### Deploy Locally
```
$ git clone git@github.com:andrewnelder/hobo.git
$ cd hobo
$ python hobo.py
```

That being said, it's designed for use with heroku.  All you need to do
is:


### Deploy on Heroku

```
$ git clone git@github.com:andrewnelder/hobo.git personal-blog
$ cd personal-blog
$ heroku create --stack cedar personal-blog
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

### Upload Changes to Heroku
```
$ git add .
$ git commit -am 'Added a new blog post.'
$ git push heroku master
```

Copyright (c) 2012 Andrew Nelder.  Licensed under the MIT License.

>Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:
>
>The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
>
>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
