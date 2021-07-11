module yurai.prebuild.views.view_contribute;

import yurai;

import models;

public final class view_contribute : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("contribute", request,response, [`resources/contribute`]);
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
    setPlaceholder(`title`, `Contribute`);
    append(`

<p>Coming soon</p>
`);

    

    return finalizeContent(`layout`,processLayout);
  }
}
