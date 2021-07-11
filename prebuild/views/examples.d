module yurai.prebuild.views.view_examples;

import yurai;

import models;

public final class view_examples : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("examples", request,response, [`resources/examples`]);
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
    setPlaceholder(`title`, `Examples`);
    append(`

<p>Coming soon</p>
`);

    

    return finalizeContent(`layout`,processLayout);
  }
}
