module main;

import yurai;

void main()
{
  static if (Yurai_IsPreBuilding)
  {
    import std.file : dirEntries, SpanMode, readText;
    import std.algorithm : filter, endsWith;
    import std.path : baseName;

    foreach (string name; dirEntries("styles", SpanMode.depth).filter!(f => f.name.endsWith(".css")))
    {
      auto baseCssName = baseName(name);

      if (baseCssName == "global.css")
      {
        continue;
      }

      registerView(name, "css_" ~ baseCssName.replace("-","_").replace(".css", ""), baseCssName == "main.css" ? ("css/main.css") : null, "text/css", readText("styles/global.css"));
    }
  }

  if (registerServers())
  {
    import std.file : exists, write;

    auto isLocal = exists("prebuild");

    auto server = isLocal ?
      setupServer("vibe.d", ["127.0.0.1"], 8000, "wwwroot") :
      setupServer("vibe.d", ["127.0.0.1"], 9898, "wwwroot");

    if (!server)
    {
      return;
    }

    auto mailService = new VibeMailService("host", 0000, "username", "password");

    server
      .registerMailService(mailService)
      .registerViews()
      .registerApiControllers()
      .registerNotFoundPage()
      .registerBasicErrorLogger()
      .run();
  }
}

private:
string recursiveCssImport(string name)
{
  import std.file : exists, readText;
  import std.array : replace, split, join;
  import std.string : strip;

  if (!exists("styles/" ~ name))
  {
    return "/* Could not find 'styles/" ~ name ~ "' */";
  }

  auto lines = readText("styles/" ~ name).replace("\r", "").split("\n");

  foreach (ref line; lines)
  {
    if (line.startsWith("@include "))
    {
      line = line.replace("@include ", "").strip;

      line = "/* Imported '" ~ line ~ "' */\r\n" ~ recursiveCssImport(line);
    }
  }

  return lines.join("\r\n");
}
