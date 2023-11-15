using System;

namespace cgltf
{
	public extension CGLTF
	{
		[CRepr]
		public struct MemoryOptions
		{
		    public function void*(void* user, uint size) Alloc;
		    public function void(void* user, void* ptr) Free;
		}

		[CRepr]
		public struct FileOptions
		{
		    public function Result(MemoryOptions* memoryOptions, FileOptions* fileOptions, char8* path, uint* size, void** data) Read;
		    public function Result(MemoryOptions* memoryOptions, FileOptions* fileOptions, void* data) Release;
		    public void* UserData;
		}

		[CRepr]
		public struct Options
		{
			public FileType Type; /* invalid == auto detect */
			public uint JsonTokenCount; /* 0 == auto */
			public MemoryOptions Memory;
			public FileOptions File;
		}

		public typealias Bool = System.Windows.IntBool;

		[CRepr]
		public struct Extras
		{
		    public uint StartOffset;
		    public uint EndOffset;
		}

		[CRepr]
		public struct Extension
		{
		    public char8* Name;
		    public char8* Data;
		}

		[CRepr]
		public struct Buffer
		{
		    public char8* Name;
		    public uint Size;
		    public char8* Uri;
		    public void* Data; /* loaded by cgltf_load_buffers */
			public DataFreeMethod DataFreeMethod;
		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct MeshoptCompression
		{
		    public Buffer* Buffer;
		    public uint Offset;
		    public uint Size;
		    public uint Stride;
		    public uint Count;
		    public MeshoptCompressionMode Mode;
		    public MeshoptCompressionFilter Filter;
		}

		[CRepr]
		public struct BufferView
		{
		    public char8* Name;
		    public Buffer* Buffer;
		    public uint Offset;
		    public uint Size;
		    public uint stride; /* 0 == automatically determined by accessor */
		    public BufferViewType Type;
		    public void* data; /* overrides buffer->data if present, filled by extensions */
		    public Bool HasMeshoptCompression;
		    public MeshoptCompression MeshoptCompression;
		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct AccessorSparse
		{
		    public uint Count;
		    public BufferView* IndicesBufferView;
		    public uint IndicesByteOffset;
		    public ComponentType IndicesComponentType;
		    public BufferView* ValuesBufferView;
		    public uint ValuesByteOffset;
		    public Extras Extras;
		    public Extras IndicesExtras;
		    public Extras ValuesExtras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		    public uint IndicesExtensionsCount;
		    public Extension* IndicesExtensions;
		    public uint ValuesExtensionsCount;
		    public Extension* ValuesExtensions;
		}

		[CRepr]
		public struct Accessor
		{
		    public char8* Name;
		    public ComponentType ComponentType;
		    public Bool Normalized;
		    public Type Type;
		    public uint Offset;
		    public uint Count;
		    public uint Stride;
		    public BufferView* BufferView;
		    public Bool HasMin;
		    public float[16] Min;
		    public Bool HasMax;
		    public float[16] Max;
		    public Bool IsSparse;
		    public AccessorSparse Sparse;
		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct Attribute
		{
		    public char8* Name;
		    public AttributeType Type;
		    public int32 Index;
		    public Accessor* Data;
		}

