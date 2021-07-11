module yurai.prebuild.views.view_resources;

import yurai;

import models;

public final class view_resources : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("resources", request,response, [`resources`]);
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
    setPlaceholder(`title`, `Resources`);
    append(`

<p>Coming soon</p>
`);

    

    return finalizeContent(`layout`,processLayout);
  }
}
