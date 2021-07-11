module yurai.prebuild.views.view_specifications;

import yurai;

import models;

public final class view_specifications : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("specifications", request,response, [`docs/specifications`,`docs/specifications/acl`,`docs/specifications/actions`,`docs/specifications/advanced-web`,`docs/specifications/authentication`,`docs/specifications/backend`,`docs/specifications/backups`,`docs/specifications/basics`,`docs/specifications/configurations`,`docs/specifications/controllers`,`docs/specifications/cookies`,`docs/specifications/csrf-protection`,`docs/specifications/custom-logging`,`docs/specifications/data`,`docs/specifications/database-logging`,`docs/specifications/database-mysql-orm`,`docs/specifications/error-handling`,`docs/specifications/file-logging`,`docs/specifications/frontend`,`docs/specifications/http-request`,`docs/specifications/http-response`,`docs/specifications/http-server`,`docs/specifications/layouts`,`docs/specifications/logging`,`docs/specifications/mails`,`docs/specifications/mapping`,`docs/specifications/mocking`,`docs/specifications/models`,`docs/specifications/mongodb`,`docs/specifications/network`,`docs/specifications/partial-views`,`docs/specifications/project-setup`,`docs/specifications/publishing-cloud`,`docs/specifications/publishing`,`docs/specifications/redirections`,`docs/specifications/rest`,`docs/specifications/routing`,`docs/specifications/security`,`docs/specifications/seo`,`docs/specifications/sessions`,`docs/specifications/setup`,`docs/specifications/static-files`,`docs/specifications/templates-syntax`,`docs/specifications/transactions`,`docs/specifications/unittesting`,`docs/specifications/upload`,`docs/specifications/validation`,`docs/specifications/version-control`,`docs/specifications/view-integration`,`docs/specifications/view-models`,`docs/specifications/views`,`docs/specifications/virtual-html-elements`,`docs/specifications/web-api`,`docs/specifications/websockets`]);
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
    setPlaceholder(`title`, `Specifications`);
    
  string docName = request.path[$-1];

  SideMenu sideMenu;
  string[] errorMessages;
  auto parsedMenu = deserializeJsonSafe!SideMenu(readText("config/specificationsmenu.json"), sideMenu, errorMessages);

  if (!parsedMenu || (errorMessages && errorMessages.length))
  {
    parsedMenu = false;
    writeln(errorMessages);
  }

  import vibe.textfilter.markdown;

  auto docPath = "docs/" ~ docName ~ ".md";

  string html;
  if (exists(docPath)) {
    html = filterMarkdown(readText(docPath), MarkdownFlags.backtickCodeBlocks | MarkdownFlags.tables);
  }
  else
  {
    html = "Missing documentation: " ~ docName;
  }

append(`

<div class="row">

  `);
renderPartial(`codehighlight`);
append(`

  `);
if (parsedMenu) {
renderPartialModel!`sidemenu`(sideMenu);
append(`
  `);
}
append(`

  <div class="side-menu-content col-md-8 col-sm-12">
    <div>
      `);
auto pathBuilder = "";
foreach (i; 0 .. request.path.length) {
if (i > 0) {
auto path = request.path[i-1];
pathBuilder ~= "/" ~ path;
append(`
          <a href="`);
append(pathBuilder);
append(`">`);
escaped(path);
append(`</a> →
        `);
}
}
auto lastPath = request.path[$-1];
pathBuilder ~= "/" ~ lastPath;
append(`
      <a href="`);
append(pathBuilder);
append(`">`);
escaped(lastPath);
append(`</a>
    </div>

    <div>
      `);
append(html);
append(`
    </div>
  </div>
</div>
`);

    

    return finalizeContent(`layout`,processLayout);
  }
}
