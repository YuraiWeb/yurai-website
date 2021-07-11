module yurai.prebuild.views.view_blog;

import yurai;

import models;

public final class view_blog : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("blog", request,response, [`blog`]);
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
    setPlaceholder(`title`, `Blog`);
    append(`

<p>Coming soon</p>
`);

    

    return finalizeContent(`layout`,processLayout);
  }
}
