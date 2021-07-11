module yurai.prebuild.views.view_donate;

import yurai;

import models;

public final class view_donate : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("donate", request,response, [`donate`]);
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
    setPlaceholder(`title`, `Donate`);
    append(`

<p>Coming soon</p>
`);

    

    return finalizeContent(`layout`,processLayout);
  }
}
