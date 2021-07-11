module models.sidemenu;

public final class SideMenu
{
  public:
  final:
  string title;
  string basePath;
  string icon;
  string iconColor1;
  string iconColor2;
  SideMenuItem[] items;
}

public final class SideMenuItem
{
  public:
  final:
  string text;
  string icon;
  string iconColor1;
  string iconColor2;
  bool isSeparator;
  SideMenuLink[] links;
}

public final class SideMenuLink
{
  public:
  final:
  string text;
  string link;
  string icon;
  string iconColor1;
  string iconColor2;
}
