// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "RRF_HumanShaders/EyeShaders/EyeShader_Model4URP"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_FalloffAdjuster("FalloffAdjuster", Range( 0 , 5)) = 0.9423595
		[NoScaleOffset][Header(Main Textures)][Space(10)]_RGBMask("RGBMask", 2D) = "white" {}
		[NoScaleOffset]_IrisExtraDetail("IrisExtraDetail", 2D) = "white" {}
		[NoScaleOffset]_Sclera_Normal("Sclera_Normal", 2D) = "bump" {}
		[NoScaleOffset]_Lens_Base_Normal("Lens_Base_Normal", 2D) = "bump" {}
		[Header(Color Customization)][Space(6)]_EyeBallColorGlossA("EyeBallColor-Gloss(A)", Color) = (1,1,1,0.853)
		_IrisBaseColor("IrisBaseColor", Color) = (0.4999702,0.5441177,0.4641004,1)
		_IrisExtraColorAmountA("IrisExtraColor-Amount(A)", Color) = (0.08088237,0.07573904,0.04698314,0.591)
		_EyeVeinColorAmountA("EyeVeinColor-Amount(A)", Color) = (0.375,0,0,0)
		_RingColorAmount("RingColor-Amount", Color) = (0,0,0,0)
		_LimbalEdge_Finesse("LimbalEdge_Finesse", Range( 0 , 4)) = 0
		_LimbalEdge_Adjustment("LimbalEdge_Adjustment", Range( 0 , 1)) = 0
		_LimbalRingGloss("LimbalRingGloss", Range( 0 , 1)) = 0
		_LimbalRingEmissivePower("LimbalRingEmissivePower", Range( 0 , 4)) = 0
		_ScleraBumpScale("ScleraBumpScale", Range( 0 , 4)) = 0
		[Header(Sizing and Tweaks)][Space(5)]_EyeSize("EyeSize", Range( 0 , 2)) = 1
		_IrisSize("IrisSize", Range( 0 , 10)) = 1
		_IrisPupilBond("Iris-Pupil-Bond", Range( 0 , 0.1)) = 0.017
		_IrisRotationAnim("IrisRotationAnim", Range( -10 , 10)) = 0
		_LensGloss("LensGloss", Range( 0 , 1)) = 0.98
		_LensPush("LensPush", Range( 0 , 1)) = 1
		[Header(Metalness)][Space(5)]_LimbalRingMetalness("LimbalRingMetalness", Range( 0 , 1)) = 0
		_IrisPupilMetalness("IrisPupilMetalness", Range( 0 , 1)) = 0
		_EyeBallMetalness("EyeBallMetalness", Range( 0 , 1)) = 0
		[NoScaleOffset][SingleLineTexture][Header(Caustic FX)][Space(5)]_CausticMask("CausticMask", 2D) = "white" {}
		_CausticTweak("CausticTweak", Range( 0 , 4)) = 2.2
		_CausticPower("CausticPower", Range( 0 , 10)) = 17
		_CausticSize("CausticSize", Range( 0 , 2)) = 1
		_CausticFX_inDarkness("CausticFX_inDarkness", Range( 0 , 1)) = 17
		_CausticRotationAdjust("CausticRotationAdjust", Range( -1 , 1)) = 0
		_IrisDirectHitPower("IrisDirectHitPower", Range( 0 , 200)) = 0
		[Header(Pupil Control)][Space(6)]_PupilColorEmissivenessA("PupilColor-Emissiveness(A)", Color) = (0,0,0,0)
		_PupilSize("PupilSize", Range( 0.001 , 99)) = 70
		_PupilHeightWidthRatio("Pupil HeightWidthRatio", Range( 0.01 , 10)) = 1
		_PupilSharpness("PupilSharpness", Range( 0.1 , 5)) = 5
		_PupilAutoDilateFactor("PupilAutoDilateFactor", Range( 0 , 50)) = 44.97813
		_PupilAffectedByLight_Amount("PupilAffectedByLight_Amount", Range( 0 , 1)) = 0.3434565
		[NoScaleOffset][SingleLineTexture][Header(Parallax Control)][Space(5)]_ParallaxMask("ParallaxMask", 2D) = "black" {}
		_ParallaxMaskInverter("ParallaxMaskInverter", Range( 0 , 1)) = 1
		_PushParallaxMask("PushParallaxMask", Range( 0 , 5)) = 1
		_PupilParallaxHeight("PupilParallaxHeight", Range( 0 , 3)) = 2.5
		_IrisParallaxPower("IrisParallaxPower", Range( 0 , 1)) = 0.4
		[Header(Eye Shading)][Space(5)]_EyeShadingPower("EyeShadingPower", Range( 0.01 , 2)) = 1
		_MinimumGlow("MinimumGlow", Range( 0 , 1)) = 0.2
		[Header(Sub Surface control)][Space (6)]_SSSColour_DesatA("SSSColour_Desat(A)", Color) = (1,1,1,0)
		_SSS_Spread("SSS_Spread", Range( 0 , 1)) = 0
		_SSS_Light_Contact("SSS_Light_Contact", Range( -1 , 1)) = 1
		_SSS_Adjuster("SSS_Adjuster", Range( 0 , 1)) = 0.5
		_FinalSSS_Mixer("FinalSSS_Mixer", Range( 0 , 1)) = 0
		_FinalSSS_Desaturate("FinalSSS_Desaturate", Range( 0 , 1)) = 0
		_Final_illumination("Final_illumination", Range( 0 , 2)) = 0.25
		[Header(Micro Scatter)][Space(5)]_Eyeball_microScatter("Eyeball_microScatter", Range( 0 , 5)) = 0
		_MicroScatterScale("MicroScatterScale", Range( 0 , 1)) = 0
		[Header(Finetuners)][Space(5)]_BSP_IrisDirectLit("BSP_IrisDirectLit", Vector) = (0.23,-2.9,4,0)
		[ASEEnd]_FresLightEyeBall("FresLightEyeBall", Vector) = (0.7,-0.3,-0.15,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" }
		Cull Back
		AlphaToMask Off
		HLSLINCLUDE
		#pragma target 3.0

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }
			
			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70600

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#if ASE_SRP_VERSION <= 70108
			#define REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR
			#endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
			    #define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma multi_compile_instancing


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EyeVeinColorAmountA;
			float4 _IrisBaseColor;
			float4 _IrisExtraColorAmountA;
			float4 _RingColorAmount;
			float4 _EyeBallColorGlossA;
			float4 _SSSColour_DesatA;
			float4 _PupilColorEmissivenessA;
			float3 _FresLightEyeBall;
			float3 _BSP_IrisDirectLit;
			float _Final_illumination;
			float _MicroScatterScale;
			float _Eyeball_microScatter;
			float _IrisPupilMetalness;
			float _ScleraBumpScale;
			float _LensPush;
			float _CausticSize;
			float _CausticRotationAdjust;
			float _CausticPower;
			float _EyeBallMetalness;
			float _SSS_Spread;
			float _LimbalRingMetalness;
			float _CausticTweak;
			float _CausticFX_inDarkness;
			float _IrisDirectHitPower;
			float _FinalSSS_Mixer;
			float _LimbalRingEmissivePower;
			float _FinalSSS_Desaturate;
			float _EyeShadingPower;
			float _SSS_Adjuster;
			half _PupilSize;
			float _EyeSize;
			float _LimbalEdge_Adjustment;
			float _PupilAutoDilateFactor;
			float _PupilAffectedByLight_Amount;
			float _PupilHeightWidthRatio;
			float _ParallaxMaskInverter;
			float _PushParallaxMask;
			float _PupilParallaxHeight;
			float _PupilSharpness;
			float _LimbalEdge_Finesse;
			float _IrisSize;
			float _IrisPupilBond;
			float _IrisParallaxPower;
			float _IrisRotationAnim;
			float _FalloffAdjuster;
			float _LimbalRingGloss;
			float _SSS_Light_Contact;
			float _LensGloss;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _RGBMask;
			sampler2D _ParallaxMask;
			sampler2D _IrisExtraDetail;
			sampler2D _Sclera_Normal;
			sampler2D _Lens_Base_Normal;
			sampler2D _CausticMask;
			UNITY_INSTANCING_BUFFER_START(RRF_HumanShadersEyeShadersEyeShader_Model4URP)
				UNITY_DEFINE_INSTANCED_PROP(float, _MinimumGlow)
			UNITY_INSTANCING_BUFFER_END(RRF_HumanShadersEyeShadersEyeShader_Model4URP)


			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				o.ase_texcoord7.x = ase_vertexTangentSign;
				
				float3 objectSpaceLightDir = mul( GetWorldToObjectMatrix(), _MainLightPosition ).xyz;
				o.ase_texcoord9.xyz = objectSpaceLightDir;
				
				o.ase_texcoord7.yz = v.texcoord.xy;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord8 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.w = 0;
				o.ase_texcoord9.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );
				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif
				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);
				
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				VertexPositionInputs vertexInput = (VertexPositionInputs)0;
				vertexInput.positionWS = positionWS;
				vertexInput.positionCS = positionCS;
				o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				
				o.clipPos = positionCS;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				o.screenPos = ComputeScreenPos(positionCS);
				#endif
				return o;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag ( VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif
				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif
	
				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float3 normalizedWorldNormal = normalize( WorldNormal );
				float4 transform457 = mul(GetObjectToWorldMatrix(),float4( 0,3,1,0.78 ));
				float dotResult458 = dot( float4( normalizedWorldNormal , 0.0 ) , transform457 );
				float clampResult464 = clamp( dotResult458 , 0.0 , 1.0 );
				float4 transform462 = mul(GetObjectToWorldMatrix(),float4( 0,1.21,1,0.78 ));
				float dotResult461 = dot( float4( normalizedWorldNormal , 0.0 ) , transform462 );
				float clampResult465 = clamp( dotResult461 , 0.0 , 1.0 );
				float saferPower466 = max( ( clampResult464 * clampResult465 ) , 0.0001 );
				float4 transform3_g172 = mul(GetObjectToWorldMatrix(),float4( 0,-3,1,0.78 ));
				float dotResult6_g172 = dot( float4( WorldNormal , 0.0 ) , transform3_g172 );
				float clampResult7_g172 = clamp( dotResult6_g172 , 0.0 , 1.0 );
				float4 transform2_g172 = mul(GetObjectToWorldMatrix(),float4( 0,1.2,1,0.78 ));
				float dotResult5_g172 = dot( float4( WorldNormal , 0.0 ) , transform2_g172 );
				float clampResult8_g172 = clamp( dotResult5_g172 , 0.0 , 1.0 );
				float temp_output_17_0_g172 = _EyeShadingPower;
				float3 temp_cast_4 = (pow( ( clampResult7_g172 * clampResult8_g172 ) , temp_output_17_0_g172 )).xxx;
				float temp_output_12_0_g172 = ( temp_output_17_0_g172 * 0.5 );
				float clampResult18_g172 = clamp( temp_output_12_0_g172 , 0.0 , 0.99 );
				float temp_output_2_0_g173 = clampResult18_g172;
				float temp_output_3_0_g173 = ( 1.0 - temp_output_2_0_g173 );
				float3 appendResult7_g173 = (float3(temp_output_3_0_g173 , temp_output_3_0_g173 , temp_output_3_0_g173));
				float3 temp_output_1126_0 = ( ( temp_cast_4 * temp_output_2_0_g173 ) + appendResult7_g173 );
				float3 temp_cast_6 = (pow( saferPower466 , temp_output_1126_0.x )).xxx;
				float temp_output_2_0_g174 = ( temp_output_1126_0 * float3( 0.5,0,0 ) ).x;
				float temp_output_3_0_g174 = ( 1.0 - temp_output_2_0_g174 );
				float3 appendResult7_g174 = (float3(temp_output_3_0_g174 , temp_output_3_0_g174 , temp_output_3_0_g174));
				float3 eyeShading672 = ( ( temp_cast_6 * temp_output_2_0_g174 ) + appendResult7_g174 );
				float3 break1178 = _MainLightColor.rgb;
				float temp_output_1182_0 = ( ( break1178.x + break1178.y + break1178.z ) / 3.0 );
				float ase_vertexTangentSign = IN.ase_texcoord7.x;
				float3 temp_cast_9 = (ase_vertexTangentSign).xxx;
				float dotResult4_g179 = dot( SafeNormalize(_MainLightPosition.xyz) , temp_cast_9 );
				float2 temp_cast_10 = (_EyeSize).xx;
				float2 temp_cast_11 = (( ( 1.0 - _EyeSize ) / 2.0 )).xx;
				float2 texCoord264 = IN.ase_texcoord7.yz * temp_cast_10 + temp_cast_11;
				float2 eyeSizeUVs604 = texCoord264;
				float4 tex2DNode166 = tex2D( _RGBMask, eyeSizeUVs604 );
				float lerpResult706 = lerp( tex2DNode166.b , ( tex2DNode166.b - tex2DNode166.r ) , _LimbalEdge_Adjustment);
				float clampResult721 = clamp( lerpResult706 , 0.0 , 1.0 );
				float IrisPupil_MASK585 = clampResult721;
				float lerpResult536 = lerp( _PupilSize , ( _PupilSize + ( ( ( temp_output_1182_0 * dotResult4_g179 ) * IrisPupil_MASK585 ) * _PupilAutoDilateFactor ) ) , _PupilAffectedByLight_Amount);
				float clampResult545 = clamp( lerpResult536 , 0.0 , 99.0 );
				float temp_output_151_0 = ( 100.0 - clampResult545 );
				float2 appendResult149 = (float2(( temp_output_151_0 / 2.0 ) , ( temp_output_151_0 / ( _PupilHeightWidthRatio * 2.0 ) )));
				float4 appendResult152 = (float4(temp_output_151_0 , ( temp_output_151_0 / _PupilHeightWidthRatio ) , 0.0 , 0.0));
				float2 uv_ParallaxMask416 = IN.ase_texcoord7.yz;
				float4 tex2DNode416 = tex2D( _ParallaxMask, uv_ParallaxMask416 );
				float lerpResult1007 = lerp( tex2DNode416.r , ( 1.0 - tex2DNode416.r ) , _ParallaxMaskInverter);
				float lerpResult418 = lerp( 0.0 , lerpResult1007 , _PushParallaxMask);
				float PupilParallaxHeight574 = _PupilParallaxHeight;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset255 = ParallaxOffset( lerpResult418 , PupilParallaxHeight574 , ase_tanViewDir );
				float clampResult924 = clamp( _PupilHeightWidthRatio , 1.0 , 10.0 );
				float2 appendResult927 = (float2(1.0 , (1.0 + (clampResult924 - 1.0) * (0.0 - 1.0) / (10.0 - 1.0))));
				float2 ParallaxPush_Vec2580 = ( paralaxOffset255 * appendResult927 );
				float2 texCoord147 = IN.ase_texcoord7.yz * appendResult152.xy + ParallaxPush_Vec2580;
				float clampResult122 = clamp( ( pow( distance( appendResult149 , texCoord147 ) , ( _PupilSharpness * 7.0 ) ) + ( 1.0 - IrisPupil_MASK585 ) ) , 0.0 , 1.0 );
				float PupilMaskArea625 = clampResult122;
				float Sclera_MASK591 = tex2DNode166.g;
				float clampResult719 = clamp( ( ( _EyeVeinColorAmountA.a * 1.5 ) * Sclera_MASK591 ) , 0.0 , 1.0 );
				float4 lerpResult177 = lerp( ( ( 2.0 * _EyeBallColorGlossA ) * ( 1.0 - IrisPupil_MASK585 ) ) , ( _EyeVeinColorAmountA * Sclera_MASK591 ) , clampResult719);
				float4 LimbalRing_Color619 = _RingColorAmount;
				float temp_output_1018_0 = ( ( tex2DNode166.r + 0.0 ) * _LimbalEdge_Adjustment );
				float lerpResult1020 = lerp( temp_output_1018_0 , ( temp_output_1018_0 * temp_output_1018_0 * temp_output_1018_0 * temp_output_1018_0 * temp_output_1018_0 * temp_output_1018_0 ) , _LimbalEdge_Finesse);
				float LimbalRing_MASK590 = saturate( lerpResult1020 );
				float eyeLimbalRingPower612 = ( _RingColorAmount.a * LimbalRing_MASK590 );
				float4 lerpResult184 = lerp( lerpResult177 , LimbalRing_Color619 , eyeLimbalRingPower612);
				float IrisPupilFactor577 = ( temp_output_151_0 * _IrisPupilBond );
				float eyeSizing616 = ( _IrisSize + _EyeSize + IrisPupilFactor577 );
				float2 temp_cast_13 = (eyeSizing616).xx;
				float ParalaxMaskPower930 = lerpResult418;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float2 paralaxOffset411 = ParallaxOffset( tex2DNode416.r , ( PupilParallaxHeight574 * 0.1 ) , ase_tanViewDir );
				float2 texCoord190 = IN.ase_texcoord7.yz * temp_cast_13 + ( ( ( ParallaxPush_Vec2580 * ParalaxMaskPower930 ) + ( ( 1.0 - eyeSizing616 ) / 2.0 ) ) + ( paralaxOffset411 * ( _IrisParallaxPower * 4.0 ) ) );
				float mulTime765 = _TimeParameters.x * _IrisRotationAnim;
				float cos764 = cos( mulTime765 );
				float sin764 = sin( mulTime765 );
				float2 rotator764 = mul( texCoord190 - float2( 0.5,0.5 ) , float2x2( cos764 , -sin764 , sin764 , cos764 )) + float2( 0.5,0.5 );
				float _MinimumGlow_Instance = UNITY_ACCESS_INSTANCED_PROP(RRF_HumanShadersEyeShadersEyeShader_Model4URP,_MinimumGlow);
				float dotResult880 = dot( SafeNormalize(_MainLightPosition.xyz) , IN.ase_normal );
				float clampResult894 = clamp( ( dotResult880 * 0.01 ) , 0.0 , 1.0 );
				float4 BaseIrisColors809 = ( ( ( ( ( tex2D( _IrisExtraDetail, rotator764 ) * _IrisExtraColorAmountA ) * _IrisExtraColorAmountA.a ) * IrisPupil_MASK585 ) + ( IrisPupil_MASK585 * _IrisBaseColor ) ) * _MinimumGlow_Instance * ( ( 4.0 * clampResult894 ) + _MinimumGlow_Instance ) );
				float4 temp_output_326_0 = ( PupilMaskArea625 * ( ( lerpResult184 * lerpResult184 ) + BaseIrisColors809 ) );
				float dotResult5_g169 = dot( SafeNormalize(_MainLightPosition.xyz) , IN.ase_normal );
				float clampResult478 = clamp( ( ( _FalloffAdjuster * dotResult5_g169 ) * PupilMaskArea625 * _MinimumGlow_Instance ) , _MinimumGlow_Instance , 1.0 );
				float EyeShadePower1124 = _EyeShadingPower;
				float temp_output_17_0_g170 = EyeShadePower1124;
				float temp_output_12_0_g170 = ( temp_output_17_0_g170 * 0.5 );
				float4 transform3_g170 = mul(GetObjectToWorldMatrix(),float4( 0,-3,1,0.78 ));
				float dotResult6_g170 = dot( float4( WorldNormal , 0.0 ) , transform3_g170 );
				float clampResult7_g170 = clamp( dotResult6_g170 , 0.0 , 1.0 );
				float4 transform2_g170 = mul(GetObjectToWorldMatrix(),float4( 0,1.2,1,0.78 ));
				float dotResult5_g170 = dot( float4( WorldNormal , 0.0 ) , transform2_g170 );
				float clampResult8_g170 = clamp( dotResult5_g170 , 0.0 , 1.0 );
				float3 temp_cast_17 = (pow( ( clampResult7_g170 * clampResult8_g170 ) , temp_output_17_0_g170 )).xxx;
				float clampResult18_g170 = clamp( temp_output_12_0_g170 , 0.0 , 0.99 );
				float temp_output_2_0_g171 = clampResult18_g170;
				float temp_output_3_0_g171 = ( 1.0 - temp_output_2_0_g171 );
				float3 appendResult7_g171 = (float3(temp_output_3_0_g171 , temp_output_3_0_g171 , temp_output_3_0_g171));
				float4 lerpResult568 = lerp( ( temp_output_326_0 * float4( ( clampResult478 * ( temp_output_12_0_g170 * ( ( temp_cast_17 * temp_output_2_0_g171 ) + appendResult7_g171 ) ) ) , 0.0 ) ) , float4( 0,0,0,0 ) , eyeLimbalRingPower612);
				float4 lerpResult646 = lerp( _PupilColorEmissivenessA , lerpResult568 , PupilMaskArea625);
				float4 temp_output_674_0 = ( float4( eyeShading672 , 0.0 ) * lerpResult646 );
				float fresnelNdotV727 = dot( normalize( WorldNormal ), SafeNormalize(_MainLightPosition.xyz) );
				float fresnelNode727 = ( _FresLightEyeBall.x + _FresLightEyeBall.y * pow( max( 1.0 - fresnelNdotV727 , 0.0001 ), _FresLightEyeBall.z ) );
				float FresnelLight732 = ( ( 1.0 - fresnelNode727 ) * 0.01 );
				float dotResult859 = dot( SafeNormalize(_MainLightPosition.xyz) , normalizedWorldNormal );
				float temp_output_1162_0 = ( dotResult859 * 0.01 );
				float temp_output_861_0 = ( 1.0 - temp_output_1162_0 );
				float lerpResult913 = lerp( FresnelLight732 , temp_output_861_0 , _SSS_Adjuster);
				float clampResult893 = clamp( lerpResult913 , 0.0 , 1.0 );
				float4 SubSurfaceArea784 = lerpResult177;
				float4 clampResult794 = clamp( ( FresnelLight732 * SubSurfaceArea784 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float dotResult782 = dot( SafeNormalize(_MainLightPosition.xyz) , normalizedWorldNormal );
				float LightComponent779 = ( dotResult782 * 0.01 );
				float4 clampResult795 = clamp( ( LightComponent779 * SubSurfaceArea784 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float SS_FromDirLight1025 = _SSS_Light_Contact;
				float4 lerpResult987 = lerp( float4( 0,0,0,0 ) , ( clampResult794 + clampResult795 ) , SS_FromDirLight1025);
				float4 clampResult1001 = clamp( lerpResult987 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float temp_output_912_0 = ( lerpResult913 + lerpResult913 + lerpResult913 + lerpResult913 );
				float clampResult907 = clamp( SS_FromDirLight1025 , 0.01 , 1.0 );
				float temp_output_981_0 = ( temp_output_912_0 * clampResult907 );
				float4 lerpResult787 = lerp( temp_output_674_0 , ( clampResult893 * ( clampResult1001 + temp_output_674_0 ) ) , temp_output_981_0);
				float LightDotNorm998 = temp_output_1162_0;
				float saferPower993 = max( LightDotNorm998 , 0.0001 );
				float clampResult994 = clamp( ( LightDotNorm998 * pow( saferPower993 , ( _SSS_Adjuster + _SSS_Adjuster ) ) ) , 0.01 , 1.0 );
				float lerpResult1005 = lerp( temp_output_912_0 , clampResult994 , 0.5);
				float4 temp_cast_20 = (( lerpResult1005 * _MainLightColor.a )).xxxx;
				float3 desaturateInitialColor1044 = _MainLightColor.rgb;
				float desaturateDot1044 = dot( desaturateInitialColor1044, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1044 = lerp( desaturateInitialColor1044, desaturateDot1044.xxx, ( ( _SSSColour_DesatA.a - 1.0 ) * 2.0 ) );
				float4 temp_output_1045_0 = ( _SSSColour_DesatA * float4( desaturateVar1044 , 0.0 ) );
				float SSS_Spread954 = _SSS_Spread;
				float4 lerpResult973 = lerp( temp_cast_20 , temp_output_1045_0 , SSS_Spread954);
				float4 SSS_forAlbedo1030 = ( lerpResult787 * lerpResult973 * ( lerpResult913 * temp_output_981_0 * 2.0 ) );
				float Final_illumination960 = _Final_illumination;
				
				float2 temp_cast_24 = (( _MicroScatterScale * 1000.0 )).xx;
				float2 texCoord3_g176 = IN.ase_texcoord7.yz * temp_cast_24 + float2( 0,0 );
				float simplePerlin3D4_g176 = snoise( float3( texCoord3_g176 ,  0.0 ) );
				float2 appendResult6_g176 = (float2(simplePerlin3D4_g176 , simplePerlin3D4_g176));
				float4 appendResult572 = (float4(appendResult6_g176 , 1.0 , 0.0));
				float clampResult717 = clamp( ( ( 1.0 - IrisPupil_MASK585 ) * 0.1 ) , 0.0 , 1.0 );
				float4 temp_output_504_0 = ( appendResult572 * clampResult717 * _Eyeball_microScatter );
				float4 lerpResult502 = lerp( float4( float3(0,0,1) , 0.0 ) , appendResult572 , temp_output_504_0);
				float3 unpack331 = UnpackNormalScale( tex2D( _Sclera_Normal, eyeSizeUVs604 ), _ScleraBumpScale );
				unpack331.z = lerp( 1, unpack331.z, saturate(_ScleraBumpScale) );
				float3 lerpResult139 = lerp( float3(0,0,1) , UnpackNormalScale( tex2D( _Lens_Base_Normal, eyeSizeUVs604 ), 1.0f ) , _LensPush);
				float3 lerpResult569 = lerp( BlendNormal( lerpResult502.xyz , unpack331 ) , lerpResult139 , IrisPupil_MASK585);
				float3 NORMAL_OUTPUT640 = lerpResult569;
				
				float2 temp_cast_27 = (_CausticSize).xx;
				float2 temp_cast_28 = (( ( 1.0 - _CausticSize ) / 2.0 )).xx;
				float2 texCoord944 = IN.ase_texcoord7.yz * temp_cast_27 + temp_cast_28;
				float cos373 = cos( ( ( SafeNormalize(_MainLightPosition.xyz).x - _CausticRotationAdjust ) + ( 1.0 - tan( SafeNormalize(_MainLightPosition.xyz).y ) ) ) );
				float sin373 = sin( ( ( SafeNormalize(_MainLightPosition.xyz).x - _CausticRotationAdjust ) + ( 1.0 - tan( SafeNormalize(_MainLightPosition.xyz).y ) ) ) );
				float2 rotator373 = mul( texCoord944 - float2( 0.5,0.5 ) , float2x2( cos373 , -sin373 , sin373 , cos373 )) + float2( 0.5,0.5 );
				float4 tex2DNode370 = tex2D( _CausticMask, rotator373 );
				float temp_output_866_0 = ( 1.0 - _CausticTweak );
				float3 objectSpaceLightDir = IN.ase_texcoord9.xyz;
				float3 ase_objectScale = float3( length( GetObjectToWorldMatrix()[ 0 ].xyz ), length( GetObjectToWorldMatrix()[ 1 ].xyz ), length( GetObjectToWorldMatrix()[ 2 ].xyz ) );
				float fresnelNdotV1143 = dot( ( ase_objectScale * WorldNormal ), objectSpaceLightDir );
				float fresnelNode1143 = ( _BSP_IrisDirectLit.x + _BSP_IrisDirectLit.y * pow( max( 1.0 - fresnelNdotV1143 , 0.0001 ), _BSP_IrisDirectLit.z ) );
				float Gummyness1146 = saturate( fresnelNode1143 );
				float4 lerpResult761 = lerp( ( _MinimumGlow_Instance * ( BaseIrisColors809 + ( BaseIrisColors809 * tex2DNode370 * ( _CausticPower * ( ( FresnelLight732 + temp_output_866_0 ) * temp_output_866_0 ) ) ) ) ) , ( BaseIrisColors809 + ( BaseIrisColors809 * tex2DNode370 * _CausticPower ) ) , ( ( 1.0 - clampResult894 ) * ( _CausticFX_inDarkness * 1111.0 ) * ( 1.0 - saturate( LightComponent779 ) ) * ( 1.0 + ( Gummyness1146 * _IrisDirectHitPower ) ) ));
				float4 clampResult745 = clamp( lerpResult761 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 causticInDark824 = ( tex2DNode370.r * clampResult745 );
				float4 caustEmissission827 = causticInDark824;
				float lerpResult1036 = lerp( FresnelLight732 , temp_output_861_0 , SSS_Spread954);
				float lerpResult1040 = lerp( ( lerpResult1036 + lerpResult1036 + lerpResult1036 + lerpResult1036 ) , clampResult994 , 0.5);
				float4 temp_cast_29 = (( lerpResult1040 * _MainLightColor.a )).xxxx;
				float4 lerpResult1039 = lerp( temp_cast_29 , temp_output_1045_0 , SSS_Spread954);
				float4 lerpResult1032 = lerp( SSS_forAlbedo1030 , lerpResult1039 , _FinalSSS_Mixer);
				float3 desaturateInitialColor1089 = lerpResult1032.rgb;
				float desaturateDot1089 = dot( desaturateInitialColor1089, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1089 = lerp( desaturateInitialColor1089, desaturateDot1089.xxx, _FinalSSS_Desaturate );
				float3 SSS_Result1028 = desaturateVar1089;
				float4 BaseColoring814 = ( PupilMaskArea625 * _MinimumGlow_Instance * temp_output_326_0 );
				float temp_output_665_0 = ( _PupilColorEmissivenessA.a * ( 1.0 - PupilMaskArea625 ) );
				float4 lerpResult648 = lerp( saturate( ( lerpResult568 + lerpResult568 + ( BaseColoring814 + ( clampResult745 * PupilMaskArea625 ) ) ) ) , lerpResult646 , temp_output_665_0);
				float4 PreEmissive804 = lerpResult648;
				float4 PupilGlow833 = ( _PupilColorEmissivenessA * temp_output_665_0 );
				float temp_output_1012_0 = (LimbalRing_Color619).a;
				
				float clampResult661 = clamp( ( ( LimbalRing_MASK590 * _LimbalRingMetalness ) + ( _EyeBallMetalness * ( 1.0 - IrisPupil_MASK585 ) ) + ( IrisPupil_MASK585 * _IrisPupilMetalness ) ) , 0.0 , 1.0 );
				float METALNESS_OUTPUT663 = clampResult661;
				
				float EyeBallGloss622 = _EyeBallColorGlossA.a;
				float lerpResult135 = lerp( EyeBallGloss622 , ( _LensGloss * IrisPupil_MASK585 ) , IrisPupil_MASK585);
				float4 microScatter608 = temp_output_504_0;
				float lerpResult525 = lerp( ( ( _LimbalRingGloss * LimbalRing_MASK590 ) + lerpResult135 ) , 0.0 , ( ( 1.0 - IrisPupil_MASK585 ) * microScatter608 ).x);
				float SMOOTHNESS_OUTPUT642 = lerpResult525;
				
				float3 Albedo = ( SSS_forAlbedo1030 * Final_illumination960 ).rgb;
				float3 Normal = NORMAL_OUTPUT640;
				float3 Emission = ( ( ( ( ( distance( ( _MainLightPosition.xyz * _MainLightPosition.w ) , IN.ase_texcoord8.xyz ) + caustEmissission827 ) + ( float4( SSS_Result1028 , 0.0 ) * PreEmissive804 ) ) * PupilMaskArea625 ) + PupilGlow833 + ( ( ( temp_output_1012_0 * temp_output_1012_0 * temp_output_1012_0 ) * LimbalRing_MASK590 * LimbalRing_Color619 ) * _LimbalRingEmissivePower ) ) * Final_illumination960 ).rgb;
				float3 Specular = 0.5;
				float Metallic = METALNESS_OUTPUT663;
				float Smoothness = SMOOTHNESS_OUTPUT642;
				float Occlusion = 1;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
					inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
					inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
					inputData.normalWS = Normal;
					#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
				#ifdef _ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif
				half4 color = UniversalFragmentPBR(
					inputData, 
					Albedo, 
					Metallic, 
					Specular, 
					Smoothness, 
					Occlusion, 
					Emission, 
					Alpha);

				#ifdef _TRANSMISSION_ASE
				{
					float shadow = _TransmissionShadow;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += Albedo * mainTransmission;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += Albedo * transmission;
						}
					#endif
				}
				#endif

				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );

					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += Albedo * mainTranslucency * strength;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 lightDir = light.direction + inputData.normalWS * normal;
							half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );
							half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;
							color.rgb += Albedo * translucency * strength;
						}
					#endif
				}
				#endif

				#ifdef _REFRACTION_ASE
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, WorldNormal ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif
				
				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70600

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EyeVeinColorAmountA;
			float4 _IrisBaseColor;
			float4 _IrisExtraColorAmountA;
			float4 _RingColorAmount;
			float4 _EyeBallColorGlossA;
			float4 _SSSColour_DesatA;
			float4 _PupilColorEmissivenessA;
			float3 _FresLightEyeBall;
			float3 _BSP_IrisDirectLit;
			float _Final_illumination;
			float _MicroScatterScale;
			float _Eyeball_microScatter;
			float _IrisPupilMetalness;
			float _ScleraBumpScale;
			float _LensPush;
			float _CausticSize;
			float _CausticRotationAdjust;
			float _CausticPower;
			float _EyeBallMetalness;
			float _SSS_Spread;
			float _LimbalRingMetalness;
			float _CausticTweak;
			float _CausticFX_inDarkness;
			float _IrisDirectHitPower;
			float _FinalSSS_Mixer;
			float _LimbalRingEmissivePower;
			float _FinalSSS_Desaturate;
			float _EyeShadingPower;
			float _SSS_Adjuster;
			half _PupilSize;
			float _EyeSize;
			float _LimbalEdge_Adjustment;
			float _PupilAutoDilateFactor;
			float _PupilAffectedByLight_Amount;
			float _PupilHeightWidthRatio;
			float _ParallaxMaskInverter;
			float _PushParallaxMask;
			float _PupilParallaxHeight;
			float _PupilSharpness;
			float _LimbalEdge_Finesse;
			float _IrisSize;
			float _IrisPupilBond;
			float _IrisParallaxPower;
			float _IrisRotationAnim;
			float _FalloffAdjuster;
			float _LimbalRingGloss;
			float _SSS_Light_Contact;
			float _LensGloss;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			UNITY_INSTANCING_BUFFER_START(RRF_HumanShadersEyeShadersEyeShader_Model4URP)
			UNITY_INSTANCING_BUFFER_END(RRF_HumanShadersEyeShadersEyeShader_Model4URP)


			
			float3 _LightDirection;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif
				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

				float4 clipPos = TransformWorldToHClip( ApplyShadowBias( positionWS, normalWS, _LightDirection ) );

				#if UNITY_REVERSED_Z
					clipPos.z = min(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#else
					clipPos.z = max(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = clipPos;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag(	VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );
				
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif
				return 0;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70600

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EyeVeinColorAmountA;
			float4 _IrisBaseColor;
			float4 _IrisExtraColorAmountA;
			float4 _RingColorAmount;
			float4 _EyeBallColorGlossA;
			float4 _SSSColour_DesatA;
			float4 _PupilColorEmissivenessA;
			float3 _FresLightEyeBall;
			float3 _BSP_IrisDirectLit;
			float _Final_illumination;
			float _MicroScatterScale;
			float _Eyeball_microScatter;
			float _IrisPupilMetalness;
			float _ScleraBumpScale;
			float _LensPush;
			float _CausticSize;
			float _CausticRotationAdjust;
			float _CausticPower;
			float _EyeBallMetalness;
			float _SSS_Spread;
			float _LimbalRingMetalness;
			float _CausticTweak;
			float _CausticFX_inDarkness;
			float _IrisDirectHitPower;
			float _FinalSSS_Mixer;
			float _LimbalRingEmissivePower;
			float _FinalSSS_Desaturate;
			float _EyeShadingPower;
			float _SSS_Adjuster;
			half _PupilSize;
			float _EyeSize;
			float _LimbalEdge_Adjustment;
			float _PupilAutoDilateFactor;
			float _PupilAffectedByLight_Amount;
			float _PupilHeightWidthRatio;
			float _ParallaxMaskInverter;
			float _PushParallaxMask;
			float _PupilParallaxHeight;
			float _PupilSharpness;
			float _LimbalEdge_Finesse;
			float _IrisSize;
			float _IrisPupilBond;
			float _IrisParallaxPower;
			float _IrisRotationAnim;
			float _FalloffAdjuster;
			float _LimbalRingGloss;
			float _SSS_Light_Contact;
			float _LensGloss;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			UNITY_INSTANCING_BUFFER_START(RRF_HumanShadersEyeShadersEyeShader_Model4URP)
			UNITY_INSTANCING_BUFFER_END(RRF_HumanShadersEyeShadersEyeShader_Model4URP)


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif
			half4 frag(	VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				#ifdef ASE_DEPTH_WRITE_ON
				outputDepth = DepthValue;
				#endif
				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70600

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma multi_compile_instancing


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EyeVeinColorAmountA;
			float4 _IrisBaseColor;
			float4 _IrisExtraColorAmountA;
			float4 _RingColorAmount;
			float4 _EyeBallColorGlossA;
			float4 _SSSColour_DesatA;
			float4 _PupilColorEmissivenessA;
			float3 _FresLightEyeBall;
			float3 _BSP_IrisDirectLit;
			float _Final_illumination;
			float _MicroScatterScale;
			float _Eyeball_microScatter;
			float _IrisPupilMetalness;
			float _ScleraBumpScale;
			float _LensPush;
			float _CausticSize;
			float _CausticRotationAdjust;
			float _CausticPower;
			float _EyeBallMetalness;
			float _SSS_Spread;
			float _LimbalRingMetalness;
			float _CausticTweak;
			float _CausticFX_inDarkness;
			float _IrisDirectHitPower;
			float _FinalSSS_Mixer;
			float _LimbalRingEmissivePower;
			float _FinalSSS_Desaturate;
			float _EyeShadingPower;
			float _SSS_Adjuster;
			half _PupilSize;
			float _EyeSize;
			float _LimbalEdge_Adjustment;
			float _PupilAutoDilateFactor;
			float _PupilAffectedByLight_Amount;
			float _PupilHeightWidthRatio;
			float _ParallaxMaskInverter;
			float _PushParallaxMask;
			float _PupilParallaxHeight;
			float _PupilSharpness;
			float _LimbalEdge_Finesse;
			float _IrisSize;
			float _IrisPupilBond;
			float _IrisParallaxPower;
			float _IrisRotationAnim;
			float _FalloffAdjuster;
			float _LimbalRingGloss;
			float _SSS_Light_Contact;
			float _LensGloss;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _RGBMask;
			sampler2D _ParallaxMask;
			sampler2D _IrisExtraDetail;
			sampler2D _CausticMask;
			UNITY_INSTANCING_BUFFER_START(RRF_HumanShadersEyeShadersEyeShader_Model4URP)
				UNITY_DEFINE_INSTANCED_PROP(float, _MinimumGlow)
			UNITY_INSTANCING_BUFFER_END(RRF_HumanShadersEyeShadersEyeShader_Model4URP)


			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				o.ase_texcoord2.w = ase_vertexTangentSign;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				float3 normalizeWorldNormal = normalize( TransformObjectToWorldNormal(v.ase_normal) );
				o.ase_texcoord6.xyz = normalizeWorldNormal;
				
				float3 objectSpaceLightDir = mul( GetWorldToObjectMatrix(), _MainLightPosition ).xyz;
				o.ase_texcoord8.xyz = objectSpaceLightDir;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord7 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord8.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float3 ase_worldNormal = IN.ase_texcoord2.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float4 transform457 = mul(GetObjectToWorldMatrix(),float4( 0,3,1,0.78 ));
				float dotResult458 = dot( float4( normalizedWorldNormal , 0.0 ) , transform457 );
				float clampResult464 = clamp( dotResult458 , 0.0 , 1.0 );
				float4 transform462 = mul(GetObjectToWorldMatrix(),float4( 0,1.21,1,0.78 ));
				float dotResult461 = dot( float4( normalizedWorldNormal , 0.0 ) , transform462 );
				float clampResult465 = clamp( dotResult461 , 0.0 , 1.0 );
				float saferPower466 = max( ( clampResult464 * clampResult465 ) , 0.0001 );
				float4 transform3_g172 = mul(GetObjectToWorldMatrix(),float4( 0,-3,1,0.78 ));
				float dotResult6_g172 = dot( float4( ase_worldNormal , 0.0 ) , transform3_g172 );
				float clampResult7_g172 = clamp( dotResult6_g172 , 0.0 , 1.0 );
				float4 transform2_g172 = mul(GetObjectToWorldMatrix(),float4( 0,1.2,1,0.78 ));
				float dotResult5_g172 = dot( float4( ase_worldNormal , 0.0 ) , transform2_g172 );
				float clampResult8_g172 = clamp( dotResult5_g172 , 0.0 , 1.0 );
				float temp_output_17_0_g172 = _EyeShadingPower;
				float3 temp_cast_4 = (pow( ( clampResult7_g172 * clampResult8_g172 ) , temp_output_17_0_g172 )).xxx;
				float temp_output_12_0_g172 = ( temp_output_17_0_g172 * 0.5 );
				float clampResult18_g172 = clamp( temp_output_12_0_g172 , 0.0 , 0.99 );
				float temp_output_2_0_g173 = clampResult18_g172;
				float temp_output_3_0_g173 = ( 1.0 - temp_output_2_0_g173 );
				float3 appendResult7_g173 = (float3(temp_output_3_0_g173 , temp_output_3_0_g173 , temp_output_3_0_g173));
				float3 temp_output_1126_0 = ( ( temp_cast_4 * temp_output_2_0_g173 ) + appendResult7_g173 );
				float3 temp_cast_6 = (pow( saferPower466 , temp_output_1126_0.x )).xxx;
				float temp_output_2_0_g174 = ( temp_output_1126_0 * float3( 0.5,0,0 ) ).x;
				float temp_output_3_0_g174 = ( 1.0 - temp_output_2_0_g174 );
				float3 appendResult7_g174 = (float3(temp_output_3_0_g174 , temp_output_3_0_g174 , temp_output_3_0_g174));
				float3 eyeShading672 = ( ( temp_cast_6 * temp_output_2_0_g174 ) + appendResult7_g174 );
				float3 break1178 = _MainLightColor.rgb;
				float temp_output_1182_0 = ( ( break1178.x + break1178.y + break1178.z ) / 3.0 );
				float ase_vertexTangentSign = IN.ase_texcoord2.w;
				float3 temp_cast_9 = (ase_vertexTangentSign).xxx;
				float dotResult4_g179 = dot( SafeNormalize(_MainLightPosition.xyz) , temp_cast_9 );
				float2 temp_cast_10 = (_EyeSize).xx;
				float2 temp_cast_11 = (( ( 1.0 - _EyeSize ) / 2.0 )).xx;
				float2 texCoord264 = IN.ase_texcoord3.xy * temp_cast_10 + temp_cast_11;
				float2 eyeSizeUVs604 = texCoord264;
				float4 tex2DNode166 = tex2D( _RGBMask, eyeSizeUVs604 );
				float lerpResult706 = lerp( tex2DNode166.b , ( tex2DNode166.b - tex2DNode166.r ) , _LimbalEdge_Adjustment);
				float clampResult721 = clamp( lerpResult706 , 0.0 , 1.0 );
				float IrisPupil_MASK585 = clampResult721;
				float lerpResult536 = lerp( _PupilSize , ( _PupilSize + ( ( ( temp_output_1182_0 * dotResult4_g179 ) * IrisPupil_MASK585 ) * _PupilAutoDilateFactor ) ) , _PupilAffectedByLight_Amount);
				float clampResult545 = clamp( lerpResult536 , 0.0 , 99.0 );
				float temp_output_151_0 = ( 100.0 - clampResult545 );
				float2 appendResult149 = (float2(( temp_output_151_0 / 2.0 ) , ( temp_output_151_0 / ( _PupilHeightWidthRatio * 2.0 ) )));
				float4 appendResult152 = (float4(temp_output_151_0 , ( temp_output_151_0 / _PupilHeightWidthRatio ) , 0.0 , 0.0));
				float2 uv_ParallaxMask416 = IN.ase_texcoord3.xy;
				float4 tex2DNode416 = tex2D( _ParallaxMask, uv_ParallaxMask416 );
				float lerpResult1007 = lerp( tex2DNode416.r , ( 1.0 - tex2DNode416.r ) , _ParallaxMaskInverter);
				float lerpResult418 = lerp( 0.0 , lerpResult1007 , _PushParallaxMask);
				float PupilParallaxHeight574 = _PupilParallaxHeight;
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset255 = ParallaxOffset( lerpResult418 , PupilParallaxHeight574 , ase_tanViewDir );
				float clampResult924 = clamp( _PupilHeightWidthRatio , 1.0 , 10.0 );
				float2 appendResult927 = (float2(1.0 , (1.0 + (clampResult924 - 1.0) * (0.0 - 1.0) / (10.0 - 1.0))));
				float2 ParallaxPush_Vec2580 = ( paralaxOffset255 * appendResult927 );
				float2 texCoord147 = IN.ase_texcoord3.xy * appendResult152.xy + ParallaxPush_Vec2580;
				float clampResult122 = clamp( ( pow( distance( appendResult149 , texCoord147 ) , ( _PupilSharpness * 7.0 ) ) + ( 1.0 - IrisPupil_MASK585 ) ) , 0.0 , 1.0 );
				float PupilMaskArea625 = clampResult122;
				float Sclera_MASK591 = tex2DNode166.g;
				float clampResult719 = clamp( ( ( _EyeVeinColorAmountA.a * 1.5 ) * Sclera_MASK591 ) , 0.0 , 1.0 );
				float4 lerpResult177 = lerp( ( ( 2.0 * _EyeBallColorGlossA ) * ( 1.0 - IrisPupil_MASK585 ) ) , ( _EyeVeinColorAmountA * Sclera_MASK591 ) , clampResult719);
				float4 LimbalRing_Color619 = _RingColorAmount;
				float temp_output_1018_0 = ( ( tex2DNode166.r + 0.0 ) * _LimbalEdge_Adjustment );
				float lerpResult1020 = lerp( temp_output_1018_0 , ( temp_output_1018_0 * temp_output_1018_0 * temp_output_1018_0 * temp_output_1018_0 * temp_output_1018_0 * temp_output_1018_0 ) , _LimbalEdge_Finesse);
				float LimbalRing_MASK590 = saturate( lerpResult1020 );
				float eyeLimbalRingPower612 = ( _RingColorAmount.a * LimbalRing_MASK590 );
				float4 lerpResult184 = lerp( lerpResult177 , LimbalRing_Color619 , eyeLimbalRingPower612);
				float IrisPupilFactor577 = ( temp_output_151_0 * _IrisPupilBond );
				float eyeSizing616 = ( _IrisSize + _EyeSize + IrisPupilFactor577 );
				float2 temp_cast_13 = (eyeSizing616).xx;
				float ParalaxMaskPower930 = lerpResult418;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float2 paralaxOffset411 = ParallaxOffset( tex2DNode416.r , ( PupilParallaxHeight574 * 0.1 ) , ase_tanViewDir );
				float2 texCoord190 = IN.ase_texcoord3.xy * temp_cast_13 + ( ( ( ParallaxPush_Vec2580 * ParalaxMaskPower930 ) + ( ( 1.0 - eyeSizing616 ) / 2.0 ) ) + ( paralaxOffset411 * ( _IrisParallaxPower * 4.0 ) ) );
				float mulTime765 = _TimeParameters.x * _IrisRotationAnim;
				float cos764 = cos( mulTime765 );
				float sin764 = sin( mulTime765 );
				float2 rotator764 = mul( texCoord190 - float2( 0.5,0.5 ) , float2x2( cos764 , -sin764 , sin764 , cos764 )) + float2( 0.5,0.5 );
				float _MinimumGlow_Instance = UNITY_ACCESS_INSTANCED_PROP(RRF_HumanShadersEyeShadersEyeShader_Model4URP,_MinimumGlow);
				float dotResult880 = dot( SafeNormalize(_MainLightPosition.xyz) , IN.ase_normal );
				float clampResult894 = clamp( ( dotResult880 * 0.01 ) , 0.0 , 1.0 );
				float4 BaseIrisColors809 = ( ( ( ( ( tex2D( _IrisExtraDetail, rotator764 ) * _IrisExtraColorAmountA ) * _IrisExtraColorAmountA.a ) * IrisPupil_MASK585 ) + ( IrisPupil_MASK585 * _IrisBaseColor ) ) * _MinimumGlow_Instance * ( ( 4.0 * clampResult894 ) + _MinimumGlow_Instance ) );
				float4 temp_output_326_0 = ( PupilMaskArea625 * ( ( lerpResult184 * lerpResult184 ) + BaseIrisColors809 ) );
				float dotResult5_g169 = dot( SafeNormalize(_MainLightPosition.xyz) , IN.ase_normal );
				float clampResult478 = clamp( ( ( _FalloffAdjuster * dotResult5_g169 ) * PupilMaskArea625 * _MinimumGlow_Instance ) , _MinimumGlow_Instance , 1.0 );
				float EyeShadePower1124 = _EyeShadingPower;
				float temp_output_17_0_g170 = EyeShadePower1124;
				float temp_output_12_0_g170 = ( temp_output_17_0_g170 * 0.5 );
				float4 transform3_g170 = mul(GetObjectToWorldMatrix(),float4( 0,-3,1,0.78 ));
				float dotResult6_g170 = dot( float4( ase_worldNormal , 0.0 ) , transform3_g170 );
				float clampResult7_g170 = clamp( dotResult6_g170 , 0.0 , 1.0 );
				float4 transform2_g170 = mul(GetObjectToWorldMatrix(),float4( 0,1.2,1,0.78 ));
				float dotResult5_g170 = dot( float4( ase_worldNormal , 0.0 ) , transform2_g170 );
				float clampResult8_g170 = clamp( dotResult5_g170 , 0.0 , 1.0 );
				float3 temp_cast_17 = (pow( ( clampResult7_g170 * clampResult8_g170 ) , temp_output_17_0_g170 )).xxx;
				float clampResult18_g170 = clamp( temp_output_12_0_g170 , 0.0 , 0.99 );
				float temp_output_2_0_g171 = clampResult18_g170;
				float temp_output_3_0_g171 = ( 1.0 - temp_output_2_0_g171 );
				float3 appendResult7_g171 = (float3(temp_output_3_0_g171 , temp_output_3_0_g171 , temp_output_3_0_g171));
				float4 lerpResult568 = lerp( ( temp_output_326_0 * float4( ( clampResult478 * ( temp_output_12_0_g170 * ( ( temp_cast_17 * temp_output_2_0_g171 ) + appendResult7_g171 ) ) ) , 0.0 ) ) , float4( 0,0,0,0 ) , eyeLimbalRingPower612);
				float4 lerpResult646 = lerp( _PupilColorEmissivenessA , lerpResult568 , PupilMaskArea625);
				float4 temp_output_674_0 = ( float4( eyeShading672 , 0.0 ) * lerpResult646 );
				float3 normalizeWorldNormal = IN.ase_texcoord6.xyz;
				float fresnelNdotV727 = dot( normalizeWorldNormal, SafeNormalize(_MainLightPosition.xyz) );
				float fresnelNode727 = ( _FresLightEyeBall.x + _FresLightEyeBall.y * pow( max( 1.0 - fresnelNdotV727 , 0.0001 ), _FresLightEyeBall.z ) );
				float FresnelLight732 = ( ( 1.0 - fresnelNode727 ) * 0.01 );
				float dotResult859 = dot( SafeNormalize(_MainLightPosition.xyz) , normalizedWorldNormal );
				float temp_output_1162_0 = ( dotResult859 * 0.01 );
				float temp_output_861_0 = ( 1.0 - temp_output_1162_0 );
				float lerpResult913 = lerp( FresnelLight732 , temp_output_861_0 , _SSS_Adjuster);
				float clampResult893 = clamp( lerpResult913 , 0.0 , 1.0 );
				float4 SubSurfaceArea784 = lerpResult177;
				float4 clampResult794 = clamp( ( FresnelLight732 * SubSurfaceArea784 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float dotResult782 = dot( SafeNormalize(_MainLightPosition.xyz) , normalizedWorldNormal );
				float LightComponent779 = ( dotResult782 * 0.01 );
				float4 clampResult795 = clamp( ( LightComponent779 * SubSurfaceArea784 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float SS_FromDirLight1025 = _SSS_Light_Contact;
				float4 lerpResult987 = lerp( float4( 0,0,0,0 ) , ( clampResult794 + clampResult795 ) , SS_FromDirLight1025);
				float4 clampResult1001 = clamp( lerpResult987 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float temp_output_912_0 = ( lerpResult913 + lerpResult913 + lerpResult913 + lerpResult913 );
				float clampResult907 = clamp( SS_FromDirLight1025 , 0.01 , 1.0 );
				float temp_output_981_0 = ( temp_output_912_0 * clampResult907 );
				float4 lerpResult787 = lerp( temp_output_674_0 , ( clampResult893 * ( clampResult1001 + temp_output_674_0 ) ) , temp_output_981_0);
				float LightDotNorm998 = temp_output_1162_0;
				float saferPower993 = max( LightDotNorm998 , 0.0001 );
				float clampResult994 = clamp( ( LightDotNorm998 * pow( saferPower993 , ( _SSS_Adjuster + _SSS_Adjuster ) ) ) , 0.01 , 1.0 );
				float lerpResult1005 = lerp( temp_output_912_0 , clampResult994 , 0.5);
				float4 temp_cast_20 = (( lerpResult1005 * _MainLightColor.a )).xxxx;
				float3 desaturateInitialColor1044 = _MainLightColor.rgb;
				float desaturateDot1044 = dot( desaturateInitialColor1044, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1044 = lerp( desaturateInitialColor1044, desaturateDot1044.xxx, ( ( _SSSColour_DesatA.a - 1.0 ) * 2.0 ) );
				float4 temp_output_1045_0 = ( _SSSColour_DesatA * float4( desaturateVar1044 , 0.0 ) );
				float SSS_Spread954 = _SSS_Spread;
				float4 lerpResult973 = lerp( temp_cast_20 , temp_output_1045_0 , SSS_Spread954);
				float4 SSS_forAlbedo1030 = ( lerpResult787 * lerpResult973 * ( lerpResult913 * temp_output_981_0 * 2.0 ) );
				float Final_illumination960 = _Final_illumination;
				
				float2 temp_cast_23 = (_CausticSize).xx;
				float2 temp_cast_24 = (( ( 1.0 - _CausticSize ) / 2.0 )).xx;
				float2 texCoord944 = IN.ase_texcoord3.xy * temp_cast_23 + temp_cast_24;
				float cos373 = cos( ( ( SafeNormalize(_MainLightPosition.xyz).x - _CausticRotationAdjust ) + ( 1.0 - tan( SafeNormalize(_MainLightPosition.xyz).y ) ) ) );
				float sin373 = sin( ( ( SafeNormalize(_MainLightPosition.xyz).x - _CausticRotationAdjust ) + ( 1.0 - tan( SafeNormalize(_MainLightPosition.xyz).y ) ) ) );
				float2 rotator373 = mul( texCoord944 - float2( 0.5,0.5 ) , float2x2( cos373 , -sin373 , sin373 , cos373 )) + float2( 0.5,0.5 );
				float4 tex2DNode370 = tex2D( _CausticMask, rotator373 );
				float temp_output_866_0 = ( 1.0 - _CausticTweak );
				float3 objectSpaceLightDir = IN.ase_texcoord8.xyz;
				float3 ase_objectScale = float3( length( GetObjectToWorldMatrix()[ 0 ].xyz ), length( GetObjectToWorldMatrix()[ 1 ].xyz ), length( GetObjectToWorldMatrix()[ 2 ].xyz ) );
				float fresnelNdotV1143 = dot( ( ase_objectScale * ase_worldNormal ), objectSpaceLightDir );
				float fresnelNode1143 = ( _BSP_IrisDirectLit.x + _BSP_IrisDirectLit.y * pow( max( 1.0 - fresnelNdotV1143 , 0.0001 ), _BSP_IrisDirectLit.z ) );
				float Gummyness1146 = saturate( fresnelNode1143 );
				float4 lerpResult761 = lerp( ( _MinimumGlow_Instance * ( BaseIrisColors809 + ( BaseIrisColors809 * tex2DNode370 * ( _CausticPower * ( ( FresnelLight732 + temp_output_866_0 ) * temp_output_866_0 ) ) ) ) ) , ( BaseIrisColors809 + ( BaseIrisColors809 * tex2DNode370 * _CausticPower ) ) , ( ( 1.0 - clampResult894 ) * ( _CausticFX_inDarkness * 1111.0 ) * ( 1.0 - saturate( LightComponent779 ) ) * ( 1.0 + ( Gummyness1146 * _IrisDirectHitPower ) ) ));
				float4 clampResult745 = clamp( lerpResult761 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 causticInDark824 = ( tex2DNode370.r * clampResult745 );
				float4 caustEmissission827 = causticInDark824;
				float lerpResult1036 = lerp( FresnelLight732 , temp_output_861_0 , SSS_Spread954);
				float lerpResult1040 = lerp( ( lerpResult1036 + lerpResult1036 + lerpResult1036 + lerpResult1036 ) , clampResult994 , 0.5);
				float4 temp_cast_25 = (( lerpResult1040 * _MainLightColor.a )).xxxx;
				float4 lerpResult1039 = lerp( temp_cast_25 , temp_output_1045_0 , SSS_Spread954);
				float4 lerpResult1032 = lerp( SSS_forAlbedo1030 , lerpResult1039 , _FinalSSS_Mixer);
				float3 desaturateInitialColor1089 = lerpResult1032.rgb;
				float desaturateDot1089 = dot( desaturateInitialColor1089, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1089 = lerp( desaturateInitialColor1089, desaturateDot1089.xxx, _FinalSSS_Desaturate );
				float3 SSS_Result1028 = desaturateVar1089;
				float4 BaseColoring814 = ( PupilMaskArea625 * _MinimumGlow_Instance * temp_output_326_0 );
				float temp_output_665_0 = ( _PupilColorEmissivenessA.a * ( 1.0 - PupilMaskArea625 ) );
				float4 lerpResult648 = lerp( saturate( ( lerpResult568 + lerpResult568 + ( BaseColoring814 + ( clampResult745 * PupilMaskArea625 ) ) ) ) , lerpResult646 , temp_output_665_0);
				float4 PreEmissive804 = lerpResult648;
				float4 PupilGlow833 = ( _PupilColorEmissivenessA * temp_output_665_0 );
				float temp_output_1012_0 = (LimbalRing_Color619).a;
				
				
				float3 Albedo = ( SSS_forAlbedo1030 * Final_illumination960 ).rgb;
				float3 Emission = ( ( ( ( ( distance( ( _MainLightPosition.xyz * _MainLightPosition.w ) , IN.ase_texcoord7.xyz ) + caustEmissission827 ) + ( float4( SSS_Result1028 , 0.0 ) * PreEmissive804 ) ) * PupilMaskArea625 ) + PupilGlow833 + ( ( ( temp_output_1012_0 * temp_output_1012_0 * temp_output_1012_0 ) * LimbalRing_MASK590 * LimbalRing_Color619 ) * _LimbalRingEmissivePower ) ) * Final_illumination960 ).rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = Albedo;
				metaInput.Emission = Emission;
				
				return MetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70600

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_NORMAL
			#pragma multi_compile_instancing


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EyeVeinColorAmountA;
			float4 _IrisBaseColor;
			float4 _IrisExtraColorAmountA;
			float4 _RingColorAmount;
			float4 _EyeBallColorGlossA;
			float4 _SSSColour_DesatA;
			float4 _PupilColorEmissivenessA;
			float3 _FresLightEyeBall;
			float3 _BSP_IrisDirectLit;
			float _Final_illumination;
			float _MicroScatterScale;
			float _Eyeball_microScatter;
			float _IrisPupilMetalness;
			float _ScleraBumpScale;
			float _LensPush;
			float _CausticSize;
			float _CausticRotationAdjust;
			float _CausticPower;
			float _EyeBallMetalness;
			float _SSS_Spread;
			float _LimbalRingMetalness;
			float _CausticTweak;
			float _CausticFX_inDarkness;
			float _IrisDirectHitPower;
			float _FinalSSS_Mixer;
			float _LimbalRingEmissivePower;
			float _FinalSSS_Desaturate;
			float _EyeShadingPower;
			float _SSS_Adjuster;
			half _PupilSize;
			float _EyeSize;
			float _LimbalEdge_Adjustment;
			float _PupilAutoDilateFactor;
			float _PupilAffectedByLight_Amount;
			float _PupilHeightWidthRatio;
			float _ParallaxMaskInverter;
			float _PushParallaxMask;
			float _PupilParallaxHeight;
			float _PupilSharpness;
			float _LimbalEdge_Finesse;
			float _IrisSize;
			float _IrisPupilBond;
			float _IrisParallaxPower;
			float _IrisRotationAnim;
			float _FalloffAdjuster;
			float _LimbalRingGloss;
			float _SSS_Light_Contact;
			float _LensGloss;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _RGBMask;
			sampler2D _ParallaxMask;
			sampler2D _IrisExtraDetail;
			UNITY_INSTANCING_BUFFER_START(RRF_HumanShadersEyeShadersEyeShader_Model4URP)
				UNITY_DEFINE_INSTANCED_PROP(float, _MinimumGlow)
			UNITY_INSTANCING_BUFFER_END(RRF_HumanShadersEyeShadersEyeShader_Model4URP)


			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				o.ase_texcoord2.w = ase_vertexTangentSign;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				float3 normalizeWorldNormal = normalize( TransformObjectToWorldNormal(v.ase_normal) );
				o.ase_texcoord6.xyz = normalizeWorldNormal;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_normal = v.ase_normal;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float3 ase_worldNormal = IN.ase_texcoord2.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float4 transform457 = mul(GetObjectToWorldMatrix(),float4( 0,3,1,0.78 ));
				float dotResult458 = dot( float4( normalizedWorldNormal , 0.0 ) , transform457 );
				float clampResult464 = clamp( dotResult458 , 0.0 , 1.0 );
				float4 transform462 = mul(GetObjectToWorldMatrix(),float4( 0,1.21,1,0.78 ));
				float dotResult461 = dot( float4( normalizedWorldNormal , 0.0 ) , transform462 );
				float clampResult465 = clamp( dotResult461 , 0.0 , 1.0 );
				float saferPower466 = max( ( clampResult464 * clampResult465 ) , 0.0001 );
				float4 transform3_g172 = mul(GetObjectToWorldMatrix(),float4( 0,-3,1,0.78 ));
				float dotResult6_g172 = dot( float4( ase_worldNormal , 0.0 ) , transform3_g172 );
				float clampResult7_g172 = clamp( dotResult6_g172 , 0.0 , 1.0 );
				float4 transform2_g172 = mul(GetObjectToWorldMatrix(),float4( 0,1.2,1,0.78 ));
				float dotResult5_g172 = dot( float4( ase_worldNormal , 0.0 ) , transform2_g172 );
				float clampResult8_g172 = clamp( dotResult5_g172 , 0.0 , 1.0 );
				float temp_output_17_0_g172 = _EyeShadingPower;
				float3 temp_cast_4 = (pow( ( clampResult7_g172 * clampResult8_g172 ) , temp_output_17_0_g172 )).xxx;
				float temp_output_12_0_g172 = ( temp_output_17_0_g172 * 0.5 );
				float clampResult18_g172 = clamp( temp_output_12_0_g172 , 0.0 , 0.99 );
				float temp_output_2_0_g173 = clampResult18_g172;
				float temp_output_3_0_g173 = ( 1.0 - temp_output_2_0_g173 );
				float3 appendResult7_g173 = (float3(temp_output_3_0_g173 , temp_output_3_0_g173 , temp_output_3_0_g173));
				float3 temp_output_1126_0 = ( ( temp_cast_4 * temp_output_2_0_g173 ) + appendResult7_g173 );
				float3 temp_cast_6 = (pow( saferPower466 , temp_output_1126_0.x )).xxx;
				float temp_output_2_0_g174 = ( temp_output_1126_0 * float3( 0.5,0,0 ) ).x;
				float temp_output_3_0_g174 = ( 1.0 - temp_output_2_0_g174 );
				float3 appendResult7_g174 = (float3(temp_output_3_0_g174 , temp_output_3_0_g174 , temp_output_3_0_g174));
				float3 eyeShading672 = ( ( temp_cast_6 * temp_output_2_0_g174 ) + appendResult7_g174 );
				float3 break1178 = _MainLightColor.rgb;
				float temp_output_1182_0 = ( ( break1178.x + break1178.y + break1178.z ) / 3.0 );
				float ase_vertexTangentSign = IN.ase_texcoord2.w;
				float3 temp_cast_9 = (ase_vertexTangentSign).xxx;
				float dotResult4_g179 = dot( SafeNormalize(_MainLightPosition.xyz) , temp_cast_9 );
				float2 temp_cast_10 = (_EyeSize).xx;
				float2 temp_cast_11 = (( ( 1.0 - _EyeSize ) / 2.0 )).xx;
				float2 texCoord264 = IN.ase_texcoord3.xy * temp_cast_10 + temp_cast_11;
				float2 eyeSizeUVs604 = texCoord264;
				float4 tex2DNode166 = tex2D( _RGBMask, eyeSizeUVs604 );
				float lerpResult706 = lerp( tex2DNode166.b , ( tex2DNode166.b - tex2DNode166.r ) , _LimbalEdge_Adjustment);
				float clampResult721 = clamp( lerpResult706 , 0.0 , 1.0 );
				float IrisPupil_MASK585 = clampResult721;
				float lerpResult536 = lerp( _PupilSize , ( _PupilSize + ( ( ( temp_output_1182_0 * dotResult4_g179 ) * IrisPupil_MASK585 ) * _PupilAutoDilateFactor ) ) , _PupilAffectedByLight_Amount);
				float clampResult545 = clamp( lerpResult536 , 0.0 , 99.0 );
				float temp_output_151_0 = ( 100.0 - clampResult545 );
				float2 appendResult149 = (float2(( temp_output_151_0 / 2.0 ) , ( temp_output_151_0 / ( _PupilHeightWidthRatio * 2.0 ) )));
				float4 appendResult152 = (float4(temp_output_151_0 , ( temp_output_151_0 / _PupilHeightWidthRatio ) , 0.0 , 0.0));
				float2 uv_ParallaxMask416 = IN.ase_texcoord3.xy;
				float4 tex2DNode416 = tex2D( _ParallaxMask, uv_ParallaxMask416 );
				float lerpResult1007 = lerp( tex2DNode416.r , ( 1.0 - tex2DNode416.r ) , _ParallaxMaskInverter);
				float lerpResult418 = lerp( 0.0 , lerpResult1007 , _PushParallaxMask);
				float PupilParallaxHeight574 = _PupilParallaxHeight;
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset255 = ParallaxOffset( lerpResult418 , PupilParallaxHeight574 , ase_tanViewDir );
				float clampResult924 = clamp( _PupilHeightWidthRatio , 1.0 , 10.0 );
				float2 appendResult927 = (float2(1.0 , (1.0 + (clampResult924 - 1.0) * (0.0 - 1.0) / (10.0 - 1.0))));
				float2 ParallaxPush_Vec2580 = ( paralaxOffset255 * appendResult927 );
				float2 texCoord147 = IN.ase_texcoord3.xy * appendResult152.xy + ParallaxPush_Vec2580;
				float clampResult122 = clamp( ( pow( distance( appendResult149 , texCoord147 ) , ( _PupilSharpness * 7.0 ) ) + ( 1.0 - IrisPupil_MASK585 ) ) , 0.0 , 1.0 );
				float PupilMaskArea625 = clampResult122;
				float Sclera_MASK591 = tex2DNode166.g;
				float clampResult719 = clamp( ( ( _EyeVeinColorAmountA.a * 1.5 ) * Sclera_MASK591 ) , 0.0 , 1.0 );
				float4 lerpResult177 = lerp( ( ( 2.0 * _EyeBallColorGlossA ) * ( 1.0 - IrisPupil_MASK585 ) ) , ( _EyeVeinColorAmountA * Sclera_MASK591 ) , clampResult719);
				float4 LimbalRing_Color619 = _RingColorAmount;
				float temp_output_1018_0 = ( ( tex2DNode166.r + 0.0 ) * _LimbalEdge_Adjustment );
				float lerpResult1020 = lerp( temp_output_1018_0 , ( temp_output_1018_0 * temp_output_1018_0 * temp_output_1018_0 * temp_output_1018_0 * temp_output_1018_0 * temp_output_1018_0 ) , _LimbalEdge_Finesse);
				float LimbalRing_MASK590 = saturate( lerpResult1020 );
				float eyeLimbalRingPower612 = ( _RingColorAmount.a * LimbalRing_MASK590 );
				float4 lerpResult184 = lerp( lerpResult177 , LimbalRing_Color619 , eyeLimbalRingPower612);
				float IrisPupilFactor577 = ( temp_output_151_0 * _IrisPupilBond );
				float eyeSizing616 = ( _IrisSize + _EyeSize + IrisPupilFactor577 );
				float2 temp_cast_13 = (eyeSizing616).xx;
				float ParalaxMaskPower930 = lerpResult418;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float2 paralaxOffset411 = ParallaxOffset( tex2DNode416.r , ( PupilParallaxHeight574 * 0.1 ) , ase_tanViewDir );
				float2 texCoord190 = IN.ase_texcoord3.xy * temp_cast_13 + ( ( ( ParallaxPush_Vec2580 * ParalaxMaskPower930 ) + ( ( 1.0 - eyeSizing616 ) / 2.0 ) ) + ( paralaxOffset411 * ( _IrisParallaxPower * 4.0 ) ) );
				float mulTime765 = _TimeParameters.x * _IrisRotationAnim;
				float cos764 = cos( mulTime765 );
				float sin764 = sin( mulTime765 );
				float2 rotator764 = mul( texCoord190 - float2( 0.5,0.5 ) , float2x2( cos764 , -sin764 , sin764 , cos764 )) + float2( 0.5,0.5 );
				float _MinimumGlow_Instance = UNITY_ACCESS_INSTANCED_PROP(RRF_HumanShadersEyeShadersEyeShader_Model4URP,_MinimumGlow);
				float dotResult880 = dot( SafeNormalize(_MainLightPosition.xyz) , IN.ase_normal );
				float clampResult894 = clamp( ( dotResult880 * 0.01 ) , 0.0 , 1.0 );
				float4 BaseIrisColors809 = ( ( ( ( ( tex2D( _IrisExtraDetail, rotator764 ) * _IrisExtraColorAmountA ) * _IrisExtraColorAmountA.a ) * IrisPupil_MASK585 ) + ( IrisPupil_MASK585 * _IrisBaseColor ) ) * _MinimumGlow_Instance * ( ( 4.0 * clampResult894 ) + _MinimumGlow_Instance ) );
				float4 temp_output_326_0 = ( PupilMaskArea625 * ( ( lerpResult184 * lerpResult184 ) + BaseIrisColors809 ) );
				float dotResult5_g169 = dot( SafeNormalize(_MainLightPosition.xyz) , IN.ase_normal );
				float clampResult478 = clamp( ( ( _FalloffAdjuster * dotResult5_g169 ) * PupilMaskArea625 * _MinimumGlow_Instance ) , _MinimumGlow_Instance , 1.0 );
				float EyeShadePower1124 = _EyeShadingPower;
				float temp_output_17_0_g170 = EyeShadePower1124;
				float temp_output_12_0_g170 = ( temp_output_17_0_g170 * 0.5 );
				float4 transform3_g170 = mul(GetObjectToWorldMatrix(),float4( 0,-3,1,0.78 ));
				float dotResult6_g170 = dot( float4( ase_worldNormal , 0.0 ) , transform3_g170 );
				float clampResult7_g170 = clamp( dotResult6_g170 , 0.0 , 1.0 );
				float4 transform2_g170 = mul(GetObjectToWorldMatrix(),float4( 0,1.2,1,0.78 ));
				float dotResult5_g170 = dot( float4( ase_worldNormal , 0.0 ) , transform2_g170 );
				float clampResult8_g170 = clamp( dotResult5_g170 , 0.0 , 1.0 );
				float3 temp_cast_17 = (pow( ( clampResult7_g170 * clampResult8_g170 ) , temp_output_17_0_g170 )).xxx;
				float clampResult18_g170 = clamp( temp_output_12_0_g170 , 0.0 , 0.99 );
				float temp_output_2_0_g171 = clampResult18_g170;
				float temp_output_3_0_g171 = ( 1.0 - temp_output_2_0_g171 );
				float3 appendResult7_g171 = (float3(temp_output_3_0_g171 , temp_output_3_0_g171 , temp_output_3_0_g171));
				float4 lerpResult568 = lerp( ( temp_output_326_0 * float4( ( clampResult478 * ( temp_output_12_0_g170 * ( ( temp_cast_17 * temp_output_2_0_g171 ) + appendResult7_g171 ) ) ) , 0.0 ) ) , float4( 0,0,0,0 ) , eyeLimbalRingPower612);
				float4 lerpResult646 = lerp( _PupilColorEmissivenessA , lerpResult568 , PupilMaskArea625);
				float4 temp_output_674_0 = ( float4( eyeShading672 , 0.0 ) * lerpResult646 );
				float3 normalizeWorldNormal = IN.ase_texcoord6.xyz;
				float fresnelNdotV727 = dot( normalizeWorldNormal, SafeNormalize(_MainLightPosition.xyz) );
				float fresnelNode727 = ( _FresLightEyeBall.x + _FresLightEyeBall.y * pow( max( 1.0 - fresnelNdotV727 , 0.0001 ), _FresLightEyeBall.z ) );
				float FresnelLight732 = ( ( 1.0 - fresnelNode727 ) * 0.01 );
				float dotResult859 = dot( SafeNormalize(_MainLightPosition.xyz) , normalizedWorldNormal );
				float temp_output_1162_0 = ( dotResult859 * 0.01 );
				float temp_output_861_0 = ( 1.0 - temp_output_1162_0 );
				float lerpResult913 = lerp( FresnelLight732 , temp_output_861_0 , _SSS_Adjuster);
				float clampResult893 = clamp( lerpResult913 , 0.0 , 1.0 );
				float4 SubSurfaceArea784 = lerpResult177;
				float4 clampResult794 = clamp( ( FresnelLight732 * SubSurfaceArea784 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float dotResult782 = dot( SafeNormalize(_MainLightPosition.xyz) , normalizedWorldNormal );
				float LightComponent779 = ( dotResult782 * 0.01 );
				float4 clampResult795 = clamp( ( LightComponent779 * SubSurfaceArea784 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float SS_FromDirLight1025 = _SSS_Light_Contact;
				float4 lerpResult987 = lerp( float4( 0,0,0,0 ) , ( clampResult794 + clampResult795 ) , SS_FromDirLight1025);
				float4 clampResult1001 = clamp( lerpResult987 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float temp_output_912_0 = ( lerpResult913 + lerpResult913 + lerpResult913 + lerpResult913 );
				float clampResult907 = clamp( SS_FromDirLight1025 , 0.01 , 1.0 );
				float temp_output_981_0 = ( temp_output_912_0 * clampResult907 );
				float4 lerpResult787 = lerp( temp_output_674_0 , ( clampResult893 * ( clampResult1001 + temp_output_674_0 ) ) , temp_output_981_0);
				float LightDotNorm998 = temp_output_1162_0;
				float saferPower993 = max( LightDotNorm998 , 0.0001 );
				float clampResult994 = clamp( ( LightDotNorm998 * pow( saferPower993 , ( _SSS_Adjuster + _SSS_Adjuster ) ) ) , 0.01 , 1.0 );
				float lerpResult1005 = lerp( temp_output_912_0 , clampResult994 , 0.5);
				float4 temp_cast_20 = (( lerpResult1005 * _MainLightColor.a )).xxxx;
				float3 desaturateInitialColor1044 = _MainLightColor.rgb;
				float desaturateDot1044 = dot( desaturateInitialColor1044, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar1044 = lerp( desaturateInitialColor1044, desaturateDot1044.xxx, ( ( _SSSColour_DesatA.a - 1.0 ) * 2.0 ) );
				float4 temp_output_1045_0 = ( _SSSColour_DesatA * float4( desaturateVar1044 , 0.0 ) );
				float SSS_Spread954 = _SSS_Spread;
				float4 lerpResult973 = lerp( temp_cast_20 , temp_output_1045_0 , SSS_Spread954);
				float4 SSS_forAlbedo1030 = ( lerpResult787 * lerpResult973 * ( lerpResult913 * temp_output_981_0 * 2.0 ) );
				float Final_illumination960 = _Final_illumination;
				
				
				float3 Albedo = ( SSS_forAlbedo1030 * Final_illumination960 ).rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				half4 color = half4( Albedo, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}
		
	}
	/*ase_lod*/
	
	Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=18909
876.6667;432.6667;1492;954;6980.977;1974.159;1.454747;True;False
Node;AmplifyShaderEditor.CommentaryNode;615;-3521.69,-824.9874;Inherit;False;2148.08;465.2037;Sizing;9;616;323;578;247;604;264;265;266;267;Sizing;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;267;-3461.919,-655.2391;Float;False;Property;_EyeSize;EyeSize;16;0;Create;True;0;0;0;False;2;Header(Sizing and Tweaks);Space(5);False;1;0.895;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;266;-3120.949,-498.1446;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;265;-2921.522,-489.6063;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;264;-2715.254,-530.2677;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;6,6;False;1;FLOAT2;-2.5,-2.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;635;-3474.641,-314.61;Inherit;False;1296.923;486.1872;Eye Local UV setup and RGB masking for Sclera, Limbal Ring and Iris Area;11;633;410;590;584;166;605;705;706;721;591;1018;RGB Mixer map;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;604;-2419.218,-497.7717;Float;False;eyeSizeUVs;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;605;-3441.859,-165.3517;Inherit;False;604;eyeSizeUVs;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;1176;-6726.47,-1665.441;Inherit;False;889.9717;218.2189;Comment;4;1182;1179;1178;1177;GetLightColorIntensity;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;166;-3081.737,-257.9168;Inherit;True;Property;_RGBMask;RGBMask;2;1;[NoScaleOffset];Create;True;0;0;0;False;2;Header(Main Textures);Space(10);False;-1;d0431c3a16ed8b54c8d648bb79ca09a5;ea1c686f188c8ef46b8c015f1c344441;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;1022;-3174.148,171.993;Inherit;False;968.3472;367.7106;EdgeAdjust;4;1019;1021;1020;707;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;707;-3124.148,221.993;Float;False;Property;_LimbalEdge_Adjustment;LimbalEdge_Adjustment;12;0;Create;True;0;0;0;False;0;False;0;0.764;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;705;-2754.987,-44.25138;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;1177;-6703.071,-1622.622;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.BreakToComponentsNode;1178;-6472.64,-1604.902;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.LerpOp;706;-2537.056,-16.02847;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;721;-2265.891,-14.82552;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1179;-6219.759,-1613.952;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;662;-2148.269,-314.4674;Inherit;False;1320.225;575.4196;Make Metalness;11;723;722;585;657;655;656;660;661;663;724;725;Metalness;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;585;-2113.652,59.17068;Float;False;IrisPupil_MASK;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1196;-5714.541,-1565.325;Inherit;False;PupilAffectedByLight_float;-1;;179;676c5e5a2752c454fab10b64fa534af1;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;1182;-6002.082,-1617.579;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;631;-5732.188,-1686.254;Inherit;False;1277.707;559.7808;PupilControl;9;587;543;555;91;542;537;535;536;686;Pupil Control;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;587;-5682.188,-1491.082;Inherit;False;585;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;686;-5367.417,-1635.279;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;555;-5227.093,-1567.955;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;543;-5604.761,-1418.477;Float;False;Property;_PupilAutoDilateFactor;PupilAutoDilateFactor;36;0;Create;True;0;0;0;False;0;False;44.97813;24.91765;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;91;-5598.821,-1329.853;Half;False;Property;_PupilSize;PupilSize;33;0;Create;True;0;0;0;False;0;False;70;71.91776;0.001;99;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;542;-4991.899,-1533.648;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;535;-5604.813,-1241.473;Float;False;Property;_PupilAffectedByLight_Amount;PupilAffectedByLight_Amount;37;0;Create;True;0;0;0;False;0;False;0.3434565;0.4848351;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;537;-4816.12,-1435.986;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;536;-4638.481,-1360.838;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;164;-4298.575,-1570.661;Inherit;False;3085.553;637.4598;Pupil;22;625;122;286;155;285;146;600;214;213;147;149;148;152;582;154;157;153;577;327;151;328;545;Pupil Control - UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;579;-5723.329,-855.0426;Inherit;False;2130.722;818.1102;Eye-Pupil/Iris Parallax;18;583;409;411;414;412;575;580;255;576;418;256;419;416;926;928;930;1006;1008;Parallax;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;545;-4217.713,-1472.758;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;99;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;632;-5718.911,-1080.675;Inherit;False;733.9878;169.0557;ParallaxHeight Variable;2;257;574;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;151;-4007.638,-1495.003;Inherit;False;2;0;FLOAT;100;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;416;-5794.375,-837.6871;Inherit;True;Property;_ParallaxMask;ParallaxMask;38;2;[NoScaleOffset];[SingleLineTexture];Create;True;0;0;0;False;2;Header(Parallax Control);Space(5);False;-1;None;451268057d3fa344e8695ec36ec39129;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;328;-4265.182,-1308.615;Float;False;Property;_IrisPupilBond;Iris-Pupil-Bond;18;0;Create;True;0;0;0;False;0;False;0.017;0.04156255;0;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1008;-5491.217,-510.6634;Float;False;Property;_ParallaxMaskInverter;ParallaxMaskInverter;39;0;Create;True;0;0;0;False;0;False;1;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;156;-4898.95,-1068.525;Float;False;Property;_PupilHeightWidthRatio;Pupil HeightWidthRatio;34;0;Create;True;0;0;0;False;0;False;1;1;0.01;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;929;-5433.676,-16.19928;Inherit;False;589.022;267.7902;AdjustForEyeSlit;3;924;925;927;;1,1,1,1;0;0
Node;AmplifyShaderEditor.OneMinusNode;1006;-5683.408,-656.1255;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;327;-3863.809,-1370.011;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;257;-5668.911,-1030.676;Float;False;Property;_PupilParallaxHeight;PupilParallaxHeight;41;0;Create;True;0;0;0;False;0;False;2.5;2.82;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;419;-5188.922,-654.3204;Float;False;Property;_PushParallaxMask;PushParallaxMask;40;0;Create;True;0;0;0;False;0;False;1;0.5;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;924;-5383.676,50.98862;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;577;-3717.449,-1269.604;Float;False;IrisPupilFactor;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1007;-5438.128,-664.6202;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;574;-5266.923,-1026.62;Float;False;PupilParallaxHeight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;925;-5235.518,49.59094;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;10;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;418;-4636.011,-805.0426;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;578;-2417.713,-588.0516;Inherit;False;577;IrisPupilFactor;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;247;-3471.69,-774.9874;Float;False;Property;_IrisSize;IrisSize;17;0;Create;True;0;0;0;False;0;False;1;1.49;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;256;-4611.694,-510.8292;Float;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;576;-4634.585,-613.153;Inherit;False;574;PupilParallaxHeight;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;323;-2141.998,-700.5798;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ParallaxOffsetHlpNode;255;-4263.169,-636.2007;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;927;-5005.988,33.80072;Inherit;False;FLOAT2;4;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;926;-3902.364,-317.7123;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;575;-5679.099,-342.3637;Inherit;False;574;PupilParallaxHeight;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;168;-3471.395,589.3245;Inherit;False;1464.509;1000.859;Inputs;26;595;594;261;182;593;133;589;284;581;612;249;617;250;283;190;618;619;622;764;765;767;910;931;937;936;938;Color Inputs;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;616;-1614.072,-706.6902;Float;False;eyeSizing;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;617;-3335.841,1347.869;Inherit;False;616;eyeSizing;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;414;-5364.253,-335.3633;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;580;-3855.419,-640.4783;Float;False;ParallaxPush_Vec2;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;412;-5699.265,-239.5132;Float;False;Tangent;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;930;-4400.883,-805.8527;Inherit;False;ParalaxMaskPower;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ParallaxOffsetHlpNode;411;-5142.959,-301.1927;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;931;-3146.992,1247.277;Inherit;False;930;ParalaxMaskPower;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;939;-2951.167,1639.931;Inherit;False;Property;_IrisParallaxPower;IrisParallaxPower;42;0;Create;True;0;0;0;False;0;False;0.4;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;249;-3059.993,1351.115;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;581;-3146.248,1161.892;Inherit;False;580;ParallaxPush_Vec2;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;284;-2787.769,1250.508;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WireNode;937;-2775.801,1498.466;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;940;-2652.413,1646.745;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;250;-2771.354,1343.424;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;283;-2529.156,1312.879;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;938;-2584.865,1441.696;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;618;-2607.011,1200.165;Inherit;False;616;eyeSizing;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1018;-2680.4,-284.6308;Inherit;True;ConstantBiasScale;-1;;168;63208df05c83e8e49a48ffbdce2e43a0;0;3;3;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;767;-2727.793,1104.862;Float;False;Property;_IrisRotationAnim;IrisRotationAnim;19;0;Create;True;0;0;0;False;0;False;0;0;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;936;-2400.286,1420.285;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;153;-3576.956,-1451.407;Inherit;False;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;157;-3787.29,-1140.465;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;169;-757.5884,665.5753;Inherit;False;2366.183;1252.259;Mixing;37;135;134;623;20;451;603;326;627;325;626;478;489;476;103;321;322;319;126;251;586;775;776;777;778;809;810;814;879;880;881;882;876;883;894;884;1160;1165;Extra Mixing;1,1,1,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;190;-2287.319,1246.859;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;6,6;False;1;FLOAT2;-2.5,-2.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1021;-3120.068,322.5037;Float;False;Property;_LimbalEdge_Finesse;LimbalEdge_Finesse;11;0;Create;True;0;0;0;False;0;False;0;0.42;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1019;-2703.47,280.3035;Inherit;True;6;6;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;765;-2410.755,1114.829;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;154;-3431.687,-1153.436;Inherit;False;2;0;FLOAT;2;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;881;-713.5128,1800.287;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;879;-746.6184,1662.03;Inherit;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DynamicAppendNode;152;-3391.445,-1510.719;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;1020;-2471.467,286.7036;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;218;-1952.744,598.4021;Inherit;False;1171.74;940.1422;IrisFunk;13;613;620;177;175;210;330;185;415;187;598;170;184;719;Iris mixing;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;148;-3471.602,-1299.328;Inherit;False;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;582;-3439.066,-1353.865;Inherit;False;580;ParallaxPush_Vec2;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;764;-2147.478,1072.746;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;149;-3195.629,-1254.792;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DotProductOpNode;880;-517.7653,1734.718;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;213;-3061.348,-1158.257;Float;False;Property;_PupilSharpness;PupilSharpness;35;0;Create;True;0;0;0;False;0;False;5;3.19;0.1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1051;-2251.32,293.5298;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;185;-1903.107,1108.585;Inherit;True;Property;_IrisExtraDetail;IrisExtraDetail;3;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;7b7c97e104d9817418725e17f5ca2659;9628d301394f9e54cb796290f2e35035;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;187;-1915.38,1314.087;Float;False;Property;_IrisExtraColorAmountA;IrisExtraColor-Amount(A);8;0;Create;True;0;0;0;False;0;False;0.08088237,0.07573904,0.04698314,0.591;0.4968553,0.571778,0.745283,0.9764706;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;147;-3142.418,-1484.83;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;591;-2519.393,-115.9007;Float;False;Sclera_MASK;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;210;-1477.025,1234.005;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DistanceOpNode;146;-2833.775,-1415.964;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;600;-2560.442,-1136.279;Inherit;False;585;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1160;-343.4943,1742.406;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;214;-2742.639,-1160.017;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;7;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;170;-1908.036,772.9764;Float;False;Property;_EyeVeinColorAmountA;EyeVeinColor-Amount(A);9;0;Create;True;0;0;0;False;0;False;0.375,0,0,0;0.8773585,0.4182624,0.3034884,0.9686275;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;590;-2380.798,-239.0225;Float;False;LimbalRing_MASK;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;155;-2514.058,-1422.359;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;12;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;894;-88.38852,1690.572;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;126;-724.2595,1519.134;Float;False;Property;_IrisBaseColor;IrisBaseColor;7;0;Create;True;0;0;0;False;0;False;0.4999702,0.5441177,0.4641004,1;0.1338554,0.1469745,0.226415,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;911;-3254.874,502.0454;Inherit;False;Constant;_Float1;Float 1;41;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;415;-1600.302,890.2409;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;251;-456.2553,1311.411;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;598;-1920.4,962.3043;Inherit;False;591;Sclera_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;589;-2864.632,698.4232;Inherit;False;585;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;182;-3417.43,830.8748;Float;False;Property;_RingColorAmount;RingColor-Amount;10;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;731;3123.164,2083.213;Inherit;False;875.4398;233.5352;Improved Light Falloff with inverse Fresnel and Light Dir;5;732;730;727;728;1166;Light falloff simple;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;586;-722.8341,1417.51;Inherit;False;585;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;593;-3406.51,1013.555;Inherit;False;590;LimbalRing_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;285;-2145.143,-1129.367;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;133;-3418.101,640.369;Float;False;Property;_EyeBallColorGlossA;EyeBallColor-Gloss(A);6;0;Create;True;0;0;0;False;2;Header(Color Customization);Space(6);False;1,1,1,0.853;0.8773585,0.8745995,0.8745995,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;330;-1427.309,932.8994;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;910;-3086.874,593.0454;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;883;-16.26392,1553.78;Inherit;False;2;2;0;FLOAT;4;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;489;-228.8091,1838.745;Float;False;InstancedProperty;_MinimumGlow;MinimumGlow;44;0;Create;True;0;0;0;False;0;False;0.2;0.005;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;261;-2990.515,972.8605;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;1158;3146.773,2326.768;Inherit;False;Property;_FresLightEyeBall;FresLightEyeBall;57;0;Create;True;0;0;0;False;0;False;0.7,-0.3,-0.15;0.7,-0.3,-0.15;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;286;-1928.995,-1223.143;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;475;-1700.735,2697.333;Inherit;False;1855.592;580.5686;Eye Shading - Created local shadows around the eye (fake AO);14;672;461;466;459;484;465;483;464;463;458;1102;1126;457;462;Eye Shading;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;322;-282.0901,1335.033;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;319;-268.5711,1451.92;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;595;-2446.204,702.4921;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;728;3143.164,2141.734;Inherit;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;612;-2795.021,969.504;Float;False;eyeLimbalRingPower;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;219;-1716.819,1929.655;Inherit;False;2546.831;732.6423;IrisConeCaustics;29;373;50;334;370;737;745;750;757;759;760;761;762;782;779;763;811;864;866;863;902;903;906;905;824;948;904;1136;1137;1159;Caustics;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;376;-1991.334,2207.088;Inherit;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;594;-2220.49,638.0837;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;719;-1268.518,930.5994;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;459;-1668.911,2751.333;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;619;-3107.881,829.1638;Float;False;LimbalRing_Color;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;175;-1506.27,780.9657;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;122;-1718.151,-1212.716;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;727;3395.807,2135.069;Inherit;False;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0.5;False;2;FLOAT;1;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;321;-98.59876,1373.383;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1122;-1422.01,3275.883;Float;False;Property;_EyeShadingPower;EyeShadingPower;43;0;Create;True;0;0;0;False;2;Header(Eye Shading);Space(5);False;1;0.31;0.01;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;884;126.6211,1616.461;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;457;-1635.375,2892.874;Inherit;False;1;0;FLOAT4;0,3,1,0.78;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;670;839.3718,2052.064;Inherit;False;2223.228;278.96;Final Mixing - Emissive;6;452;471;628;743;815;1175;Final Mixing for Emissive;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;625;-1467.025,-1211.886;Float;False;PupilMaskArea;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;620;-1341.799,648.7772;Inherit;False;619;LimbalRing_Color;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;876;325.8641,1565.784;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;782;-1361.697,2339.555;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;462;-1653.24,3088.004;Inherit;False;1;0;FLOAT4;0,1.21,1,0.78;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;1023;3223.931,-663.2455;Inherit;False;3022.493;1815.53;SSS Cluster;63;1037;912;1036;998;913;993;1000;995;914;861;859;858;1028;973;955;1005;994;1004;790;783;780;990;802;1033;1032;1030;960;803;959;908;787;981;797;909;788;907;893;954;953;1026;1001;987;986;1027;794;795;1025;789;785;793;1039;1040;1041;1043;1044;1045;1046;1047;1048;1090;1089;1091;1162;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;613;-1353.617,716.5839;Inherit;False;612;eyeLimbalRingPower;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;177;-1135.945,790.793;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1124;-1137.689,3274.43;Inherit;False;EyeShadePower;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;730;3631.036,2139.895;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;858;3223.144,-98.10052;Inherit;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;1125;1586.039,1806.439;Inherit;False;1124;EyeShadePower;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;809;543.1108,1567.523;Float;False;BaseIrisColors;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;184;-940.8968,678.6216;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldNormalVector;1091;3244.264,108.5203;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode;1165;632.1534,1671.536;Inherit;False;LightDirectionZone_float;0;;169;ce816473eb2cf6d4e96d84f2ab098aa5;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;458;-1338.131,2816.313;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1159;-1240.09,2391.349;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1166;3786.926,2233.253;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;461;-1343.11,2985.45;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;628;882.7011,2263.544;Inherit;False;625;PupilMaskArea;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;638;1637.879,1474.012;Inherit;False;1022.617;442.3356;LocalShadowPass Extra limbal Ring effect;5;481;470;614;568;1107;Shadow FX;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;103;-711.0731,707.4684;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1127;1588.02,1678.303;Inherit;False;LocalShadowing;-1;;170;cbbcb7bdaf1755b499ae374337e1f753;0;1;17;FLOAT;0;False;2;FLOAT;16;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;859;3458.819,9.160357;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;779;-1102.015,2349.379;Float;False;LightComponent;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;476;1029.504,1645.141;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;810;-113.5322,1155.883;Inherit;False;809;BaseIrisColors;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;465;-1102.694,2956.886;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;732;3790.363,2131.513;Float;False;FresnelLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;784;-955.7665,827.1627;Float;False;SubSurfaceArea;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;464;-1110.505,2800.719;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1162;3613.188,91.2597;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;783;3318.089,-385.1719;Inherit;False;784;SubSurfaceArea;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;626;347.6477,1229.792;Inherit;False;625;PupilMaskArea;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1107;1841.198,1676.827;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;790;3320.541,-467.0427;Inherit;False;732;FresnelLight;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;478;1308.011,1654.071;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;780;3328.048,-297.3975;Inherit;False;779;LightComponent;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;325;192.3898,1121.124;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;463;-878.1376,2862.101;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1126;-1423.985,3172.485;Inherit;False;LocalShadowing;-1;;172;cbbcb7bdaf1755b499ae374337e1f753;0;1;17;FLOAT;0;False;2;FLOAT;16;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;785;3716.036,-215.5768;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;998;3828.911,213.3004;Inherit;False;LightDotNorm;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;484;-726.0908,3109.957;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.5,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;481;2020.024,1691.858;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;466;-721.2878,2889.497;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT3;1,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;914;3264.751,488.7921;Inherit;False;Property;_SSS_Adjuster;SSS_Adjuster;48;0;Create;True;0;0;0;False;0;False;0.5;0.958;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;793;3745.409,-430.4159;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;789;5263.152,-405.3394;Float;False;Property;_SSS_Light_Contact;SSS_Light_Contact;47;0;Create;True;0;0;0;False;0;False;1;0.9;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;326;809.9284,1364.676;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;470;2139.102,1524.012;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;614;1811.435,1810.744;Inherit;False;612;eyeLimbalRingPower;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1000;3770.056,355.2048;Inherit;False;998;LightDotNorm;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;795;3934.85,-235.4455;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;995;3809.003,484.5928;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;794;3941.571,-371.2309;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1025;5765.493,-401.6704;Inherit;False;SS_FromDirLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;483;-439.5578,2937.341;Inherit;False;Lerp White To;-1;;174;047d7c189c36a62438973bad9d37b1c2;0;2;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;652;2711.947,1375.873;Inherit;False;950.9968;628.9937;Final Outputs and Pupil Color control;12;648;646;665;647;666;668;667;650;673;674;832;833;Final Gather;1,1,1,1;0;0
Node;AmplifyShaderEditor.ColorNode;647;2736.821,1422.523;Float;False;Property;_PupilColorEmissivenessA;PupilColor-Emissiveness(A);32;0;Create;True;0;0;0;False;2;Header(Pupil Control);Space(6);False;0,0,0,0;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;568;2399.684,1767.644;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;861;3637.087,-92.44613;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1043;3974.764,899.3177;Inherit;False;Property;_SSSColour_DesatA;SSSColour_Desat(A);45;0;Create;True;0;0;0;False;2;Header(Sub Surface control);Space (6);False;1,1,1,0;0.9528301,0.8959001,0.8959001,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1027;4033.184,-124.0645;Inherit;False;1025;SS_FromDirLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;672;-105.6883,2930.192;Float;False;eyeShading;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;986;4107.994,-328.2539;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;650;2730.831,1894.836;Inherit;False;625;PupilMaskArea;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;993;3993.007,475.5406;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;673;3142.117,1416.808;Inherit;False;672;eyeShading;1;0;OBJECT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;646;3197.863,1496.738;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;913;3879.06,-58.23287;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1046;4275.293,1061.418;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;987;4260.213,-353.9984;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1004;4187.276,359.2798;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;912;4150.986,2.768908;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;674;3410.292,1465.181;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;994;4397.961,363.6856;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.01;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1026;4300.829,86.79585;Inherit;False;1025;SS_FromDirLight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;1001;4435.217,-358.8885;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LightColorNode;802;4126.752,732.3032;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1047;4406.293,1060.418;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;953;5391.315,-584.2901;Inherit;False;Property;_SSS_Spread;SSS_Spread;46;0;Create;True;0;0;0;False;0;False;0;0.666;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;907;4659.285,14.99166;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.01;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;788;4647.319,-342.116;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;893;4442.64,-85.8555;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1005;4619.575,251.6316;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1044;4315.583,970.947;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;954;5711.313,-585.2267;Inherit;False;SSS_Spread;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;990;4959.696,496.3732;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;955;4808.864,196.1319;Inherit;False;954;SSS_Spread;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;909;5067.489,132.0176;Inherit;False;Constant;_Float0;Float 0;41;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;797;5003.541,-332.4267;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1045;4521.74,901.8292;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;981;4905.728,61.30915;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;908;5266.873,-27.7348;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;787;4912.532,-195.4725;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;973;5207.65,289.7704;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;803;5466.145,-154.3694;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;959;5107.981,-490.5918;Inherit;False;Property;_Final_illumination;Final_illumination;51;0;Create;True;0;0;0;False;0;False;0.25;0.707;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1030;5609.955,-169.4834;Inherit;True;SSS_forAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;960;5747.514,-485.7276;Inherit;False;Final_illumination;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;671;2253.061,110.756;Inherit;False;809.7659;371.8926;Blend normals;2;640;569;Blends Normal maps;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1031;5320.215,1339.092;Inherit;False;1030;SSS_forAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;945;-1874.614,1525.003;Inherit;False;1041.998;348.6327;Caustic Size;4;942;943;944;941;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;961;5297.346,1431.277;Inherit;False;960;Final_illumination;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1145;1656.606,-716.4761;Inherit;False;636.8799;413.0728;GUMMY;3;1143;1139;1138;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;848;3741.666,1440.449;Inherit;False;1443.159;515.8131;FinalEmissive;14;804;818;829;826;844;845;847;1029;846;1092;1093;1095;1096;1097;Final Emissive;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;639;1635.956,1088.942;Inherit;False;1461.426;267.9109;Protect Iris area from eyewhite micro scatter;5;642;527;611;609;610;Mask out Microscatter;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;167;-560.9434,47.91427;Inherit;False;2142.244;468.7774;Normal Maps;9;331;602;139;333;607;141;138;140;606;Normal Maps;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1015;4016.654,2037.013;Inherit;False;798.4263;284.6848;LimbalRingEmissive;6;1010;1012;1013;1011;1014;1050;LimbalRingEmiss;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;505;-511.9602,-644.9;Inherit;False;1832.025;501.339;Fake Microscatter effect - May be replaced with a simple noise-normalmap in a newer version;11;502;572;504;503;608;669;499;588;713;715;717;Microscatter;1,1,1,1;0;0
Node;AmplifyShaderEditor.ObjSpaceLightDirHlpNode;1139;1673.683,-541.9219;Inherit;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;471;2670.734,2118.573;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;725;-1887.699,4.125536;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;737;-855.378,2358.672;Inherit;False;732;FresnelLight;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;627;773.5042,1226.395;Inherit;False;625;PupilMaskArea;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;723;-2128.732,-215.2754;Float;False;Property;_LimbalRingMetalness;LimbalRingMetalness;22;0;Create;True;0;0;0;False;2;Header(Metalness);Space(5);False;0;0.436;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;1095;4238.044,1527.641;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;373;-1106.271,2069.087;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;1137;-1544.983,2359.83;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;643;5326.115,1682.462;Inherit;False;642;SMOOTHNESS_OUTPUT;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;655;-1801.268,-260.4674;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1010;4030.917,2193.27;Inherit;False;619;LimbalRing_Color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1039;5231.839,554.2155;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;664;5348.677,1603.685;Inherit;False;663;METALNESS_OUTPUT;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;844;4565.18,1753.755;Inherit;False;625;PupilMaskArea;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendNormalsNode;332;1668.206,90.51281;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;642;2793.351,1160.468;Float;False;SMOOTHNESS_OUTPUT;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;669;66.0421,-499.0768;Inherit;False;MicroScatterScale_vec2;53;;176;27afac86e902b3f4680f2698fbeab237;0;0;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;760;-69.47156,2289.621;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;656;-1683.046,-62.42888;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1142;1616.885,-400.5609;Inherit;False;Property;_Float2;Float 2;55;0;Create;True;0;0;0;False;0;False;0;6.163949;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;138;-276.5837,165.2453;Inherit;True;Property;_Lens_Base_Normal;Lens_Base_Normal;5;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;8ee6d0418eaa08e40ad667b400177c1c;e575b95fc35e1be4c93f2b963878ec25;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;829;4191.205,1635.454;Inherit;False;827;caustEmissission;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;499;335.7147,-226.6894;Float;False;Property;_Eyeball_microScatter;Eyeball_microScatter;52;0;Create;True;0;0;0;False;2;Header(Micro Scatter);Space(5);False;0;1.27;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;759;-647.4992,2387.532;Inherit;False;ConstantBiasScale;-1;;175;63208df05c83e8e49a48ffbdce2e43a0;0;3;3;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;1.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1014;4651.75,2148.015;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;569;2476.724,223.1104;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1050;4475.712,2244.388;Inherit;False;Property;_LimbalRingEmissivePower;LimbalRingEmissivePower;14;0;Create;True;0;0;0;False;0;False;0;0.42;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;717;97.39243,-306.1013;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;660;-1491.204,-109.2472;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1153;250.0187,2894.275;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;864;-1116.083,2498.207;Inherit;False;Property;_CausticTweak;CausticTweak;26;0;Create;True;0;0;0;False;0;False;2.2;0.84;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1150;239.1441,2755.409;Inherit;False;2;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;724;-2111.768,155.1683;Float;False;Property;_IrisPupilMetalness;IrisPupilMetalness;23;0;Create;True;0;0;0;False;0;False;0;0.103;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;525;2474.173,966.8337;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;452;2057.326,2164.549;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;777;240.8759,934.0576;Inherit;False;590;LimbalRing_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;815;1458.395,2093.988;Inherit;False;814;BaseColoring;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1152;219.4188,3180.173;Inherit;False;Property;_IrisDirectHitPower;IrisDirectHitPower;31;0;Create;True;0;0;0;False;0;False;0;41.9;0;200;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;611;1938.345,1179.715;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;1143;2002.66,-582.5787;Inherit;True;Standard;WorldNormal;ViewDir;False;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0.5;False;3;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;1012;4269.75,2090.014;Inherit;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;588;-506.7211,-583.7661;Inherit;False;585;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;608;1064.798,-255.6428;Float;False;microScatter;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;905;231.0224,2475.865;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;743;1523.932,2170.736;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;833;3434.439,1618.501;Float;False;PupilGlow;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1040;4683.267,761.8617;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;657;-1763.756,67.64504;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;757;-341.1172,2330.761;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;745;657.967,2126.984;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1049;4816.374,2193.526;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-753.7518,947.6635;Float;False;Property;_LensGloss;LensGloss;20;0;Create;True;0;0;0;False;0;False;0.98;0.875;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;1096;3974.145,1614.74;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;943;-1377.508,1721.564;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;750;-490.9594,2525.562;Float;False;Property;_CausticFX_inDarkness;CausticFX_inDarkness;29;0;Create;True;0;0;0;False;0;False;17;0.402;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;1089;5848.772,569.6764;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;610;1663.956,1168.022;Inherit;False;585;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;950;-108.9442,2651.542;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;503;373.7202,-606.47;Float;False;Constant;_FlatNormal;FlatNormal;31;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ClampOpNode;661;-1253.727,-29.00266;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;903;-1914.422,2095.335;Inherit;False;Property;_CausticRotationAdjust;CausticRotationAdjust;30;0;Create;True;0;0;0;False;0;False;0;0.035;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;818;4421.997,1740.288;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;944;-1121.321,1640.564;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;6,6;False;1;FLOAT2;-2.5,-2.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;1097;4422.646,1547.141;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;50;-973.7299,2246.284;Float;False;Property;_CausticPower;CausticPower;27;0;Create;True;0;0;0;False;0;False;17;4.31;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;333;586.7011,158.6582;Float;False;Property;_ScleraBumpScale;ScleraBumpScale;15;0;Create;True;0;0;0;False;0;False;0;2.45;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;140;198.0932,97.91426;Float;False;Constant;_Blue;Blue;10;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;1146;2713.085,-609.9188;Inherit;False;Gummyness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1041;4963.229,775.2963;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;942;-1552.019,1727.066;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;866;-817.5714,2457.459;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;949;-599.2236,2622.775;Inherit;False;779;LightComponent;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1003;-247.8,2643.871;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;409;-4628.915,-351.2112;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;863;403.6831,1956.228;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ObjectScaleNode;1173;1775.796,-926.874;Inherit;False;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;633;-3009.703,-4.51019;Float;False;eyeLocalUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WireNode;667;2888.624,1841.558;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;451;1172.024,1472.768;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;641;5295.641,1523.715;Inherit;False;640;NORMAL_OUTPUT;1;0;OBJECT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1032;5549.404,544.5577;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1188;-5871.675,-1810.684;Inherit;False;LightInt;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;1092;3802.542,1518.541;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RegisterLocalVarNode;583;-4380.726,-352.2721;Float;False;ParallaxOffset_Vec2;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;603;-734.5588,1055.458;Inherit;False;585;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;139;755.3265,321.9293;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1131;-1346.081,2198.63;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;331;956.9222,93.24535;Inherit;True;Property;_Sclera_Normal;Sclera_Normal;4;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;97ac39d433ae05047abf79173f71d460;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;826;4596.418,1602.213;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;527;2256.172,1242.286;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;1048;3326.056,753.7745;Inherit;False;954;SSS_Spread;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;962;5571.976,1473.735;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;846;5048.847,1608.446;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1011;4260.836,2169.699;Inherit;False;590;LimbalRing_MASK;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;831;887.0182,1940.308;Inherit;False;824;causticInDark;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;761;481.1953,2114.292;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;882;-192.2639,1588.78;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;997;5576.57,1368.388;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;902;-1549.344,2138.435;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;668;2762.182,1826.344;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;502;1123.114,-510.9321;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;1029;4193.942,1717.261;Inherit;False;1028;SSS_Result;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;606;-538.2026,188.7793;Inherit;False;604;eyeSizeUVs;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;607;660.5301,82.57835;Inherit;False;604;eyeSizeUVs;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1147;52.32198,3041.129;Inherit;False;1146;Gummyness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1036;3880.23,91.82663;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TanOpNode;1136;-1702.522,2342.689;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1037;4147.437,136.879;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;814;1390.149,1505.289;Float;False;BaseColoring;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1090;5386.262,960.1217;Inherit;False;Property;_FinalSSS_Desaturate;FinalSSS_Desaturate;50;0;Create;True;0;0;0;False;0;False;0;0.255;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;623;-351.8134,813.577;Inherit;False;622;EyeBallGloss;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;666;2835.171,1742.478;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;370;-674.2144,2060.136;Inherit;True;Property;_CausticMask;CausticMask;25;2;[NoScaleOffset];[SingleLineTexture];Create;True;0;0;0;False;2;Header(Caustic FX);Space(5);False;-1;None;d9e87f40b033e4245bb68d58ff0930bc;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;1028;6040.243,533.7385;Inherit;True;SSS_Result;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;778;519.8759,895.0576;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;602;1156.075,388.4355;Inherit;False;585;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1175;2877.447,2125.694;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;824;683.6443,2476.1;Float;False;causticInDark;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector3Node;1148;1713.53,-307.0299;Inherit;False;Property;_BSP_IrisDirectLit;BSP_IrisDirectLit;56;0;Create;True;0;0;0;False;2;Header(Finetuners);Space(5);False;0.23,-2.9,4;0.13,-3.04,4.37;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;928;-4780.958,-214.4827;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;584;-3447.641,13.08065;Inherit;False;583;ParallaxOffset_Vec2;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;334;135.6268,2113.036;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;941;-1789.513,1613.438;Float;False;Property;_CausticSize;CausticSize;28;0;Create;True;0;0;0;False;0;False;1;0.708;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;811;-399.9844,1969.467;Inherit;False;809;BaseIrisColors;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;906;37.27649,2494.543;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;410;-3161.836,-9.2141;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;832;3216.106,1633.328;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;775;698.8759,941.0576;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1033;5077.377,955.4669;Inherit;False;Property;_FinalSSS_Mixer;FinalSSS_Mixer;49;0;Create;True;0;0;0;False;0;False;0;0.836;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;141;-276.5095,369.9954;Float;False;Property;_LensPush;LensPush;21;0;Create;True;0;0;0;False;0;False;1;0.678;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;904;-164.9471,2527.869;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1111;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;827;1220.899,1919.772;Float;False;caustEmissission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;804;3756.666,1825.72;Float;False;PreEmissive;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldNormalVector;1138;1679.245,-687.4761;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DynamicAppendNode;572;404.3301,-453.4742;Inherit;False;FLOAT4;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;504;816.5957,-357.6282;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;713;-250.4354,-532.1979;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;948;661.6238,2301.186;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;776;217.8759,859.0576;Float;False;Property;_LimbalRingGloss;LimbalRingGloss;13;0;Create;True;0;0;0;False;0;False;0;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1013;4487.75,2087.014;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;135;80.12472,988.3787;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1093;4020.943,1519.84;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;722;-2105.917,-106.2091;Float;False;Property;_EyeBallMetalness;EyeBallMetalness;24;0;Create;True;0;0;0;False;0;False;0;0.102;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;663;-1083.006,-143.5471;Float;False;METALNESS_OUTPUT;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1102;-1088.387,3161.439;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;648;3471.221,1690.54;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;847;4793.929,1755.652;Inherit;False;833;PupilGlow;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1174;1987.796,-872.874;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;640;2799.827,160.756;Float;False;NORMAL_OUTPUT;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;762;142.264,2271.245;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;622;-3092.575,734.6815;Float;False;EyeBallGloss;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;763;250.5441,2005.702;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1149;2425.375,-594.6857;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;134;-150.6111,980.5873;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;609;1657.123,1258.416;Inherit;False;608;microScatter;1;0;OBJECT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;665;3039.796,1695.36;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;715;-87.53503,-401.5688;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;845;4794.868,1577.584;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;853;5977.844,1606.051;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;854;5977.844,1532.757;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;849;6100.47,1532.757;Float;False;True;-1;2;;0;2;RRF_HumanShaders/EyeShaders/EyeShader_Model4URP;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;18;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;0;Hidden/InternalErrorShader;0;0;Standard;38;Workflow;1;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;1;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;0;  Transmission Shadow;0.5,False,-1;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;1;  Use Shadow Threshold;0;Receive Shadows;1;GPU Instancing;0;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;0;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;0;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Write Depth;0;  Early Z;0;Vertex Position,InvertActionOnDeselection;1;0;6;False;True;True;True;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;852;5977.844,1606.051;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;851;5977.844,1606.051;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;850;5977.844,1606.051;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;266;0;267;0
WireConnection;265;0;266;0
WireConnection;264;0;267;0
WireConnection;264;1;265;0
WireConnection;604;0;264;0
WireConnection;166;1;605;0
WireConnection;705;0;166;3
WireConnection;705;1;166;1
WireConnection;1178;0;1177;1
WireConnection;706;0;166;3
WireConnection;706;1;705;0
WireConnection;706;2;707;0
WireConnection;721;0;706;0
WireConnection;1179;0;1178;0
WireConnection;1179;1;1178;1
WireConnection;1179;2;1178;2
WireConnection;585;0;721;0
WireConnection;1182;0;1179;0
WireConnection;686;0;1182;0
WireConnection;686;1;1196;0
WireConnection;555;0;686;0
WireConnection;555;1;587;0
WireConnection;542;0;555;0
WireConnection;542;1;543;0
WireConnection;537;0;91;0
WireConnection;537;1;542;0
WireConnection;536;0;91;0
WireConnection;536;1;537;0
WireConnection;536;2;535;0
WireConnection;545;0;536;0
WireConnection;151;1;545;0
WireConnection;1006;0;416;1
WireConnection;327;0;151;0
WireConnection;327;1;328;0
WireConnection;924;0;156;0
WireConnection;577;0;327;0
WireConnection;1007;0;416;1
WireConnection;1007;1;1006;0
WireConnection;1007;2;1008;0
WireConnection;574;0;257;0
WireConnection;925;0;924;0
WireConnection;418;1;1007;0
WireConnection;418;2;419;0
WireConnection;323;0;247;0
WireConnection;323;1;267;0
WireConnection;323;2;578;0
WireConnection;255;0;418;0
WireConnection;255;1;576;0
WireConnection;255;2;256;0
WireConnection;927;1;925;0
WireConnection;926;0;255;0
WireConnection;926;1;927;0
WireConnection;616;0;323;0
WireConnection;414;0;575;0
WireConnection;580;0;926;0
WireConnection;930;0;418;0
WireConnection;411;0;416;0
WireConnection;411;1;414;0
WireConnection;411;2;412;0
WireConnection;249;0;617;0
WireConnection;284;0;581;0
WireConnection;284;1;931;0
WireConnection;937;0;411;0
WireConnection;940;0;939;0
WireConnection;250;0;249;0
WireConnection;283;0;284;0
WireConnection;283;1;250;0
WireConnection;938;0;937;0
WireConnection;938;1;940;0
WireConnection;1018;3;166;1
WireConnection;1018;2;707;0
WireConnection;936;0;283;0
WireConnection;936;1;938;0
WireConnection;153;0;151;0
WireConnection;153;1;156;0
WireConnection;157;0;156;0
WireConnection;190;0;618;0
WireConnection;190;1;936;0
WireConnection;1019;0;1018;0
WireConnection;1019;1;1018;0
WireConnection;1019;2;1018;0
WireConnection;1019;3;1018;0
WireConnection;1019;4;1018;0
WireConnection;1019;5;1018;0
WireConnection;765;0;767;0
WireConnection;154;0;151;0
WireConnection;154;1;157;0
WireConnection;152;0;151;0
WireConnection;152;1;153;0
WireConnection;1020;0;1018;0
WireConnection;1020;1;1019;0
WireConnection;1020;2;1021;0
WireConnection;148;0;151;0
WireConnection;764;0;190;0
WireConnection;764;2;765;0
WireConnection;149;0;148;0
WireConnection;149;1;154;0
WireConnection;880;0;879;0
WireConnection;880;1;881;0
WireConnection;1051;0;1020;0
WireConnection;185;1;764;0
WireConnection;147;0;152;0
WireConnection;147;1;582;0
WireConnection;591;0;166;2
WireConnection;210;0;185;0
WireConnection;210;1;187;0
WireConnection;146;0;149;0
WireConnection;146;1;147;0
WireConnection;1160;0;880;0
WireConnection;214;0;213;0
WireConnection;590;0;1051;0
WireConnection;155;0;146;0
WireConnection;155;1;214;0
WireConnection;894;0;1160;0
WireConnection;415;0;170;4
WireConnection;251;0;210;0
WireConnection;251;1;187;4
WireConnection;285;0;600;0
WireConnection;330;0;415;0
WireConnection;330;1;598;0
WireConnection;910;0;911;0
WireConnection;910;1;133;0
WireConnection;883;1;894;0
WireConnection;261;0;182;4
WireConnection;261;1;593;0
WireConnection;286;0;155;0
WireConnection;286;1;285;0
WireConnection;322;0;251;0
WireConnection;322;1;586;0
WireConnection;319;0;586;0
WireConnection;319;1;126;0
WireConnection;595;0;589;0
WireConnection;612;0;261;0
WireConnection;594;0;910;0
WireConnection;594;1;595;0
WireConnection;719;0;330;0
WireConnection;619;0;182;0
WireConnection;175;0;170;0
WireConnection;175;1;598;0
WireConnection;122;0;286;0
WireConnection;727;4;728;0
WireConnection;727;1;1158;1
WireConnection;727;2;1158;2
WireConnection;727;3;1158;3
WireConnection;321;0;322;0
WireConnection;321;1;319;0
WireConnection;884;0;883;0
WireConnection;884;1;489;0
WireConnection;625;0;122;0
WireConnection;876;0;321;0
WireConnection;876;1;489;0
WireConnection;876;2;884;0
WireConnection;782;0;376;0
WireConnection;782;1;459;0
WireConnection;177;0;594;0
WireConnection;177;1;175;0
WireConnection;177;2;719;0
WireConnection;1124;0;1122;0
WireConnection;730;0;727;0
WireConnection;809;0;876;0
WireConnection;184;0;177;0
WireConnection;184;1;620;0
WireConnection;184;2;613;0
WireConnection;458;0;459;0
WireConnection;458;1;457;0
WireConnection;1159;0;782;0
WireConnection;1166;0;730;0
WireConnection;461;0;459;0
WireConnection;461;1;462;0
WireConnection;103;0;184;0
WireConnection;103;1;184;0
WireConnection;1127;17;1125;0
WireConnection;859;0;858;0
WireConnection;859;1;1091;0
WireConnection;779;0;1159;0
WireConnection;476;0;1165;0
WireConnection;476;1;628;0
WireConnection;476;2;489;0
WireConnection;465;0;461;0
WireConnection;732;0;1166;0
WireConnection;784;0;177;0
WireConnection;464;0;458;0
WireConnection;1162;0;859;0
WireConnection;1107;0;1127;16
WireConnection;1107;1;1127;0
WireConnection;478;0;476;0
WireConnection;478;1;489;0
WireConnection;325;0;103;0
WireConnection;325;1;810;0
WireConnection;463;0;464;0
WireConnection;463;1;465;0
WireConnection;1126;17;1122;0
WireConnection;785;0;780;0
WireConnection;785;1;783;0
WireConnection;998;0;1162;0
WireConnection;484;0;1126;0
WireConnection;481;0;478;0
WireConnection;481;1;1107;0
WireConnection;466;0;463;0
WireConnection;466;1;1126;0
WireConnection;793;0;790;0
WireConnection;793;1;783;0
WireConnection;326;0;626;0
WireConnection;326;1;325;0
WireConnection;470;0;326;0
WireConnection;470;1;481;0
WireConnection;795;0;785;0
WireConnection;995;0;914;0
WireConnection;995;1;914;0
WireConnection;794;0;793;0
WireConnection;1025;0;789;0
WireConnection;483;1;466;0
WireConnection;483;2;484;0
WireConnection;568;0;470;0
WireConnection;568;2;614;0
WireConnection;861;0;1162;0
WireConnection;672;0;483;0
WireConnection;986;0;794;0
WireConnection;986;1;795;0
WireConnection;993;0;1000;0
WireConnection;993;1;995;0
WireConnection;646;0;647;0
WireConnection;646;1;568;0
WireConnection;646;2;650;0
WireConnection;913;0;790;0
WireConnection;913;1;861;0
WireConnection;913;2;914;0
WireConnection;1046;0;1043;4
WireConnection;987;1;986;0
WireConnection;987;2;1027;0
WireConnection;1004;0;1000;0
WireConnection;1004;1;993;0
WireConnection;912;0;913;0
WireConnection;912;1;913;0
WireConnection;912;2;913;0
WireConnection;912;3;913;0
WireConnection;674;0;673;0
WireConnection;674;1;646;0
WireConnection;994;0;1004;0
WireConnection;1001;0;987;0
WireConnection;1047;0;1046;0
WireConnection;907;0;1026;0
WireConnection;788;0;1001;0
WireConnection;788;1;674;0
WireConnection;893;0;913;0
WireConnection;1005;0;912;0
WireConnection;1005;1;994;0
WireConnection;1044;0;802;1
WireConnection;1044;1;1047;0
WireConnection;954;0;953;0
WireConnection;990;0;1005;0
WireConnection;990;1;802;2
WireConnection;797;0;893;0
WireConnection;797;1;788;0
WireConnection;1045;0;1043;0
WireConnection;1045;1;1044;0
WireConnection;981;0;912;0
WireConnection;981;1;907;0
WireConnection;908;0;913;0
WireConnection;908;1;981;0
WireConnection;908;2;909;0
WireConnection;787;0;674;0
WireConnection;787;1;797;0
WireConnection;787;2;981;0
WireConnection;973;0;990;0
WireConnection;973;1;1045;0
WireConnection;973;2;955;0
WireConnection;803;0;787;0
WireConnection;803;1;973;0
WireConnection;803;2;908;0
WireConnection;1030;0;803;0
WireConnection;960;0;959;0
WireConnection;471;0;568;0
WireConnection;471;1;568;0
WireConnection;471;2;452;0
WireConnection;725;0;585;0
WireConnection;1095;0;1093;0
WireConnection;1095;1;1096;0
WireConnection;373;0;944;0
WireConnection;373;2;1131;0
WireConnection;1137;0;1136;0
WireConnection;655;0;590;0
WireConnection;655;1;723;0
WireConnection;1039;0;1041;0
WireConnection;1039;1;1045;0
WireConnection;1039;2;955;0
WireConnection;332;0;502;0
WireConnection;332;1;331;0
WireConnection;642;0;525;0
WireConnection;760;0;811;0
WireConnection;760;1;370;0
WireConnection;760;2;50;0
WireConnection;656;0;722;0
WireConnection;656;1;725;0
WireConnection;138;1;606;0
WireConnection;759;3;737;0
WireConnection;759;1;866;0
WireConnection;759;2;866;0
WireConnection;1014;0;1013;0
WireConnection;1014;1;1011;0
WireConnection;1014;2;1010;0
WireConnection;569;0;332;0
WireConnection;569;1;139;0
WireConnection;569;2;602;0
WireConnection;717;0;715;0
WireConnection;660;0;655;0
WireConnection;660;1;656;0
WireConnection;660;2;657;0
WireConnection;1153;0;1147;0
WireConnection;1153;1;1152;0
WireConnection;1150;1;1153;0
WireConnection;525;0;775;0
WireConnection;525;2;527;0
WireConnection;452;0;815;0
WireConnection;452;1;743;0
WireConnection;611;0;610;0
WireConnection;1143;0;1174;0
WireConnection;1143;4;1139;0
WireConnection;1143;1;1148;1
WireConnection;1143;2;1148;2
WireConnection;1143;3;1148;3
WireConnection;1012;0;1010;0
WireConnection;608;0;504;0
WireConnection;905;0;906;0
WireConnection;905;1;904;0
WireConnection;905;2;950;0
WireConnection;905;3;1150;0
WireConnection;743;0;745;0
WireConnection;743;1;628;0
WireConnection;833;0;832;0
WireConnection;1040;0;1037;0
WireConnection;1040;1;994;0
WireConnection;657;0;585;0
WireConnection;657;1;724;0
WireConnection;757;0;50;0
WireConnection;757;1;759;0
WireConnection;745;0;761;0
WireConnection;1049;0;1014;0
WireConnection;1049;1;1050;0
WireConnection;943;0;942;0
WireConnection;1089;0;1032;0
WireConnection;1089;1;1090;0
WireConnection;950;0;1003;0
WireConnection;661;0;660;0
WireConnection;818;0;1029;0
WireConnection;818;1;804;0
WireConnection;944;0;941;0
WireConnection;944;1;943;0
WireConnection;1097;0;1095;0
WireConnection;1097;1;829;0
WireConnection;1146;0;1149;0
WireConnection;1041;0;1040;0
WireConnection;1041;1;802;2
WireConnection;942;0;941;0
WireConnection;866;0;864;0
WireConnection;1003;0;949;0
WireConnection;409;1;928;0
WireConnection;863;0;489;0
WireConnection;863;1;763;0
WireConnection;633;0;410;0
WireConnection;667;0;650;0
WireConnection;451;0;627;0
WireConnection;451;1;489;0
WireConnection;451;2;326;0
WireConnection;1032;0;1030;0
WireConnection;1032;1;1039;0
WireConnection;1032;2;1033;0
WireConnection;1188;0;1182;0
WireConnection;583;0;409;0
WireConnection;139;0;140;0
WireConnection;139;1;138;0
WireConnection;139;2;141;0
WireConnection;1131;0;902;0
WireConnection;1131;1;1137;0
WireConnection;331;1;607;0
WireConnection;331;5;333;0
WireConnection;826;0;1097;0
WireConnection;826;1;818;0
WireConnection;527;0;611;0
WireConnection;527;1;609;0
WireConnection;962;0;846;0
WireConnection;962;1;961;0
WireConnection;846;0;845;0
WireConnection;846;1;847;0
WireConnection;846;2;1049;0
WireConnection;761;0;863;0
WireConnection;761;1;762;0
WireConnection;761;2;905;0
WireConnection;882;0;879;0
WireConnection;997;0;1031;0
WireConnection;997;1;961;0
WireConnection;902;0;376;1
WireConnection;902;1;903;0
WireConnection;668;0;667;0
WireConnection;502;0;503;0
WireConnection;502;1;572;0
WireConnection;502;2;504;0
WireConnection;1036;0;790;0
WireConnection;1036;1;861;0
WireConnection;1036;2;1048;0
WireConnection;1136;0;376;2
WireConnection;1037;0;1036;0
WireConnection;1037;1;1036;0
WireConnection;1037;2;1036;0
WireConnection;1037;3;1036;0
WireConnection;814;0;451;0
WireConnection;666;0;668;0
WireConnection;370;1;373;0
WireConnection;1028;0;1089;0
WireConnection;778;0;776;0
WireConnection;778;1;777;0
WireConnection;1175;0;471;0
WireConnection;824;0;948;0
WireConnection;928;0;411;0
WireConnection;928;1;927;0
WireConnection;334;0;811;0
WireConnection;334;1;370;0
WireConnection;334;2;757;0
WireConnection;906;0;894;0
WireConnection;410;0;605;0
WireConnection;410;1;584;0
WireConnection;832;0;647;0
WireConnection;832;1;665;0
WireConnection;775;0;778;0
WireConnection;775;1;135;0
WireConnection;904;0;750;0
WireConnection;827;0;831;0
WireConnection;804;0;648;0
WireConnection;572;0;669;0
WireConnection;504;0;572;0
WireConnection;504;1;717;0
WireConnection;504;2;499;0
WireConnection;713;0;588;0
WireConnection;948;0;370;1
WireConnection;948;1;745;0
WireConnection;1013;0;1012;0
WireConnection;1013;1;1012;0
WireConnection;1013;2;1012;0
WireConnection;135;0;623;0
WireConnection;135;1;134;0
WireConnection;135;2;603;0
WireConnection;1093;0;1092;1
WireConnection;1093;1;1092;2
WireConnection;663;0;661;0
WireConnection;1102;0;1126;16
WireConnection;1102;1;1126;0
WireConnection;648;0;1175;0
WireConnection;648;1;646;0
WireConnection;648;2;665;0
WireConnection;1174;0;1173;0
WireConnection;1174;1;1138;0
WireConnection;640;0;569;0
WireConnection;762;0;811;0
WireConnection;762;1;760;0
WireConnection;622;0;133;4
WireConnection;763;0;811;0
WireConnection;763;1;334;0
WireConnection;1149;0;1143;0
WireConnection;134;0;20;0
WireConnection;134;1;603;0
WireConnection;665;0;647;4
WireConnection;665;1;666;0
WireConnection;715;0;713;0
WireConnection;845;0;826;0
WireConnection;845;1;844;0
WireConnection;849;0;997;0
WireConnection;849;1;641;0
WireConnection;849;2;962;0
WireConnection;849;3;664;0
WireConnection;849;4;643;0
ASEEND*/
//CHKSM=0B28AB66E240AB32380BDDAFF45C51D65CD1D9A6