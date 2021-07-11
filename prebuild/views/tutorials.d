module yurai.prebuild.views.view_tutorials;

import yurai;

import models;

public final class view_tutorials : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("tutorials", request,response, [`resources/tutorials`]);
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
    setPlaceholder(`title`, `Tutorials`);
    append(`

<p>Coming soon</p>
`);

    

    return finalizeContent(`layout`,processLayout);
  }
}
