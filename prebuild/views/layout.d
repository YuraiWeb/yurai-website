module yurai.prebuild.views.view_layout;

import yurai;

import models;

public final class view_layout : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("layout", request,response, []);
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
    
    append(getPlaceholder(`doctype`));
append(`
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>`);
append(getPlaceholder(`title`));
append(` | Yurai Web Framework - Fast, modern &amp; native</title>
  <link rel="icon" type="image/png" href="/favico.png" />

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <script src="https://kit.fontawesome.com/f66fcea86a.js" crossorigin="anonymous"></script>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <link href="/css/main.css" rel="stylesheet">
  `);

    Navigation mainNavigation;
    string[] errorMessages;
    auto parsedMenu = deserializeJsonSafe!Navigation(readText("config/navigation.json"), mainNavigation, errorMessages);

    if (!parsedMenu || (errorMessages && errorMessages.length))
    {
      parsedMenu = false;
      writeln(errorMessages);
    }
  
append(`
</head>
<body>
  `);
if (parsedMenu) {
renderPartialModel!`navigation`(mainNavigation);
append(`
  `);
}
append(getPlaceholder(`section: outside`));
append(`

  <main class="container">
    `);
append(getPlaceholder(`view`));
append(`
  </main>

  <footer>
    <div class="row">
      <div class="col-md-4 col-sm-12 footer-links">
        <span>General</span><br>
        <ul>
          <li><a href="/downloads">Install</a></li>
          <li><a href="/docs/specifications">Docs</a></li>
          <li><a href="/docs/api">API</a></li>
          <li><a href="/resources/examples">Examples</a></li>
          <li><a href="/resources/tutorials">Tutorials</a></li>
          <li><a href="/resources/help">Help</a></li>
          <li><a href="/resources/faq">FAQ</a></li>
          <li><a href="https://github.com/YuraiWeb/yurai/blob/main/LICENSE" target="_blank" rel="noopener noreferrer">License</a></li>
        </ul>
      </div>
      <div class="col-md-4 col-sm-12 footer-links">
        <span>Community</span><br>
        <ul>
          <li><a href="https://github.com/YuraiWeb/yurai" target="_blank" rel="noopener noreferrer">Github</a></li>
          <li><a href="https://github.com/YuraiWeb/yurai/issues" target="_blank" rel="noopener noreferrer">Issue Tracker</a></li>
          <li><a href="https://www.facebook.com/yuraiwebframework" target="_blank" rel="noopener noreferrer">Facebook</a></li>
          <li><a href="https://discord.com/invite/UTysCSH" target="_blank" rel="noopener noreferrer">Discord</a></li>
        </ul>
      </div>
      <div class="col-md-4 col-sm-12 footer-links">
        <span>Yurai</span><br>
        <ul>
          <li><a href="/contact">Contact</a></li>
          <li><a href="/blog">Blog</a></li>
          <li><a href="/about">About</a></li>
          <li><a href="/team">Team</a></li>
          <li><a href="/sponsors">Sponsors <i class="fad fa-heart-circle" style="--fa-primary-color: #F1948A;--fa-secondary-color: #EC7063;"></i></a></li>
          <li><a href="/resources/contribute">Contribute</a></li>
          <li><a href="/donate">Donate</a></li>
          <li><a href="/roadmap">Roadmap</a></li>
        </ul>
      </div>
    </div>
    <div class="footer-copyright">
      Copyright &copy; <span>Yurai Web Framework</span> `);
escaped(Clock.currTime.year);
append(`<br>
      <span>The website is still under construction.</span>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>
`);

    

    return finalizeContent(null,processLayout);
  }
}
