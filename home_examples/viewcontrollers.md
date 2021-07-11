### View Controller

```
import yurai.controllers;

public final class HomeController(View) : WebController!View
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
    // Do stuff with view, request, response ...
    // Returns Status.success to render the view ...
    return Status.success;
  }
}
```

Learn more about [view controllers](/docs/specifications/view-integration)
