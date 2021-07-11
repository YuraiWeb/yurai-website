module yurai.prebuild.views.view_downloads;

import yurai;

import models;

public final class view_downloads : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("downloads", request,response, [`downloads`]);
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
    setPlaceholder(`title`, `Downloads`);
    append(`

<p>Coming soon</p>
`);

    

    return finalizeContent(`layout`,processLayout);
  }
}
