module yurai.prebuild.views.view_css_home;

import yurai;

import models;

public final class view_css_home : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("css_home", request,response, []);
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
.top-content {
  border-bottom: 1px solid #ccc;
  margin-left: 8px;
  margin-right: 8px;
}

.example-content {
  padding: 8px;
}

.examples .nav-link {
  color: #58D68D;
}

.examples .nav-link.active {
  color: #000;
}

@media (max-width: 768px) {
  .examples-container {
    order: 1;
  }

  .introduction-container {
    order: 2;
  }
}

#examples_diet pre, #examples_yurai pre {
  max-width: 100%;
}
`);

    setContentType("text/css");

    return finalizeContent(null,processLayout);
  }
}
