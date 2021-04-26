using System;

namespace cgltf
{
	public static class CGLTF
	{
		[LinkName("cgltf_parse")]
		public static extern Result Parse(Options* options, void* data, uint size, Data** out_data);
		
		[LinkName("cgltf_parse")]
		public static extern Result Parse(in Options options, void* data, uint size, out Data* out_data);

		public static Result Parse<T>(in Options options, Span<T> data, out Data* out_data)
		{
			return Parse(options, data.Ptr, (.)(data.Length * sizeof(T)), out out_data);
		}

		[LinkName("cgltf_parse_file")]
		public static extern Result ParseFile(Options* options, char8* path, Data** out_data);
		
		[LinkName("cgltf_parse_file")]
		public static extern Result ParseFile(in Options options, char8* path, out Data* out_data);

		public static Result ParseFile(in Options options, String path, out Data* out_data)
		{
			return ParseFile(options, path.CStr(), out out_data);
		}
		
		[LinkName("cgltf_load_buffers")]
		public static extern Result LoadBuffers(Options* options, Data* data, char8* gltf_path);

		[LinkName("cgltf_load_buffers")]
		public static extern Result LoadBuffers(in Options options, Data* data, char8* gltf_path);

		public static Result LoadBuffers(in Options options, Data* data, String gltf_path)
		{
			return LoadBuffers(options, data, gltf_path.CStr());
		}

		[LinkName("cgltf_load_buffer_base64")]
		public static extern Result LoadBuffersBase64(Options* options, uint size, char8* base64, void** out_data);

		[LinkName("cgltf_decode_uri")]
		public static extern void DecodeUri(char8* uri);

		[LinkName("cgltf_validate")]
		public static extern Result Validate(Data* data);

		[LinkName("cgltf_free")]
		public static extern Result Free(Data* data);

		[LinkName("cgltf_node_transform_local")]
		public static extern void NodeTransformLocal(Node* node, float* out_matrix);
		[LinkName("cgltf_node_transform_world")]
		public static extern void NodeTransformWorld(Node* node, float* out_matrix);

		[LinkName("cgltf_accessor_read_float")]
		public static extern Bool AccessorReadFloat(Accessor* node, uint index, float* out_float, uint element_size);
		[LinkName("cgltf_accessor_read_uint")]
		public static extern Bool AccessorReadUint(Accessor* node, uint index, uint32* out_uint, uint element_size);
		[LinkName("cgltf_accessor_read_index")]
		public static extern uint AccessorReadIndex(Accessor* node, uint index);
		
		[LinkName("cgltf_num_components")]
		public static extern uint NumComponents(Type type);

		[LinkName("cgltf_accessor_unpack_floats")]
		public static extern uint AccessorUnpackFloats(Accessor* accessor, float* out_floats, uint float_count);

		[LinkName("cgltf_copy_extras_json")]
		public static extern Result CopyExtrasJson(Accessor* accessor, Extras* extras, char8* dest, uint dest_size);
	}
}
