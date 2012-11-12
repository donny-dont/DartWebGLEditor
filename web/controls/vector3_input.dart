part of editor;

class Vector3ChangedEventArgs extends EventArgs
{
  final vec3 value;

  Vector3ChangedEventArgs(num x, num y, num z)
    : value = new vec3(x, y, z);
}

class Vector3Input extends Control
{
  FrameworkProperty x;
  FrameworkProperty y;
  FrameworkProperty z;
  bool _initialized;

  final FrameworkEvent<Vector3ChangedEventArgs> changed =
      new FrameworkEvent<Vector3ChangedEventArgs>();

  Vector3Input()
  {
    Browser.appendClass(rawElement, "Vector3Input");

    _initialized = false;
    _initVector3InputProperties();
    _initialized = true;

    registerEvent('changed', changed);
  }

  Vector3Input.register() : super.register();
  makeMe() => new Vector3Input();

  void _initVector3InputProperties()
  {
    x = new FrameworkProperty(this, 'x',
        propertyChangedCallback: (_) => _onValueChanged(),
        defaultValue:'0',
        converter:const StringToNumericConverter());
    y = new FrameworkProperty(this, 'y',
        propertyChangedCallback: (_) => _onValueChanged(),
        defaultValue:'0',
        converter:const StringToNumericConverter());
    z = new FrameworkProperty(this, 'z',
        propertyChangedCallback: (_) => _onValueChanged(),
        defaultValue:0,
        converter:const StringToNumericConverter());
  }

  void onFirstLoad(){
    // Get references to our textboxes and then set the bindings.
    final tbX = Template.findByName('__vector3x__', template) as TextBox;
    final tbY = Template.findByName('__vector3y__', template) as TextBox;
    final tbZ = Template.findByName('__vector3z__', template) as TextBox;

    bind(tbX.text, x, bindingMode:BindingMode.TwoWay);
    bind(tbY.text, y, bindingMode:BindingMode.TwoWay);
    bind(tbZ.text, z, bindingMode:BindingMode.TwoWay);
  }

  void _onValueChanged() {
    if (_initialized)
      changed.invokeAsync(this, new Vector3ChangedEventArgs(x.value, y.value, z.value));
  }

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
