<!DOCTYPE html>
<html>
<head>
  <title>{{title}}: {{post.get_title()}}</title>
</head>
<body>
<div class="post">
  <div class="post-date">{{post.get_date().strftime('%B %d, %Y')}}</div>
  <div class="post-title">{{post.get_title()}}</div>
  <div class="post-author">{{post.get_author()}}</div>
  <div class="post-body">{{!post.get_contents()}}</div>
</div>
Powered by <a href="http://www.littlestblog.com">hobo</a>.
</body>
</html>
