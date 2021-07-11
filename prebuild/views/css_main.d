module yurai.prebuild.views.view_css_main;

import yurai;

import models;

public final class view_css_main : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("css_main", request,response, [`css/main.css`]);
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
main {
  max-width: `);
append(maxWidth);
append(` !important;
  margin-bottom: 16px;
  min-height: 80vh;
}

pre {
  padding: 8px;
  border: 1px solid #eee;
  border-radius: 6px;
  max-width: 512px;
}

table {
  max-width: 90%;
}

.base-content {
  padding: 12px 8px 8px 8px;
}

.base-content h2 {
  margin-bottom: 16px;
}

.accordion-breadcrumb {
  font-size: 1.2rem;
  font-style: italic;
  font-weight: bold;
  margin-bottom: 24px;
}

.base-note {
  font-size: 0.8rem;
  font-style: italic;
}

.bold-content {
  font-weight: bold;
}

@media (max-width: 1220px) {
  .table-responsive-content {
    overflow-x: auto;
    overflow-y: hidden;
  }
}

@media (max-width: 768px) {
  .table-responsive-content {
    overflow-x: auto;
    overflow-y: auto;
    height: 512px;
    border: 1px solid #ccc;
  }
}

`);
renderPartial(`css_main_navigation`);
append(`
`);
renderPartial(`css_side_menu`);
append(`
`);
renderPartial(`css_cover`);
append(`
`);
renderPartial(`css_home`);
append(`
`);
renderPartial(`css_footer`);
append(`
`);

    setContentType("text/css");

    return finalizeContent(null,processLayout);
  }
}
