part of editor;

abstract class GeneratedMeshModel
{
  bool _texCoords;
  bool _normals;
  bool _tangents;

  GeneratedMeshModel()
    : _texCoords = true
    , _normals = true
    , _tangents = true;

  bool get texCoords => _texCoords;
  set texCoords(bool value)
  {
    _texCoords = value;

    generateMesh();
  }

  bool get normals => _normals;
  set normals(bool value)
  {
    _normals = value;

    generateMesh();
  }

  bool get tangents => _tangents;
  set tangents(bool value)
  {
    _tangents = value;

    generateMesh();
  }

  void generateMesh();
}
