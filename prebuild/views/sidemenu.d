module yurai.prebuild.views.view_sidemenu;

import yurai;

import models;

public final class view_sidemenu : View
{
  public:
  SideMenu model;
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("sidemenu", request,response, []);
  }

  override ViewResult generate(bool processLayout)
  {
    

    return generateFinal(processLayout);
  }
  ViewResult generateModel(SideMenu model)
  {
    this.model = model;
    return generateFinal(true);
  }
  override ViewResult generateFinal(bool processLayout)
  {
    
    
  auto basePath = model.basePath ? model.basePath : "";

  void createIcon(string icon, string color1, string color2) {
    if (!icon || !icon.length) {
      return;
    }

    append(" <i class=\"");
    append(icon);
    append("\"");

    if ((!color1 || !color1.length) && (!color2 || !color2.length)) {
      color1 = "#16A085";
      color2 = "#28B463";
    }

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
<script>
  function showSideManu() {
    if ($('.side-menu-toggler').hasClass('fa-chevron-down')) {
      $('.side-menu-toggler').removeClass('fa-chevron-down');
      $('.side-menu-toggler').addClass('fa-chevron-up');
    } else {
      $('.side-menu-toggler').removeClass('fa-chevron-up');
      $('.side-menu-toggler').addClass('fa-chevron-down');
    }

    $('.side-menu-items').slideToggle();
  }
</script>

<div class="col-md-4 col-sm-12 flex-shrink-0 p-3 bg-white side-menu" style="width: 280px;min-height:100vh;">
  <div class="side-menu-header">
    <a href="#" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <span class="fs-5 fw-semibold side-menu-header-text">`);
escaped(model.title);
append(`</span>
    </a>
  </div>
  <div class="side-menu-mobile">
    <a href="#" onclick="showSideManu();">
      <i class="side-menu-toggler fad fa-chevron-down" style="--fa-primary-color: #16A085; --fa-secondary-color: #28B463;"></i>
    </a>
  </div>
  <ul class="side-menu-items list-unstyled ps-0">
    `);
auto collapseId = 0;
foreach (item; model.items) {
collapseId++;
if (item.isSeparator) {
append(`        <li class="border-top my-3"></li>
      `);
}
else {
append(`        <li class="mb-1">
          <button class="btn btn-toggle align-items-center rounded" data-bs-toggle="collapse" data-bs-target="#collapse_`);
append(collapseId);
append(`" aria-expanded="true">
            `);
escaped(item.text);
createIcon(item.icon, item.iconColor1, item.iconColor2);
append(`
          </button>
          `);
if (item.links && item.links.length) {
append(`            <div class="collapse show" id="collapse_`);
append(collapseId);
append(`" style="">
              <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                `);
foreach (link; item.links) {
append(`                  <li><a href="`);
append(basePath);
append(link.link);
append(`" class="link-dark rounded">`);
escaped(link.text);
createIcon(link.icon, link.iconColor1, link.iconColor2);
append(`</a></li>
                `);
}
append(`
              </ul>
            </div>
          `);
}
append(`
        </li>
      `);
}
}
append(`
  </ul>
</div>
`);

    

    return finalizeContent(null,processLayout);
  }
}
