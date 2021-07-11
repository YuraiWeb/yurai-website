```
@(doctype)
@:auto title = "Hello, <World>";
<html>
  <head>
    <title>@=title; - example page</title>
  </head>
  <body>
    <h1>@=title;</h1>
    <h2> Index </h2>

    <ol class="pageindex">
      @:foreach (i; 0 .. 3) {
        <li><a href="#@=i;">Point @=i;</a></li>
      }
    </ol>

    @:foreach (i; 0 .. 3) {
      <h2 id="@=i;">Point @=i;</h2>

      <p>
        These are the <em>contents</em> of point @=i;. Multiple
        lines of text are contained in this paragraph.
      </p>
    }
  </body>
</html>
```
