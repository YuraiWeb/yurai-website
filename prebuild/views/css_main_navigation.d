module yurai.prebuild.views.view_css_main_navigation;

import yurai;

import models;

public final class view_css_main_navigation : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("css_main_navigation", request,response, []);
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
    
    
  auto maxWidth = "100%";

append(`
.main-navigation {
  background-color: rgb(221,254,228) !important;
  padding-top: 0;
}

.main-navigation .navbar-brand img {
  height: 42px;
  width: auto;
}

.main-navigation .navbar-collapse,
.main-navigation .navbar-toggler {
  margin-top: 7px;
}
`);

    setContentType("text/css");

    return finalizeContent(null,processLayout);
  }
}