		[CRepr]
		public struct Image
		{
		    public char8* Name;
		    public char8* Uri;
		    public BufferView* BufferView;
		    public char8* MimeType;
		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct Sampler
		{
		    public char8* Name;
		    public int32 MagFilter;
		    public int32 MinFilter;
		    public int32 WrapS;
		    public int32 WrapT;
		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct Texture
		{
		    public char8* Name;
		    public Image* Image;
		    public Sampler* Sampler;
		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct TextureTransform
		{
		    public float[2] Offset;
		    public float Rotation;
		    public float[2] Scale;
		    public int32 Texcoord;
		}

		[CRepr]
		public struct TextureView
		{
		    public Texture* Texture;
		    public int32 Texcoord;
		    public float scale; /* equivalent to strength for occlusion_texture */
		    public Bool HasTransform;
		    public TextureTransform Transform;
		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct PbrMetallicRoughness
		{
		    public TextureView BaseColorTexture;
		    public TextureView MetallicRoughnessTexture;

		    public float[4] BaseColorFactor;
		    public float MetallicFactor;
		    public float RoughnessFactor;

		    public Extras Extras;
		}

		[CRepr]
		public struct PbrSpecularGlossiness
		{
		    public TextureView DiffuseTexture;
		    public TextureView SpecularGlossinessTexture;

		    public float[4] DiffuseFactor;
		    public float[3] SpecularFactor;
		    public float GlossinessFactor;
		}

		[CRepr]
		public struct Clearcoat
		{
		    public TextureView ClearcoatTexture;
		    public TextureView ClearcoatRoughnessTexture;
		    public TextureView ClearcoatNormalTexture;

		    public float ClearcoatFactor;
		    public float ClearcoatRoughnessFactor;
		}

		[CRepr]
		public struct Transmission
		{
		    public TextureView TransmissionTexture;
		    public float TransmissionFactor;
		}

		[CRepr]
		public struct Ior
		{
		    public float Ior;
		}

		[CRepr]
		public struct Specular
		{
		    public TextureView SpecularTexture;
		    public TextureView SpecularColorTexture;
		    public float[3] SpecularColorFactor;
		    public float SpecularFactor;
		}

		[CRepr]
		public struct Volume
		{
		    public TextureView ThicknessTexture;
		    public float ThicknessFactor;
		    public float[3] AttenuationColor;
		    public float AttenuationDistance;
		}

		[CRepr]
		public struct Sheen
		{
		    public TextureView SheenColorTexture;
		    public float[3] SheenColorFactor;
		    public TextureView SheenRoughnessTexture;
		    public float SheenRoughnessFactor;
		}

		[CRepr]
		public struct Material
		{
		    public char8* Name;
		    public Bool HasPbrMetallicRoughness;
		    public Bool HasPbrSpecularGlossiness;
		    public Bool HasClearcoat;
		    public Bool HasTransmission;
		    public Bool HasVolume;
		    public Bool HasIor;
		    public Bool HasSpecular;
		    public Bool HasSheen;
		    public PbrMetallicRoughness PbrMetallicRoughness;
		    public PbrSpecularGlossiness PbrSpecularGlossiness;
		    public Clearcoat Clearcoat;
		    public Ior Ior;
		    public Specular Specular;
		    public Sheen Sheen;
		    public Transmission Transmission;
		    public Volume Volume;
		    public TextureView NormalTexture;
		    public TextureView OcclusionTexture;
		    public TextureView EmissiveTexture;
		    public float[3] EmissiveFactor;
		    public AlphaMode AlphaMode;
		    public float AlphaCutoff;
		    public Bool DoubleSided;
		    public Bool Unlit;
		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct MaterialMapping
		{
		    public uint Variant;
		    public Material* Material;
		    public Extras Extras;
		}

		[CRepr]
		public struct MorphTarget {
#if USE_SPAN
			public Span<Attribute> Attributes;
#else
		    public Attribute* Attributes;
		    public uint AttributesCount;
#endif
		}

		[CRepr]
		public struct DracoMeshCompression {
		    public BufferView* BufferView;
#if USE_SPAN
			public Span<Attribute> Attributes;
#else
		    public Attribute* Attributes;
		    public uint AttributesCount;
#endif
		}

		[CRepr]
		public struct Primitive {
		    public PrimitiveType Type;
		    public Accessor* Indices;
		    public Material* Material;
#if USE_SPAN
			public Span<Attribute> Attributes;
			public Span<MorphTarget> Targets;
#else
		    public Attribute* Attributes;
		    public uint AttributesCount;

		    public MorphTarget* Targets;
		    public uint TargetsCount;
#endif
		    public Extras Extras;
		    public Bool HasDracoMeshCompression;
		    public DracoMeshCompression DracoMeshCompression;
#if USE_SPAN
			public Span<MaterialMapping> Mappings;
#else
		    public MaterialMapping* Mappings;
		    public uint MappingsCount;
#endif
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct Mesh {
		    public char8* Name;
#if USE_SPAN
			public Span<Primitive> Primitives;
			public Span<float> Weights;
			public Span<char8*> TargetNames;
#else
		    public Primitive* Primitives;
		    public uint PrimitivesCount;

		    public float* Weights;
		    public uint WeightsCount;
			
			public char8** TargetNames;
			public uint TargetNamesCount;
#endif
		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct Skin {
		    public char8* Name;
#if USE_SPAN
			public Span<Node*> Joints;
#else
		    public Node** Joints;
		    public uint JointsCount;
#endif
		    public Node* Skeleton;
		    public Accessor* InverseBindMatrices;
		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct CameraPerspective {
		    public Bool HasAspectRatio;
		    public float AspectRatio;
		    public float Yfov;
		    public Bool HasZfar;
		    public float Zfar;
		    public float Znear;
		    public Extras Extras;
		}

		[CRepr]
		public struct CameraOrthographic {
		    public float Xmag;
		    public float Ymag;
		    public float Zfar;
		    public float Znear;
		    public Extras Extras;
		}

		[CRepr]
		public struct Camera
		{
		    public char8* Name;
		    public CameraType Type;

		    [Union]
		    public struct CameraSettings
		    {
		            CameraPerspective perspective;
		            CameraOrthographic orthographic;
		    }

		    public CameraSettings CameraSettings;

		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct Light
		{
		    public char8* Name;
		    public float[3] Color;
		    public float Intensity;
		    public LightType Type;
		    public float Range;
		    public float SpotInnerConeAngle;
		    public float SpotOuterConeAngle;
		}

		[CRepr]
		public struct Node
		{
		    public char8* Name;
		    public Node* Parent;
#if USE_SPAN
			public Span<Node*> Children;
#else
		    public Node** Children;
		    public uint ChildrenCount;
#endif
		    public Skin* Skin;
		    public Mesh* Mesh;
		    public Camera* Camera;
		    public Light* Light;
#if USE_SPAN
			public Span<float> Weights;
#else
		    public float* Weights;
		    public uint WeightsCount;
#endif
		    public Bool HasTranslation;
		    public Bool HasRotation;
		    public Bool HasScale;
		    public Bool HasMatrix;
		    public float[3] Translation;
		    public float[4] Rotation;
		    public float[3] Scale;
		    public float[16] Matrix;
		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		};

		[CRepr]
		public struct Scene {
		    public char8* Name;
#if USE_SPAN
			public Span<Node*> Nodes;
#else
		    public Node** Nodes;
		    public uint NodesCount;
#endif
		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct AnimationSampler {
		    public Accessor* Input;
		    public Accessor* Output;
		    public InterpolationType Interpolation;
		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct AnimationChannel {
		    public AnimationSampler* Sampler;
		    public Node* TargetNode;
		    public AnimationPathType TargetPath;
		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct Animation {
		    public char8* Name;
#if USE_SPAN
			public Span<AnimationSampler> Samplers;
			public Span<AnimationChannel> Channels;
#else
		    public AnimationSampler* Samplers;
		    public uint SamplersCount;

		    public AnimationChannel* Channels;
		    public uint ChannelsCount;
#endif
		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct MaterialVariant
		{
		    public char8* Name;
		    public Extras Extras;
		}

		[CRepr]
		public struct Asset {
		    public char8* Copyright;
		    public char8* Generator;
		    public char8* Version;
		    public char8* MinVersion;
		    public Extras Extras;
		    public uint ExtensionsCount;
		    public Extension* Extensions;
		}

		[CRepr]
		public struct Data
		{
		    public FileType FileType;
		    public void* FileData;

		    public Asset Asset;

#if USE_SPAN
			public Span<Mesh> Meshes;
			public Span<Material> Materials;
			public Span<Accessor> Accessors;
			public Span<BufferView> BufferViews;
			public Span<Buffer> Buffers;
			public Span<Image> Images;
			public Span<Texture> Textures;
			public Span<Sampler> Samplers;
			public Span<Skin> Skins;
			public Span<Camera> Cameras;
			public Span<Light> Lights;
			public Span<Node> Nodes;
			public Span<Scene> Scenes;

		    public Scene* Scene;

			public Span<Animation> Animations;
			public Span<MaterialVariant> MaterialVariants;

		    public Extras Extras;

		    public uint DataExtensionsCount;
		    public Extension* DataExtensions;

			public Span<char8*> ExtensionsUsed;
			public Span<char8*> ExtensionsRequired;

			public StringView Json;

			public Span<uint8> Bin;
#else
			public Mesh* Meshes;
		    public uint MeshesCount;

		    public Material* Materials;
		    public uint MaterialsCount;

		    public Accessor* Accessors;
		    public uint AccessorsCount;

		    public BufferView* BufferViews;
		    public uint BufferViewsCount;

		    public Buffer* Buffers;
		    public uint BuffersCount;

		    public Image* Images;
		    public uint ImagesCount;

		    public Texture* Textures;
		    public uint TexturesCount;

		    public Sampler* Samplers;
		    public uint SamplersCount;

		    public Skin* Skins;
		    public uint SkinsCount;

		    public Camera* Cameras;
		    public uint CamerasCount;

		    public Light* Lights;
		    public uint LightsCount;

		    public Node* Nodes;
		    public uint NodesCount;

		    public Scene* Scenes;
		    public uint ScenesCount;

		    public Scene* Scene;

		    public Animation* Animations;
		    public uint AnimationsCount;

		    public MaterialVariant* Variants;
		    public uint VariantsCount;

		    public Extras Extras;

		    public uint DataExtensionsCount;
		    public Extension* DataExtensions;

		    public char8** ExtensionsUsed;
		    public uint ExtensionsUsedCount;

		    public char8** ExtensionsRequired;
		    public uint ExtensionsRequiredCount;

		    public char8* Json;
		    public uint JsonSize;

		    public void* Bin;
		    public uint BinSize;
#endif

		    public MemoryOptions Memory;
		    public FileOptions File;
		}
	}
}
