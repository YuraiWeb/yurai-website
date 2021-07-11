module yurai.prebuild.views.view_gaq;

import yurai;

import models;

public final class view_gaq : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("gaq", request,response, [`resources/faq`]);
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
    setPlaceholder(`title`, `FAQ`);
    append(`

<p>Coming soon</p>
`);

    

    return finalizeContent(`layout`,processLayout);
  }
}
