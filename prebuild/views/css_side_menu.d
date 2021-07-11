module yurai.prebuild.views.view_css_side_menu;

import yurai;

import models;

public final class view_css_side_menu : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("css_side_menu", request,response, []);
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
.side-menu {
  background-color: rgb(221,254,228) !important;
}

.side-menu-mobile {
  display: none;
}

@media (max-width: 880px) {
  .side-menu {
    width: 100% !important;
    margin: 0 !important;
    min-height: 0 !important;
  }

  .side-content {
    width: 100% !important;
    margin: 0 !important;
  }

  .side-menu-items {
    display: none;
  }

  .side-menu-mobile {
    display: block;
  }

  .side-menu-header {
    text-align: center;
  }

  .side-menu-header-text {
    display: block;
    width: 100%;
  }
}

.side-menu .list-unstyled.ps-0 div {
  margin-left: 12px;
}

.side-menu-mobile {
  text-align: center;
}

.side-menu-content {
  overflow-x: hidden;
  overflow-y: hidden;
}
`);

    setContentType("text/css");

    return finalizeContent(null,processLayout);
  }
}
