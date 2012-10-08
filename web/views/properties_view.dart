
abstract class PropertiesView extends View
{
  PropertiesView()
    : super();

  PropertiesView.fromResource(String resource)
    : super.fromResource(resource);

  abstract String get name;

  abstract Future<String> get headerTemplate;
}
