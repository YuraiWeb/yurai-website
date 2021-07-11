module yurai.prebuild.views.view_sponsors;

import yurai;

import models;

public final class view_sponsors : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("sponsors", request,response, [`sponsors`]);
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
    setPlaceholder(`title`, `Sponsors`);
    append(`

<p>Coming soon</p>
`);

    

    return finalizeContent(`layout`,processLayout);
  }
}
