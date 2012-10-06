class Vector3ChangedEventArgs extends EventArgs
{
  final vec3 value;

  Vector3ChangedEventArgs(num x, num y, num z)
    : value = new vec3(x, y, z);
}

class Vector3Input extends Control
{
  FrameworkProperty xProperty;
  FrameworkProperty yProperty;
  FrameworkProperty zProperty;

  final FrameworkEvent<Vector3ChangedEventArgs> changed =
      new FrameworkEvent<Vector3ChangedEventArgs>();

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
        propertyChangedCallback: (v) => _onValueChanged(),
        defaultValue:'0');
    yProperty = new FrameworkProperty(this, 'y',
        propertyChangedCallback: (v) => _onValueChanged(),
        defaultValue:'0');
    zProperty = new FrameworkProperty(this, 'z',
        propertyChangedCallback: (v) => _onValueChanged(),
        defaultValue:'0');
  }

  void onFirstLoad(){
    // Get references to our textboxes and then set the bindings.
    final tbX = Template.findByName('__vector3x__', template) as TextBox;
    final tbY = Template.findByName('__vector3y__', template) as TextBox;
    final tbZ = Template.findByName('__vector3z__', template) as TextBox;

    bind(tbX.textProperty, xProperty, bindingMode:BindingMode.TwoWay);
    bind(tbY.textProperty, yProperty, bindingMode:BindingMode.TwoWay);
    bind(tbZ.textProperty, zProperty, bindingMode:BindingMode.TwoWay);
  }

  num get x => _validNum(getValue(xProperty));
  set x(num value) => setValue(xProperty, '$value');

  num get y => _validNum(getValue(yProperty));
  set y(num value) => setValue(yProperty, '$value');

  num get z => _validNum(getValue(zProperty));
  set z(num value) => setValue(zProperty, '$value');

  void _onValueChanged() =>
      changed.invokeAsync(this, new Vector3ChangedEventArgs(x,y,z));

  String get defaultControlTemplate {
    return
'''
<controltemplate controlType='${this.templateName}'>
  <template>
    <stack>
      <stack orientation='horizontal'>
         <textblock text='X:' />
         <textbox name='__vector3x__' width='50' />
         <textblock text='Y:' />
         <textbox name='__vector3y__' width='50' />
         <textblock text='Z:' />
         <textbox name='__vector3z__' width='50' />
      </stack>
    </stack>
  </template>
</controltemplate>
''';
  }
}
