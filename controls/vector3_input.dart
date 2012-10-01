class VectorChangedEventArgs extends EventArgs
{
  final num x;
  final num y;
  final num z;

  VectorChangedEventArgs(this.x, this.y, this.z);
}

class Vector3Input extends Control
{
  FrameworkProperty xProperty;
  FrameworkProperty yProperty;
  FrameworkProperty zProperty;

  final FrameworkEvent<VectorChangedEventArgs> changed =
      new FrameworkEvent<VectorChangedEventArgs>();

  Vector3Input()
  {
    Browser.appendClass(rawElement, "Vector3Input");

    _initVector3InputProperties();

    registerEvent('changed', changed);
  }

  Vector3Input.register() : super.register();
  makeMe() => new Vector3Input();

  void _initVector3InputProperties()
  {
    xProperty = new FrameworkProperty(this, 'x');
    yProperty = new FrameworkProperty(this, 'y');
    zProperty = new FrameworkProperty(this, 'z');

    xProperty.propertyChanging + _valueChanged;
    yProperty.propertyChanging + _valueChanged;
    zProperty.propertyChanging + _valueChanged;
  }

  void _valueChanged(sender, args){
    changed.invokeAsync(this,
      new VectorChangedEventArgs(
        getValue(xProperty), getValue(yProperty), getValue(zProperty)));
  }

  String get defaultControlTemplate {
    return
'''
<controltemplate controlType='${this.templateName}'>
  <template>
    <stack>
      <stack orientation='horizontal'>
         <textblock text='X:' />
         <textbox width='50' text='{template x}' />
         <textblock text='Y:' />
         <textbox width='50' text='{template y}' />
         <textblock text='Z:' />
         <textbox width='50' text='{template z}' />
      </stack>
    </stack>
  </template>
</controltemplate>
''';
  }
}
