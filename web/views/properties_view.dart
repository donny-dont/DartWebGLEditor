part of editor;

abstract class PropertiesView extends View
{
  PropertiesView()
    : super();

  PropertiesView.fromResource(String resource)
    : super.fromResource(resource);

  String get name;

  Future<String> get headerTemplate;
}
