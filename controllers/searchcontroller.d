module controllers.searchcontroller;

import yurai.controllers;

import models;

public final class SearchController(View) : WebController!View
{
  public:
  final:
  this(View view, IHttpRequest request, IHttpResponse response)
  {
    super(view, request, response);
  }

  @HttpDefault
  Status index()
  {
    import std.algorithm : canFind;
    import std.string : toLower;

    string[] results = [];

    auto searchQuery = request.hasQuery("q") ? request.getQuery("q") : "";

    if (searchQuery && searchQuery.length)
    {
      import yurai.prebuild.viewsmap;

      auto routes = getAllRoutes();

      foreach (route; routes)
      {
        if (route == "search")
        {
          continue;
        }

        auto result = processView(route, request, response, false);

        if (result.content !is null && result.content.length)
        {
          if (result.content.toLower.canFind(searchQuery.toLower))
          {
            results ~= route.startsWith("/") ? route : ("/" ~ route);
          }
        }
      }
    }

    view.model = results;

    return Status.success;
  }
}
