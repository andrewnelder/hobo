<!DOCTYPE html>
<html>
<head>
  <title>{{title}}: {{post.meta['title']}}</title>
  <link href="/static/styles/theballoonist.css" media="screen" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="body-wrapper">

<div id="blog-title"><a href="/">{{title}}</a></div>

<div class="post">
  <div class="post-title">{{post.meta['title']}}</div>
  <div class="post-date">{{post.date.strftime('%B %d, %Y')}}</div>
  <div class="post-author">{{post.meta['author']}}</div>
  <div class="post-body">{{!post.contents}}</div>
</div>

% if disqus_shortname:
<div id="disqus_thread"></div>
<script type="text/javascript">
    var disqus_shortname = '{{disqus_shortname}}';
    var disqus_developer = 1;
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
% end

<div id="powered-by">
<small>Powered by <a href="http://www.thelittlesthobo.com/">hobo</a>.</small>
</div>

</div>

</body>
</html>
