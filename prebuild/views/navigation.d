module yurai.prebuild.views.view_navigation;

import yurai;

import models;

public final class view_navigation : View
{
  public:
  Navigation model;
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("navigation", request,response, []);
  }

  override ViewResult generate(bool processLayout)
  {
    

    return generateFinal(processLayout);
  }
  ViewResult generateModel(Navigation model)
  {
    this.model = model;
    return generateFinal(true);
  }
  override ViewResult generateFinal(bool processLayout)
  {
    
    
  void createIcon(string icon, string color1, string color2) {
    if (!icon || !icon.length) {
      return;
    }

    append(" <i class=\"");
    append(icon);
    append("\"");

    if ((color1 && color1.length) || (color2 && color2.length)) {
      append(" style=\"");

      if (color1 && color1.length) {
        append("--fa-primary-color: " ~ color1 ~ ";");
      }

      if (color2 && color2.length) {
        append("--fa-secondary-color: " ~ color2 ~ ";");
      }

      append("\"");
    }

    append("></i>");
  }

append(`
<nav class="navbar navbar-expand-lg navbar-light bg-light `);
append(model.cls);
append(`">
  `);
auto mainNavigationToggleContent = model.name ~ "_navbarSupportedContent";
append(`  <div class="container-fluid">
    <a class="navbar-brand" href="/">
      <img src="/images/logo.png" alt="Yurai Logo" width="155" height="42">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#`);
append(mainNavigationToggleContent);
append(`" aria-controls="`);
append(mainNavigationToggleContent);
append(`" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="`);
append(mainNavigationToggleContent);
append(`">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        `);
foreach (item; model.items) {
auto isActive = (request.path[0] == item.link || (request.path[0] == "index" && item.link == "/"));
if (item.subItems && item.subItems.length) {
append(`            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle `);
append((isActive ? "active" : ""));
append(`"`);
append((isActive ? " aria-current=\"page\"" : ""));
append(`" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              `);
escaped(item.text);
append(`
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                `);
foreach (subItem; item.subItems) {
if (subItem.isDivider) {
append(`                    <li><hr class="dropdown-divider"></li>
                  `);
}
else {
auto isSubLink = subItem.link.startsWith("/");
auto subItemLink = isSubLink ? (item.link ~ subItem.link) : subItem.link;
append(`                    <li><a class="dropdown-item" href="`);
append(subItemLink);
append(`"`);
append((!isSubLink ? " target=\"_blank\" rel=\"noopener noreferrer\"" : ""));
append(`>`);
escaped(subItem.text);
createIcon(subItem.icon, subItem.iconColor1, subItem.iconColor2);
append(`</a></li>
                  `);
}
}
append(`
              </ul>
            </li>
          `);
}
else {
append(`            <li class="nav-item">
              <a class="nav-link `);
append((isActive ? "active" : ""));
append(`"`);
append((isActive ? " aria-current=\"page\"" : ""));
append(` href="`);
append(item.link);
append(`">`);
escaped(item.text);
createIcon(item.icon, item.iconColor1, item.iconColor2);
append(`</a>
            </li>
          `);
}
}
append(`
      </ul>
      `);
if (model.showSearch) {
append(`        <form class="d-flex">
          <script>
            function performSearch() {
              var query = $('#searchquery').val() || "";

              if (!query || !query.trim().length) {
                return;
              }

              window.location.href = "/search?q=" + query;
            }
          </script>
          <input id="searchquery" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="button" onclick="performSearch();">Search</button>
        </form>
        <script>
          $(document).ready(function() {
            $('#searchquery').keypress(function(e){
              if ( e.which == 13 ) {
                performSearch();
                
                e.preventDefault();
                return false;
              }
            });
          });
        </script>
      `);
}
append(`
    </div>
  </div>
</nav>
`);

    

    return finalizeContent(null,processLayout);
  }
}
