module yurai.prebuild.views.view_css_footer;

import yurai;

import models;

public final class view_css_footer : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("css_footer", request,response, []);
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
footer {
  width: 100%;
  min-height: 222px;
  background-color: rgb(221,254,228);
  padding: 16px;
  border-top: 1px solid #ccc;
}

footer .row {
  margin-left: auto;
  margin-right: auto;
  max-width: 90%;
}

footer .footer-links {
  text-align: center;
}

footer .footer-links span {
  font-weight: bold;
}

footer .footer-links ul {
  list-style-type: none;
  padding: 4px;
  margin: 4px;
}

footer .footer-links ul li a {
  color: rgba(0,0,0,.55);
}

footer .footer-copyright {
  font-size: 0.8rem;
  text-align: center;
  margin-top: 12px;
  margin-bottom: 12px;
}

footer .footer-copyright span {
  font-weight: bold;
}
`);

    setContentType("text/css");

    return finalizeContent(null,processLayout);
  }
}
