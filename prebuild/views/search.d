module yurai.prebuild.views.view_search;

import yurai;

import models;

public final class view_search : View
{
  public:
  string[] model;
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("search", request,response, [`search`]);
  }

  override ViewResult generate(bool processLayout)
  {
    import controllers;
auto controller = new SearchController!(view_search)(this, request, response);
auto status = controller.handle();
if (status == Status.end) return new ViewResult();
if (status == Status.notFound) return null;

    return generateFinal(processLayout);
  }
  ViewResult generateModel(string[] model)
  {
    this.model = model;
    return generateFinal(true);
  }
  override ViewResult generateFinal(bool processLayout)
  {
    
    
  auto searchQuery = request.getQuery("q");
  if (!searchQuery)
  {
    searchQuery = "";
  }

append(`

<h2>Search</h2>

<div class="search-result">
  <div class="search-result-query">
    Search query: <span>`);
append(searchQuery);
append(`</span>
  </div>
  <div class="search-result-total">
    Total results: <span class="search-result-count">`);
escaped(model.length);
append(`</span>
  </div>
  <ul class="search-result-list">
    `);
foreach (result; model) {
append(`      <li><a href="`);
escaped(result);
append(`">`);
escaped(result);
append(`</a></li>
    `);
}
append(`
  </ul>
</div>
`);

    

    return finalizeContent(`layout`,processLayout);
  }
}
