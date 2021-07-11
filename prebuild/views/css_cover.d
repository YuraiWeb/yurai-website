module yurai.prebuild.views.view_css_cover;

import yurai;

import models;

public final class view_css_cover : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("css_cover", request,response, []);
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
    
    
  auto maxWidth = "100%";

append(`
.cover {
  width: 100%;
  height: 30vh;
  max-width: 2000px;
  max-height: 712px;
  background-image: url(/images/cover.jpg);
  background-size: cover;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
  color: #fff;
}

@media (max-width: 512px) {
  .cover {
    height: 46vh;
  }
}

.cover .message a {
  color: #fff;
  opacity: 0.8;
}

.cover .btn {
  margin-left: 8px;
  margin-right: 8px;
}
`);

    setContentType("text/css");

    return finalizeContent(null,processLayout);
  }
}
