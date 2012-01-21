<!DOCTYPE html>
<html>
<head>
  <title>{{title}}</title>
  <link href="/static/styles/theballoonist.css" media="screen" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="body-wrapper">
<div id="blog-title"><a href="/">{{title}}</a></div>
% for post in posts:
  <div class="post">
    <div class="post-title">
      <a href="{{post.locator}}">{{post.meta['title']}}</a>
    </div>
    <div class="post-date">{{post.date.strftime('%B %d, %Y')}}</div>
    <div class="post-author">{{post.meta['author']}}</div>
    <div class="post-summary">
      {{!post.summary}}
      <div class="post-more-link">
        <a href="{{post.locator}}">...more</a>
      </div>
    </div>
  </div>
% end

<div id="page-navigation">
{{!'<a href="/'+(str(page-1))+'">Previous</a>' if has_prev else 'Previous'}} | 
{{!'<a href="/'+(str(page+1))+'">Next</a>' if has_next else 'Next'}}
</div>

<div id="powered-by">
<small>Powered by <a href="http://www.thelittlesthobo.com/">hobo</a>.</small>
</div>

</div>
</body>
</html>
