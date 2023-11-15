using System;

namespace cgltf
{
	public extension CGLTF
	{
		public enum FileType : int32
		{
			Invalid,
			Gltf,
			Glb
		}
	
		public enum Result : int32
		{
			Success,
			DataTooShort,
			UnknownFormat,
			InvalidJson,
			InvalildGltf,
			InvalidOptions,
			FileNotFound,
			IoError,
			OutOfMemory,
			LegacyGltf
		}

		public enum BufferViewType : int32
		{
			Invalid,
			Indices,
			Vertices,
		}

		public enum AttributeType : int32
		{
			Invalid,
			Position,
			Normal,
			Tangent,
			Texcoord,
			Color,
			Joints,
			Weights,
		}

		public enum ComponentType : int32
		{
			Invalid,
			R_8, /* BYTE */
			R_8u, /* UNSIGNED_BYTE */
			R_16, /* SHORT */
			R_16u, /* UNSIGNED_SHORT */
			R_32u, /* UNSIGNED_INT */
			R_32f, /* FLOAT */
		}

		public enum Type : int32
		{
			Invalid,
			Scalar,
			Vec2,
			Vec3,
			Vec4,
			Mat2,
			Mat3,
			Mat4,
		}

		public enum PrimitiveType : int32
		{
			Points,
			Lines,
			LineLoop,
			LineStrip,
			Triangles,
			TriangleStrip,
			TriangleFan,
		}

		public enum AlphaMode : int32
		{
			Opaque,
			Mask,
			Blend,
		}

		public enum AnimationPathType : int32
		{
			Invalid,
			Translation,
			Rotation,
			Scale,
			Weights,
		}

		public enum InterpolationType : int32
		{
			Linear,
			Step,
			CubicSpline,
		}

		public enum CameraType : int32
		{
			Invalid,
			Perspective,
			Orthographic,
		}

		public enum LightType : int32
		{
			Invalid,
			Directional,
			Point,
			Spot,
		}

		public enum DataFreeMethod : int32
		{
			None,
			FileRelease,
			MemoryFree,
		}

		public enum MeshoptCompressionMode : int32
		{
			Invalid,
			Attributes,
			Triangles,
			Indices,
		}

		public enum MeshoptCompressionFilter : int32
		{
			None,
			Octahedral,
			Quaternion,
			Exponential,
		}
	}
}
