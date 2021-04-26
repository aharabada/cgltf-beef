using System;
using cgltf;

namespace cgltf_beef_test
{
	class Program
	{
		public static int Main(String[] args)
		{
			/*void* buffer; /* Pointer to glb or gltf file data */
			uint size; /* Size of the file data */

			CGLTF.Options options = .();
			CGLTF.Data* data = null;
			CGLTF.Result result = CGLTF.Parse(options, buffer, size, out data);
			if(result == .Success)
			{
				/* TODO make awesome stuff */
				CGLTF.Free(data);
			}
			*/
			
			CGLTF.Options options = .();
			CGLTF.Data* data = null;

			CGLTF.Result result = CGLTF.ParseFile(options, "box.gltf", out data);
			Runtime.Assert(result == .Success, "Failed to load model.");
			
			/* TODO make awesome stuff */

			var bufRes = CGLTF.LoadBuffers(options, data, "box.gltf");
			Runtime.Assert(bufRes == .Success, "Failed to load buffers.");

			// copy indices
			{
				var meshIndices = data.Meshes[0].Primitives[0].Indices;
	
				var indices = scope uint16[meshIndices.Count];
	
				uint8* dataPtr = (uint8*)meshIndices.BufferView.Buffer.Data + meshIndices.BufferView.Offset;
	
				for(int i < indices.Count)
				{
					indices[i] = *(uint16*)dataPtr;
					dataPtr += meshIndices.Stride;
				}

				/* TODO do stuff with indices */
			}

			CGLTF.Free(data);
			
			return 0;
		}
	}
}