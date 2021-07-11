module yurai.prebuild.views.view_about;

import yurai;

import models;

public final class view_about : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("about", request,response, [`about`]);
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
    setPlaceholder(`title`, `About`);
    append(`

<p>Coming soon</p>
`);

    

    return finalizeContent(`layout`,processLayout);
  }
}
