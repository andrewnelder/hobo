<!DOCTYPE html>
<html>
<head>
  <title>{{title}}</title>
</head>
<body>
% for key in key_list:
  <div class="post">
    <div class="post-date">{{posts[key].get_date().strftime('%B %d, %Y')}}</div>
    <div class="post-title">
      <a href="{{posts[key].get_locator()}}">{{posts[key].get_title()}}</a>
    </div>
    <div class="post-author">{{posts[key].get_author()}}</div>
    <div class="post-summary">{{!posts[key].get_summary()}}</div>
  </div>
% end
<div id="page-navigation">
{{!'<a href="/'+(str(page-1))+'">Previous</a>' if has_prev else 'Previous'}} | 
{{!'<a href="/'+(str(page+1))+'">Next</a>' if has_next else 'Next'}}
</div>
<div>
Powered by <a href="thelittlesthobo.com">hobo</a>.
</div>
</body>
</html>
