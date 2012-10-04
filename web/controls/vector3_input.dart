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
    xProperty = new FrameworkProperty(this, 'x',
        defaultValue:'0');
    yProperty = new FrameworkProperty(this, 'y',
        defaultValue:'0');
    zProperty = new FrameworkProperty(this, 'z',
        defaultValue:'0');

    xProperty.propertyChanging + _valueChanged;
    yProperty.propertyChanging + _valueChanged;
    zProperty.propertyChanging + _valueChanged;
  }

  num get x => _validNum(getValue(xProperty));
  set x(num value) => setValue(xProperty, '$value');

  num get y => _validNum(getValue(yProperty));
  set y(num value) => setValue(yProperty, '$value');

  num get z => _validNum(getValue(zProperty));
  set z(num value) => setValue(zProperty, '$value');

  num _validNum(String value){
    if (value == null) return 0;
    if (value.isEmpty()) return 0;

    try{
      return parseDouble(value);
    }
    on FormatException catch(e){
      return 0;
    }
  }

  void _valueChanged(sender, args){
    changed.invokeAsync(this, new VectorChangedEventArgs(x,y,z));
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
