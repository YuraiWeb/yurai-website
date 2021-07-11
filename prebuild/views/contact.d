module yurai.prebuild.views.view_contact;

import yurai;

import models;

public final class view_contact : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("contact", request,response, [`contact`]);
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
    setPlaceholder(`title`, `Contact`);
    append(`

<p>Coming soon</p>
`);

    

    return finalizeContent(`layout`,processLayout);
  }
}
