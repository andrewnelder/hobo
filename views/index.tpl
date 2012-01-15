<!DOCTYPE html>
<html>
<head>
  <title>{{title}}</title>
  <link href='http://fonts.googleapis.com/css?family=Overlock+SC' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Oldenburg' rel='stylesheet' type='text/css'>
  <link href="/static/styles/theballoonist.css" media="screen" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="body-wrapper">
<div id="blog-title"><a href="/">{{title}}</a></div>
% for key in key_list:
  <div class="post">
    <div class="post-title">
      <a href="{{posts[key].get_locator()}}">{{posts[key].get_title()}}</a>
    </div>
    <div class="post-date">{{posts[key].get_date().strftime('%B %d, %Y')}}</div>
    <div class="post-author">{{posts[key].get_author()}}</div>
    <div class="post-summary">
      {{!posts[key].get_summary()}}
      <div class="post-more-link">
        <a href="{{posts[key].get_locator()}}">...more</a>
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
