module yurai.prebuild.views.view_404;

import yurai;

import models;

public final class view_404 : View
{
  public:
  string model;
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("404", request,response, []);
  }

  override ViewResult generate(bool processLayout)
  {
    

    return generateFinal(processLayout);
  }
  ViewResult generateModel(string model)
  {
    this.model = model;
    return generateFinal(true);
  }
  override ViewResult generateFinal(bool processLayout)
  {
    setPlaceholder(`title`, `Not Found`);
    append(`

<p>Not Found</p>
`);

    

    return finalizeContent(`layout`,processLayout);
  }
}
