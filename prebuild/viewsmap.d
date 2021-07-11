module yurai.prebuild.viewsmap;

  import yurai.prebuild.views;
  import yurai.views;
  import yurai.core;

  string[] getAllRoutes()
  {
    return [`about`,`blog`,`contact`,`docs/api`,`docs`,`docs/specifications`,`docs/specifications/acl`,`docs/specifications/actions`,`docs/specifications/advanced-web`,`docs/specifications/authentication`,`docs/specifications/backend`,`docs/specifications/backups`,`docs/specifications/basics`,`docs/specifications/configurations`,`docs/specifications/controllers`,`docs/specifications/cookies`,`docs/specifications/csrf-protection`,`docs/specifications/custom-logging`,`docs/specifications/data`,`docs/specifications/database-logging`,`docs/specifications/database-mysql-orm`,`docs/specifications/error-handling`,`docs/specifications/file-logging`,`docs/specifications/frontend`,`docs/specifications/http-request`,`docs/specifications/http-response`,`docs/specifications/http-server`,`docs/specifications/layouts`,`docs/specifications/logging`,`docs/specifications/mails`,`docs/specifications/mapping`,`docs/specifications/mocking`,`docs/specifications/models`,`docs/specifications/mongodb`,`docs/specifications/network`,`docs/specifications/partial-views`,`docs/specifications/project-setup`,`docs/specifications/publishing-cloud`,`docs/specifications/publishing`,`docs/specifications/redirections`,`docs/specifications/rest`,`docs/specifications/routing`,`docs/specifications/security`,`docs/specifications/seo`,`docs/specifications/sessions`,`docs/specifications/setup`,`docs/specifications/static-files`,`docs/specifications/templates-syntax`,`docs/specifications/transactions`,`docs/specifications/unittesting`,`docs/specifications/upload`,`docs/specifications/validation`,`docs/specifications/version-control`,`docs/specifications/view-integration`,`docs/specifications/view-models`,`docs/specifications/views`,`docs/specifications/virtual-html-elements`,`docs/specifications/web-api`,`docs/specifications/websockets`,`donate`,`downloads`,`/`,`index`,`resources/contribute`,`resources/examples`,`resources/faq`,`resources/help`,`resources`,`resources/tutorials`,`search`,`sponsors`,`css/main.css`];
  }

  View getView(string name, IHttpRequest request, IHttpResponse response)
  {
    switch (name)
    {
      case "404":
        return new view_404(request, response);
      case "about":
        return new view_about(request, response);
      case "blog":
        return new view_blog(request, response);
      case "codehighlight":
        return new view_codehighlight(request, response);
      case "contact":
        return new view_contact(request, response);
      case "api":
        return new view_api(request, response);
      case "docs":
        return new view_docs(request, response);
      case "specifications":
        return new view_specifications(request, response);
      case "donate":
        return new view_donate(request, response);
      case "downloads":
        return new view_downloads(request, response);
      case "home":
        return new view_home(request, response);
      case "layout":
        return new view_layout(request, response);
      case "navigation":
        return new view_navigation(request, response);
      case "contribute":
        return new view_contribute(request, response);
      case "examples":
        return new view_examples(request, response);
      case "gaq":
        return new view_gaq(request, response);
      case "help":
        return new view_help(request, response);
      case "resources":
        return new view_resources(request, response);
      case "tutorials":
        return new view_tutorials(request, response);
      case "search":
        return new view_search(request, response);
      case "sidemenu":
        return new view_sidemenu(request, response);
      case "sponsors":
        return new view_sponsors(request, response);
      case "css_cover":
        return new view_css_cover(request, response);
      case "css_footer":
        return new view_css_footer(request, response);
      case "css_home":
        return new view_css_home(request, response);
      case "css_main_navigation":
        return new view_css_main_navigation(request, response);
      case "css_main":
        return new view_css_main(request, response);
      case "css_side_menu":
        return new view_css_side_menu(request, response);

      default:
        return null;
    }
  }

  ViewResult processView(string route, IHttpRequest request, IHttpResponse response, bool processLayout = true)
  {
    switch (route)
    {
      case "about":
        return new view_about(request, response).generate(processLayout);
      case "blog":
        return new view_blog(request, response).generate(processLayout);
      case "contact":
        return new view_contact(request, response).generate(processLayout);
      case "docs/api":
        return new view_api(request, response).generate(processLayout);
      case "docs":
        return new view_docs(request, response).generate(processLayout);
      case "docs/specifications":
      case "docs/specifications/acl":
      case "docs/specifications/actions":
      case "docs/specifications/advanced-web":
      case "docs/specifications/authentication":
      case "docs/specifications/backend":
      case "docs/specifications/backups":
      case "docs/specifications/basics":
      case "docs/specifications/configurations":
      case "docs/specifications/controllers":
      case "docs/specifications/cookies":
      case "docs/specifications/csrf-protection":
      case "docs/specifications/custom-logging":
      case "docs/specifications/data":
      case "docs/specifications/database-logging":
      case "docs/specifications/database-mysql-orm":
      case "docs/specifications/error-handling":
      case "docs/specifications/file-logging":
      case "docs/specifications/frontend":
      case "docs/specifications/http-request":
      case "docs/specifications/http-response":
      case "docs/specifications/http-server":
      case "docs/specifications/layouts":
      case "docs/specifications/logging":
      case "docs/specifications/mails":
      case "docs/specifications/mapping":
      case "docs/specifications/mocking":
      case "docs/specifications/models":
      case "docs/specifications/mongodb":
      case "docs/specifications/network":
      case "docs/specifications/partial-views":
      case "docs/specifications/project-setup":
      case "docs/specifications/publishing-cloud":
      case "docs/specifications/publishing":
      case "docs/specifications/redirections":
      case "docs/specifications/rest":
      case "docs/specifications/routing":
      case "docs/specifications/security":
      case "docs/specifications/seo":
      case "docs/specifications/sessions":
      case "docs/specifications/setup":
      case "docs/specifications/static-files":
      case "docs/specifications/templates-syntax":
      case "docs/specifications/transactions":
      case "docs/specifications/unittesting":
      case "docs/specifications/upload":
      case "docs/specifications/validation":
      case "docs/specifications/version-control":
      case "docs/specifications/view-integration":
      case "docs/specifications/view-models":
      case "docs/specifications/views":
      case "docs/specifications/virtual-html-elements":
      case "docs/specifications/web-api":
      case "docs/specifications/websockets":
        return new view_specifications(request, response).generate(processLayout);
      case "donate":
        return new view_donate(request, response).generate(processLayout);
      case "downloads":
        return new view_downloads(request, response).generate(processLayout);
      case "/":
      case "index":
        return new view_home(request, response).generate(processLayout);
      case "resources/contribute":
        return new view_contribute(request, response).generate(processLayout);
      case "resources/examples":
        return new view_examples(request, response).generate(processLayout);
      case "resources/faq":
        return new view_gaq(request, response).generate(processLayout);
      case "resources/help":
        return new view_help(request, response).generate(processLayout);
      case "resources":
        return new view_resources(request, response).generate(processLayout);
      case "resources/tutorials":
        return new view_tutorials(request, response).generate(processLayout);
      case "search":
        return new view_search(request, response).generate(processLayout);
      case "sponsors":
        return new view_sponsors(request, response).generate(processLayout);
      case "css/main.css":
        return new view_css_main(request, response).generate(processLayout);

      default:
        return null;
    }
  }
