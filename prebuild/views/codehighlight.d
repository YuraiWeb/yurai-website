module yurai.prebuild.views.view_codehighlight;

import yurai;

import models;

public final class view_codehighlight : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("codehighlight", request,response, []);
  }

  override ViewResult generate(bool processLayout)
  {
    

    return generateFinal(processLayout);
  }
  ViewResult generateModel()
  {
    
    return generateFinal(true);
  }
  override ViewResult generateFinal(bool processLayout)
  {
    
    append(`
<link href="/highlightjs/styles/docco.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/languages/d.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/languages/rust.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/languages/go.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/languages/cpp.min.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
`);

    

    return finalizeContent(null,processLayout);
  }
}
