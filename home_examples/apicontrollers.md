### Api Controller

```
import yurai.controllers;

public class Foo
{
  public int x;
  public int y;
}

// The HttpRoute is not necessary.
// If it's not specified then the route becomes the name of the controller without the "Controller" part.
@HttpRoute("test")
public final class TestController : ApiController
{
  public:
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super(request, response);
  }

  @HttpDefault
  Status index()
  {
    auto foo = new Foo;
    foo.x = 100;
    foo.y = 200;

    return json(foo);
  }
}
```

Learn more about [API controllers](/docs/specifications/controllers)
