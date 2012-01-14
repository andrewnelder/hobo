<!DOCTYPE html>
<html>
<head>
  <title>{{title}}</title>
</head>
<body>
% for post in posts:
  <div class="post">
    <div class="post-date">{{post[1]}}</div>
    <div class="post-title">
      <a href="/r/{{post[0]}}">{{post[2]}}</a>
    </div>
    <div class="post-author">{{post[3]}}</div>
    <div class="post-summary">{{!post[4]}}</div>
  </div>
% end
{{!'<a href="/'+(str(page-1))+'">Previous</a>' if has_prev else 'Previous'}} | 
{{!'<a href="/'+(str(page+1))+'">Next</a>' if has_next else 'Next'}}
Powered by <a href="thelittlesthobo.com">hobo</a>.
</body>
</html>
