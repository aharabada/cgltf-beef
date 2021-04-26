# cgltf-beef
### Beef bindings for the [C glTF loader](https://github.com/jkuhlmann/cgltf) (todo: and writer)

# Usage:

Add the project **cgltf-beef** to your Workspace and mark it as *dependency*.

Loading from file:
```beef
using cgltf;

CGLTF.Options options = .();
CGLTF.Data* data = null;
CGLTF.Result result = CGLTF.ParseFile(options, "scene.gltf", out data);
if(result == .Success)
{
    /* TODO make awesome stuff */
    CGLTF.Free(data);
}
```
Loading from memory:
```beef
using cgltf;

void* buffer; /* Pointer to glb or gltf file data */
uint size; /* Size of the file data */

CGLTF.Options options = .();
CGLTF.Data* data = null;
CGLTF.Result result = CGLTF.Parse(options, buffer, size, out data);
if(result == .Success)
{
    /* TODO make awesome stuff */
    CGLTF.Free(data);
}
```

# Notes:
Make sure the "C Library" option is set "Dynamic Debug" under Properties->Targeted->Build

The "USE_SPAN" macro can be used to replace some pointer-count fields with Spans.

## About the content of this repository:
**cgltf**: Submodule - The original cgltf repository (only needed if you want to compile cgltf yourself)
**cgltf-beef**: Contains the beef bindings (add this library to your project)
**cgltf-beef-test**: Contains a test project
**cgltf_stub.c**: C file required to build the cgltf (only needed if you want to compile cgltf yourself)
**CMakeLists.txt**: CMake file used to generate the project needed to compile cgltf (only needed if you want to compile cgltf yourself)
**prepare.ps1**: A terrible script that can automatically generate a project for cgltf and build it
**README.md**: The file you are currently reading