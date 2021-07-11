module yurai.prebuild.views.view_api;

import yurai;

import models;

public final class view_api : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("api", request,response, [`docs/api`]);
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
    setPlaceholder(`title`, `Api`);
    append(`

<p>Coming soon</p>
`);

    

    return finalizeContent(`layout`,processLayout);
  }
}
