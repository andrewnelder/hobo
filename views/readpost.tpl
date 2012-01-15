<!DOCTYPE html>
<html>
<head>
  <title>{{title}}: {{post.get_title()}}</title>
  <link href='http://fonts.googleapis.com/css?family=Overlock+SC' rel='stylesheet' type='text/css' />
  <link href='http://fonts.googleapis.com/css?family=Oldenburg' rel='stylesheet' type='text/css' />
  <link href="/static/styles/theballoonist.css" media="screen" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="body-wrapper">

<div id="blog-title"><a href="/">{{title}}</a></div>

<div class="post">
  <div class="post-title">{{post.get_title()}}</div>
  <div class="post-date">{{post.get_date().strftime('%B %d, %Y')}}</div>
  <div class="post-author">{{post.get_author()}}</div>
  <div class="post-body">{{!post.get_contents()}}</div>
</div>

<div id="powered-by">
<small>Powered by <a href="http://www.thelittlesthobo.com/">hobo</a>.</small>
</div>

</div>

</body>
</html>
