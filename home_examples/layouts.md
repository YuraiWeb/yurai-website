### views/layout.dd

```
@[name: layout]
@(website | My Website)
@(doctype)
<html>
<head>
  <title>@(title) | @(website)</title>
</head>
<body>
  @(view)
</body>
</html>
```

Learn more about [layouts](/docs/specifications/layouts)
