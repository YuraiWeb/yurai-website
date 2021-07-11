module models.navigation;

public final class Navigation
{
  public:
  final:
  string name;
  string cls;
  bool showSearch;
  NavigationItem[] items;
}

public final class NavigationItem
{
  public:
  final:
  string text;
  string link;
  string icon;
  string iconColor1;
  string iconColor2;
  NavigationSubItem[] subItems;
}

public final class NavigationSubItem
{
  public:
  final:
  string text;
  string link;
  string icon;
  string iconColor1;
  string iconColor2;
  bool isDivider;
}
