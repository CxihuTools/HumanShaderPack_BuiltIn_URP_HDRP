// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "RRF_HumanShaders/Skin/SSS_2021_RRF"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin]_MainColor("Main Color", Color) = (0.3921569,0.3921569,0.3921569,1)
		_Shininess("Shininess", Range( 0.01 , 1)) = 0.1
		_MainLightTint("MainLightTint", Color) = (1,1,1,0)
		_Albedo_Tint("Albedo_Tint", Color) = (1,1,1,0)
		_Albedo("Albedo", 2D) = "white" {}
		_AlbedoDesaturation("AlbedoDesaturation", Range( -1 , 1)) = 0
		_MetalGloss("Metal-Gloss", 2D) = "black" {}
		_MetalnessDeviate("MetalnessDeviate", Range( -1 , 1)) = 0
		_SmoothnessDeviate("SmoothnessDeviate", Range( -1 , 1)) = 0
		_SSS_TextureWeightA("SSS_Texture-Weight(A)", 2D) = "white" {}
		_ScatterColor("ScatterColor", Color) = (0,0,0,0)
		_SSS_UseAlphaWeight("SSS_UseAlphaWeight", Range( 0 , 1)) = 0
		_SSS_ForceAlphaWeight("SSS_ForceAlphaWeight", Range( 0 , 1)) = 0
		_SSS_ToEmissive("SSS_ToEmissive", Range( 0 , 4)) = 0.1
		_ForwardLight_Bias("ForwardLight_Bias", Range( -1 , 2)) = 0
		_ForwardLight_Scale("ForwardLight_Scale", Range( 0 , 2)) = 0
		_Base_Glow("Base_Glow", Range( 0 , 1)) = 0.05
		_Normal_Map("Normal_Map", 2D) = "bump" {}
		_Micro_Detail_NormalMap("Micro_Detail_NormalMap", 2D) = "bump" {}
		_MicroDetail_Tiling("MicroDetail_Tiling", Range( 1 , 30)) = 10
		_MicroDetail_Offset("MicroDetail_Offset", Range( 0 , 1)) = 0
		_MicroDetail_Power("MicroDetail_Power", Range( 0 , 2)) = 1
		_SoftenMicroNormals("Soften Micro Normals", Range( 0 , 0.1)) = 0
		_MicroDetail_WeightMapGreyscaleR("MicroDetail_WeightMap(Greyscale(R))", 2D) = "white" {}
		_FinalNormalMapPower("FinalNormalMapPower", Range( 0 , 4)) = 1
		_OpacityTexture("OpacityTexture", 2D) = "white" {}
		_AlphaClip("AlphaClip", Range( 0 , 1)) = 0.5
		_DitherAmount("DitherAmount", Range( 0 , 1)) = 0
		_SSS_LighFresBias("SSS_LighFresBias", Range( -0.15 , 0.15)) = 0
		_SSS_LighFresScale("SSS_LighFresScale", Range( -0.15 , 0.15)) = -0.1
		_SSS_LighFresPower("SSS_LighFresPower", Range( -0.1 , 0.2)) = 0
		_SSS_OldMin("SSS_OldMin", Range( 0 , 0.5)) = 0.05
		_SSS_OldMax("SSS_OldMax", Range( -5 , 5)) = -3
		_SSS_NewMin("SSS_NewMin", Range( 0 , 3)) = 2.2
		_SSS_NewMax("SSS_NewMax", Range( -10 , 10)) = -7
		_Refine_LightAttenSSS("Refine_LightAttenSSS", Range( -0.5 , 0.5)) = 1
		_SubScatterShift("SubScatterShift", Range( -1 , 1)) = 0
		_SubScatterMix("SubScatterMix", Range( 0 , 1)) = 0.25
		_LightAttn_Shift("LightAttn_Shift", Range( -1 , 1)) = 0
		_EpidermalColor("EpidermalColor", Color) = (0,0,0,0)
		_EpidermalTweak("EpidermalTweak", Range( -1 , 1)) = 0
		_DualSpec("DualSpec", Range( 0 , 20)) = 0
		_DualSpecScale("DualSpecScale", Range( 0 , 0.5)) = 0
		_DualSpecBias("DualSpecBias", Range( -5 , 0)) = 0
		_SSSFinal("SSSFinal", Range( 0 , 1)) = 0.25
		_Epidermal_Exp("Epidermal_Exp", Range( 0 , 5)) = 0
		[ASEEnd]_FakeOcclusion("FakeOcclusion", Range( 0 , 1)) = 0
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
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70301

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

			#include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_SCREEN_POSITION


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Albedo_ST;
			float4 _OpacityTexture_ST;
			float4 _EpidermalColor;
			float4 _ScatterColor;
			float4 _MainLightTint;
			float4 _MainColor;
			float4 _MetalGloss_ST;
			float4 _MicroDetail_WeightMapGreyscaleR_ST;
			float4 _SSS_TextureWeightA_ST;
			float4 _Albedo_Tint;
			float4 _Normal_Map_ST;
			float _FinalNormalMapPower;
			float _SSS_OldMax;
			float _SSS_NewMin;
			float _SSS_NewMax;
			float _AlbedoDesaturation;
			float _Epidermal_Exp;
			float _EpidermalTweak;
			float _LightAttn_Shift;
			float _Refine_LightAttenSSS;
			float _SubScatterMix;
			float _SubScatterShift;
			float _SSSFinal;
			float _MetalnessDeviate;
			float _FakeOcclusion;
			float _SSS_OldMin;
			float _Base_Glow;
			float _SSS_LighFresPower;
			float _SSS_LighFresScale;
			float _DualSpec;
			float _SoftenMicroNormals;
			float _SmoothnessDeviate;
			float _Shininess;
			float _MicroDetail_Offset;
			float _DualSpecBias;
			float _DualSpecScale;
			float _MicroDetail_Tiling;
			float _ForwardLight_Bias;
			float _ForwardLight_Scale;
			float _SSS_ToEmissive;
			float _DitherAmount;
			float _SSS_UseAlphaWeight;
			float _SSS_ForceAlphaWeight;
			float _SSS_LighFresBias;
			float _MicroDetail_Power;
			float _AlphaClip;
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
			sampler2D _Albedo;
			sampler2D _Normal_Map;
			sampler2D _Micro_Detail_NormalMap;
			sampler2D _MicroDetail_WeightMapGreyscaleR;
			SAMPLER(sampler_MicroDetail_WeightMapGreyscaleR);
			sampler2D _MetalGloss;
			SAMPLER(sampler_MetalGloss);
			sampler2D _SSS_TextureWeightA;
			SAMPLER(sampler_SSS_TextureWeightA);
			sampler2D _OpacityTexture;


			float3 ASEIndirectDiffuse( float2 uvStaticLightmap, float3 normalWS )
			{
			#ifdef LIGHTMAP_ON
				return SampleLightmap( uvStaticLightmap, normalWS );
			#else
				return SampleSH(normalWS);
			#endif
			}
			
			
			float4 SampleGradient( Gradient gradient, float time )
			{
				float3 color = gradient.colors[0].rgb;
				UNITY_UNROLL
				for (int c = 1; c < 8; c++)
				{
				float colorPos = saturate((time - gradient.colors[c-1].w) / (gradient.colors[c].w - gradient.colors[c-1].w)) * step(c, gradient.colorsLength-1);
				color = lerp(color, gradient.colors[c].rgb, lerp(colorPos, step(0.01, colorPos), gradient.type));
				}
				#ifndef UNITY_COLORSPACE_GAMMA
				color = SRGBToLinear(color);
				#endif
				float alpha = gradient.alphas[0].x;
				UNITY_UNROLL
				for (int a = 1; a < 8; a++)
				{
				float alphaPos = saturate((time - gradient.alphas[a-1].y) / (gradient.alphas[a].y - gradient.alphas[a-1].y)) * step(a, gradient.alphasLength-1);
				alpha = lerp(alpha, gradient.alphas[a].x, lerp(alphaPos, step(0.01, alphaPos), gradient.type));
				}
				return float4(color, alpha);
			}
			
			inline float Dither4x4Bayer( int x, int y )
			{
				const float dither[ 16 ] = {
			 1,  9,  3, 11,
			13,  5, 15,  7,
			 4, 12,  2, 10,
			16,  8, 14,  6 };
				int r = y * 4 + x;
				return dither[r] / 16; // same # of instructions as pre-dividing due to compiler magic
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord7.xy = v.texcoord.xy;
				o.ase_normal = v.ase_normal;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.zw = 0;
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

			half4 frag ( VertexOutput IN  ) : SV_Target
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

				float2 uv_Albedo = IN.ase_texcoord7.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float3 desaturateInitialColor570 = ( tex2D( _Albedo, uv_Albedo ) * _Albedo_Tint ).rgb;
				float desaturateDot570 = dot( desaturateInitialColor570, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar570 = lerp( desaturateInitialColor570, desaturateDot570.xxx, _AlbedoDesaturation );
				float3 BaseColour399 = desaturateVar570;
				
				float2 uv_Normal_Map = IN.ase_texcoord7.xy * _Normal_Map_ST.xy + _Normal_Map_ST.zw;
				float3 tex2DNode111 = UnpackNormalScale( tex2D( _Normal_Map, uv_Normal_Map, float2( 0,0 ), float2( 0,0 ) ), 1.0f );
				float2 temp_cast_1 = (_MicroDetail_Tiling).xx;
				float2 temp_cast_2 = (_MicroDetail_Offset).xx;
				float2 texCoord142 = IN.ase_texcoord7.xy * temp_cast_1 + temp_cast_2;
				float2 temp_cast_3 = (_SoftenMicroNormals).xx;
				float2 temp_cast_4 = (_SoftenMicroNormals).xx;
				float3 unpack137 = UnpackNormalScale( tex2D( _Micro_Detail_NormalMap, texCoord142, temp_cast_3, temp_cast_4 ), _MicroDetail_Power );
				unpack137.z = lerp( 1, unpack137.z, saturate(_MicroDetail_Power) );
				float2 uv_MicroDetail_WeightMapGreyscaleR = IN.ase_texcoord7.xy * _MicroDetail_WeightMapGreyscaleR_ST.xy + _MicroDetail_WeightMapGreyscaleR_ST.zw;
				float3 lerpResult135 = lerp( tex2DNode111 , BlendNormal( tex2DNode111 , unpack137 ) , tex2D( _MicroDetail_WeightMapGreyscaleR, uv_MicroDetail_WeightMapGreyscaleR ).r);
				float3 lerpResult187 = lerp( float3(0,0,1) , lerpResult135 , _FinalNormalMapPower);
				float3 normalizeResult188 = normalize( lerpResult187 );
				float3 FinalNormal405 = normalizeResult188;
				
				float dotResult630 = dot( _MainLightPosition.xyz , ( IN.ase_normal + ( FinalNormal405 * 0.1 ) ) );
				float LightDotNormal707 = dotResult630;
				float2 uv_MetalGloss = IN.ase_texcoord7.xy * _MetalGloss_ST.xy + _MetalGloss_ST.zw;
				float4 tex2DNode118 = tex2D( _MetalGloss, uv_MetalGloss );
				float FinalGloss237 = saturate( ( tex2DNode118.a + _SmoothnessDeviate ) );
				float4 temp_cast_5 = (( _DualSpec * FinalGloss237 )).xxxx;
				float4 temp_output_43_0_g55 = temp_cast_5;
				float3 normalizeResult4_g56 = normalize( ( WorldViewDirection + _MainLightPosition.xyz ) );
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal12_g55 = FinalNormal405;
				float3 worldNormal12_g55 = float3(dot(tanToWorld0,tanNormal12_g55), dot(tanToWorld1,tanNormal12_g55), dot(tanToWorld2,tanNormal12_g55));
				float3 normalizeResult64_g55 = normalize( worldNormal12_g55 );
				float dotResult19_g55 = dot( normalizeResult4_g56 , normalizeResult64_g55 );
				float ase_lightAtten = 0;
				Light ase_lightAtten_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_lightAtten_mainLight.distanceAttenuation * ase_lightAtten_mainLight.shadowAttenuation;
				float4 temp_output_40_0_g55 = ( _MainLightColor * ase_lightAtten );
				float dotResult14_g55 = dot( normalizeResult64_g55 , _MainLightPosition.xyz );
				float3 bakedGI34_g55 = ASEIndirectDiffuse( IN.lightmapUVOrVertexSH.xy, normalizeResult64_g55);
				float4 temp_output_42_0_g55 = _MainColor;
				float3 desaturateInitialColor832 = saturate( ( ( ( LightDotNormal707 * ( ( float4( (temp_output_43_0_g55).rgb , 0.0 ) * (temp_output_43_0_g55).a * pow( max( dotResult19_g55 , 0.0 ) , ( _Shininess * 128.0 ) ) * temp_output_40_0_g55 ) + ( ( ( temp_output_40_0_g55 * max( dotResult14_g55 , 0.0 ) ) + float4( bakedGI34_g55 , 0.0 ) ) * float4( (temp_output_42_0_g55).rgb , 0.0 ) ) ) * ase_lightAtten * _MainLightColor * float4( BaseColour399 , 0.0 ) ) + _DualSpecBias ) * _DualSpecScale ) ).rgb;
				float desaturateDot832 = dot( desaturateInitialColor832, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar832 = lerp( desaturateInitialColor832, desaturateDot832.xxx, 0.95 );
				float clampResult82 = clamp( ( ( LightDotNormal707 + _ForwardLight_Bias ) * _ForwardLight_Scale ) , 0.0 , 1.0 );
				float clampResult107 = clamp( _MainLightColor.a , 0.0 , 1.0 );
				float3 temp_output_62_0 = ( clampResult82 * _MainLightColor.rgb * clampResult107 );
				float4 ForwardLight398 = ( _MainLightTint * float4( temp_output_62_0 , 0.0 ) * float4( temp_output_62_0 , 0.0 ) * _ScatterColor );
				float4 lerpResult446 = lerp( float4( 0,0,0,0 ) , ForwardLight398 , _SSS_ToEmissive);
				float4 clampResult540 = clamp( lerpResult446 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float2 uv_SSS_TextureWeightA = IN.ase_texcoord7.xy * _SSS_TextureWeightA_ST.xy + _SSS_TextureWeightA_ST.zw;
				float4 tex2DNode114 = tex2D( _SSS_TextureWeightA, uv_SSS_TextureWeightA );
				float3 temp_cast_14 = (tex2DNode114.a).xxx;
				float temp_output_2_0_g49 = _SSS_UseAlphaWeight;
				float temp_output_3_0_g49 = ( 1.0 - temp_output_2_0_g49 );
				float3 appendResult7_g49 = (float3(temp_output_3_0_g49 , temp_output_3_0_g49 , temp_output_3_0_g49));
				float4 lerpResult493 = lerp( tex2DNode114 , float4( ( ( temp_cast_14 * temp_output_2_0_g49 ) + appendResult7_g49 ) , 0.0 ) , _SSS_ForceAlphaWeight);
				float4 temp_output_510_0 = ( ( _ScatterColor * tex2DNode114 ) * lerpResult493 );
				float fresnelNdotV511 = dot( _MainLightPosition.xyz, WorldViewDirection );
				float fresnelNode511 = ( _SSS_LighFresBias + _SSS_LighFresScale * pow( 1.0 - fresnelNdotV511, _SSS_LighFresPower ) );
				float clampResult601 = clamp( fresnelNode511 , 0.0 , 1.0 );
				float dotResult605 = dot( _MainLightPosition.xyz , WorldViewDirection );
				float temp_output_607_0 = ( 1.0 - dotResult605 );
				float LightDotView606 = ( temp_output_607_0 * temp_output_607_0 );
				float clampResult546 = clamp( ( clampResult601 * ase_lightAtten * LightDotView606 ) , 0.0 , 1.0 );
				float FresBackScatterMask797 = clampResult546;
				float4 transform613 = mul(GetWorldToObjectMatrix(),float4( WorldViewDirection , 0.0 ));
				float dotResult612 = dot( transform613 , float4( IN.ase_normal , 0.0 ) );
				float clampResult618 = clamp( ( 1.0 - ( ( dotResult612 + 0.25 ) * 0.85 ) ) , 0.0 , 1.0 );
				float ViewDotNormal621 = clampResult618;
				float clampResult645 = clamp( ( _SSS_ToEmissive * FresBackScatterMask797 * ViewDotNormal621 ) , 0.0 , 1.0 );
				float BackScatter508 = clampResult645;
				float3 lerpResult433 = lerp( float3( 0,0,0 ) , BaseColour399 , _Base_Glow);
				float clampResult591 = clamp( ( 1.0 - ( LightDotNormal707 * (_SSS_NewMin + (LightDotNormal707 - _SSS_OldMin) * (_SSS_NewMax - _SSS_NewMin) / (_SSS_OldMax - _SSS_OldMin)) ) ) , 0.0 , 1.0 );
				float SSS_Band592 = clampResult591;
				float temp_output_698_0 = ( _EpidermalColor.a + 1.0 );
				float saferPower637 = max( LightDotNormal707 , 0.0001 );
				float clampResult647 = clamp( ( dotResult630 - ( pow( saferPower637 , _Epidermal_Exp ) * _EpidermalTweak ) ) , 0.0 , 1.0 );
				float FineSSS_Band640 = clampResult647;
				float4 temp_output_694_0 = ( float4( BaseColour399 , 0.0 ) * _EpidermalColor );
				float3 desaturateInitialColor653 = temp_output_694_0.rgb;
				float desaturateDot653 = dot( desaturateInitialColor653, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar653 = lerp( desaturateInitialColor653, desaturateDot653.xxx, FineSSS_Band640 );
				Gradient gradient703 = NewGradient( 0, 5, 2, float4( 0, 0, 0, 0.08148318 ), float4( 0, 0, 0, 0.4854505 ), float4( 1, 0, 0, 0.741558 ), float4( 1, 0.7812411, 0, 0.9429618 ), float4( 1, 0.9969188, 0.9859152, 0.9918517 ), 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				float temp_output_736_0 = ( pow( ( _LightAttn_Shift + ase_lightAtten ) , _Refine_LightAttenSSS ) * pow( ( 1.0 - ( _LightAttn_Shift + ase_lightAtten ) ) , _Refine_LightAttenSSS ) );
				float clampResult732 = clamp( temp_output_736_0 , 0.0 , 1.0 );
				float lerpResult725 = lerp( clampResult732 , ( 1.0 - clampResult732 ) , _SubScatterMix);
				float4 temp_output_574_0 = ( ( clampResult540 + ( temp_output_510_0 * BackScatter508 ) ) + float4( lerpResult433 , 0.0 ) + ( ( SSS_Band592 * ( temp_output_698_0 * temp_output_698_0 ) ) * temp_output_510_0 * LightDotView606 * ViewDotNormal621 * FresBackScatterMask797 ) + ( FineSSS_Band640 * temp_output_694_0 * float4( desaturateVar653 , 0.0 ) ) + ( SampleGradient( gradient703, ( ( lerpResult725 + _SubScatterShift ) * ase_lightAtten ) ) * _SSSFinal ) );
				float4 clampResult646 = clamp( temp_output_574_0 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 FinalEmission277 = clampResult646;
				
				float4 clampResult496 = clamp( ( tex2DNode118 + _MetalnessDeviate ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 finalMetalness316 = clampResult496;
				
				float3 tanNormal803 = FinalNormal405;
				float temp_output_692_0 = ( (FinalNormal405).z * _FakeOcclusion * 100.0 );
				float3 temp_cast_25 = (temp_output_692_0).xxx;
				float temp_output_2_0_g54 = saturate( temp_output_692_0 );
				float temp_output_3_0_g54 = ( 1.0 - temp_output_2_0_g54 );
				float3 appendResult7_g54 = (float3(temp_output_3_0_g54 , temp_output_3_0_g54 , temp_output_3_0_g54));
				half3 reflectVector803 = reflect( -WorldViewDirection, float3(dot(tanToWorld0,tanNormal803), dot(tanToWorld1,tanNormal803), dot(tanToWorld2,tanNormal803)) );
				float3 indirectSpecular803 = GlossyEnvironmentReflection( reflectVector803, 1.0 - FinalGloss237, ( ( temp_cast_25 * temp_output_2_0_g54 ) + appendResult7_g54 ).x );
				
				float2 uv_OpacityTexture = IN.ase_texcoord7.xy * _OpacityTexture_ST.xy + _OpacityTexture_ST.zw;
				float4 tex2DNode291 = tex2D( _OpacityTexture, uv_OpacityTexture );
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 clipScreen293 = ase_screenPosNorm.xy * _ScreenParams.xy;
				float dither293 = Dither4x4Bayer( fmod(clipScreen293.x, 4), fmod(clipScreen293.y, 4) );
				dither293 = step( dither293, tex2DNode291.r );
				float4 temp_cast_29 = (dither293).xxxx;
				float4 lerpResult294 = lerp( tex2DNode291 , temp_cast_29 , _DitherAmount);
				float4 FinalOpacity402 = lerpResult294;
				
				float3 Albedo = BaseColour399;
				float3 Normal = FinalNormal405;
				float3 Emission = ( float4( desaturateVar832 , 0.0 ) + FinalEmission277 ).rgb;
				float3 Specular = 0.5;
				float Metallic = finalMetalness316.r;
				float Smoothness = FinalGloss237;
				float Occlusion = ( BaseColour399 * indirectSpecular803 ).x;
				float Alpha = FinalOpacity402.r;
				float AlphaClipThreshold = _AlphaClip;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

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
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70301

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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Albedo_ST;
			float4 _OpacityTexture_ST;
			float4 _EpidermalColor;
			float4 _ScatterColor;
			float4 _MainLightTint;
			float4 _MainColor;
			float4 _MetalGloss_ST;
			float4 _MicroDetail_WeightMapGreyscaleR_ST;
			float4 _SSS_TextureWeightA_ST;
			float4 _Albedo_Tint;
			float4 _Normal_Map_ST;
			float _FinalNormalMapPower;
			float _SSS_OldMax;
			float _SSS_NewMin;
			float _SSS_NewMax;
			float _AlbedoDesaturation;
			float _Epidermal_Exp;
			float _EpidermalTweak;
			float _LightAttn_Shift;
			float _Refine_LightAttenSSS;
			float _SubScatterMix;
			float _SubScatterShift;
			float _SSSFinal;
			float _MetalnessDeviate;
			float _FakeOcclusion;
			float _SSS_OldMin;
			float _Base_Glow;
			float _SSS_LighFresPower;
			float _SSS_LighFresScale;
			float _DualSpec;
			float _SoftenMicroNormals;
			float _SmoothnessDeviate;
			float _Shininess;
			float _MicroDetail_Offset;
			float _DualSpecBias;
			float _DualSpecScale;
			float _MicroDetail_Tiling;
			float _ForwardLight_Bias;
			float _ForwardLight_Scale;
			float _SSS_ToEmissive;
			float _DitherAmount;
			float _SSS_UseAlphaWeight;
			float _SSS_ForceAlphaWeight;
			float _SSS_LighFresBias;
			float _MicroDetail_Power;
			float _AlphaClip;
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
			sampler2D _OpacityTexture;


			inline float Dither4x4Bayer( int x, int y )
			{
				const float dither[ 16 ] = {
			 1,  9,  3, 11,
			13,  5, 15,  7,
			 4, 12,  2, 10,
			16,  8, 14,  6 };
				int r = y * 4 + x;
				return dither[r] / 16; // same # of instructions as pre-dividing due to compiler magic
			}
			

			float3 _LightDirection;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
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

				float2 uv_OpacityTexture = IN.ase_texcoord2.xy * _OpacityTexture_ST.xy + _OpacityTexture_ST.zw;
				float4 tex2DNode291 = tex2D( _OpacityTexture, uv_OpacityTexture );
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 clipScreen293 = ase_screenPosNorm.xy * _ScreenParams.xy;
				float dither293 = Dither4x4Bayer( fmod(clipScreen293.x, 4), fmod(clipScreen293.y, 4) );
				dither293 = step( dither293, tex2DNode291.r );
				float4 temp_cast_1 = (dither293).xxxx;
				float4 lerpResult294 = lerp( tex2DNode291 , temp_cast_1 , _DitherAmount);
				float4 FinalOpacity402 = lerpResult294;
				
				float Alpha = FinalOpacity402.r;
				float AlphaClipThreshold = _AlphaClip;
				float AlphaClipThresholdShadow = 0.5;

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
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70301

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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Albedo_ST;
			float4 _OpacityTexture_ST;
			float4 _EpidermalColor;
			float4 _ScatterColor;
			float4 _MainLightTint;
			float4 _MainColor;
			float4 _MetalGloss_ST;
			float4 _MicroDetail_WeightMapGreyscaleR_ST;
			float4 _SSS_TextureWeightA_ST;
			float4 _Albedo_Tint;
			float4 _Normal_Map_ST;
			float _FinalNormalMapPower;
			float _SSS_OldMax;
			float _SSS_NewMin;
			float _SSS_NewMax;
			float _AlbedoDesaturation;
			float _Epidermal_Exp;
			float _EpidermalTweak;
			float _LightAttn_Shift;
			float _Refine_LightAttenSSS;
			float _SubScatterMix;
			float _SubScatterShift;
			float _SSSFinal;
			float _MetalnessDeviate;
			float _FakeOcclusion;
			float _SSS_OldMin;
			float _Base_Glow;
			float _SSS_LighFresPower;
			float _SSS_LighFresScale;
			float _DualSpec;
			float _SoftenMicroNormals;
			float _SmoothnessDeviate;
			float _Shininess;
			float _MicroDetail_Offset;
			float _DualSpecBias;
			float _DualSpecScale;
			float _MicroDetail_Tiling;
			float _ForwardLight_Bias;
			float _ForwardLight_Scale;
			float _SSS_ToEmissive;
			float _DitherAmount;
			float _SSS_UseAlphaWeight;
			float _SSS_ForceAlphaWeight;
			float _SSS_LighFresBias;
			float _MicroDetail_Power;
			float _AlphaClip;
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
			sampler2D _OpacityTexture;


			inline float Dither4x4Bayer( int x, int y )
			{
				const float dither[ 16 ] = {
			 1,  9,  3, 11,
			13,  5, 15,  7,
			 4, 12,  2, 10,
			16,  8, 14,  6 };
				int r = y * 4 + x;
				return dither[r] / 16; // same # of instructions as pre-dividing due to compiler magic
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
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

				float2 uv_OpacityTexture = IN.ase_texcoord2.xy * _OpacityTexture_ST.xy + _OpacityTexture_ST.zw;
				float4 tex2DNode291 = tex2D( _OpacityTexture, uv_OpacityTexture );
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 clipScreen293 = ase_screenPosNorm.xy * _ScreenParams.xy;
				float dither293 = Dither4x4Bayer( fmod(clipScreen293.x, 4), fmod(clipScreen293.y, 4) );
				dither293 = step( dither293, tex2DNode291.r );
				float4 temp_cast_1 = (dither293).xxxx;
				float4 lerpResult294 = lerp( tex2DNode291 , temp_cast_1 , _DitherAmount);
				float4 FinalOpacity402 = lerpResult294;
				
				float Alpha = FinalOpacity402.r;
				float AlphaClipThreshold = _AlphaClip;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
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
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70301

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_NORMAL
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
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
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 lightmapUVOrVertexSH : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Albedo_ST;
			float4 _OpacityTexture_ST;
			float4 _EpidermalColor;
			float4 _ScatterColor;
			float4 _MainLightTint;
			float4 _MainColor;
			float4 _MetalGloss_ST;
			float4 _MicroDetail_WeightMapGreyscaleR_ST;
			float4 _SSS_TextureWeightA_ST;
			float4 _Albedo_Tint;
			float4 _Normal_Map_ST;
			float _FinalNormalMapPower;
			float _SSS_OldMax;
			float _SSS_NewMin;
			float _SSS_NewMax;
			float _AlbedoDesaturation;
			float _Epidermal_Exp;
			float _EpidermalTweak;
			float _LightAttn_Shift;
			float _Refine_LightAttenSSS;
			float _SubScatterMix;
			float _SubScatterShift;
			float _SSSFinal;
			float _MetalnessDeviate;
			float _FakeOcclusion;
			float _SSS_OldMin;
			float _Base_Glow;
			float _SSS_LighFresPower;
			float _SSS_LighFresScale;
			float _DualSpec;
			float _SoftenMicroNormals;
			float _SmoothnessDeviate;
			float _Shininess;
			float _MicroDetail_Offset;
			float _DualSpecBias;
			float _DualSpecScale;
			float _MicroDetail_Tiling;
			float _ForwardLight_Bias;
			float _ForwardLight_Scale;
			float _SSS_ToEmissive;
			float _DitherAmount;
			float _SSS_UseAlphaWeight;
			float _SSS_ForceAlphaWeight;
			float _SSS_LighFresBias;
			float _MicroDetail_Power;
			float _AlphaClip;
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
			sampler2D _Albedo;
			sampler2D _Normal_Map;
			sampler2D _Micro_Detail_NormalMap;
			sampler2D _MicroDetail_WeightMapGreyscaleR;
			SAMPLER(sampler_MicroDetail_WeightMapGreyscaleR);
			sampler2D _MetalGloss;
			SAMPLER(sampler_MetalGloss);
			sampler2D _SSS_TextureWeightA;
			SAMPLER(sampler_SSS_TextureWeightA);
			sampler2D _OpacityTexture;


			float3 ASEIndirectDiffuse( float2 uvStaticLightmap, float3 normalWS )
			{
			#ifdef LIGHTMAP_ON
				return SampleLightmap( uvStaticLightmap, normalWS );
			#else
				return SampleSH(normalWS);
			#endif
			}
			
			
			float4 SampleGradient( Gradient gradient, float time )
			{
				float3 color = gradient.colors[0].rgb;
				UNITY_UNROLL
				for (int c = 1; c < 8; c++)
				{
				float colorPos = saturate((time - gradient.colors[c-1].w) / (gradient.colors[c].w - gradient.colors[c-1].w)) * step(c, gradient.colorsLength-1);
				color = lerp(color, gradient.colors[c].rgb, lerp(colorPos, step(0.01, colorPos), gradient.type));
				}
				#ifndef UNITY_COLORSPACE_GAMMA
				color = SRGBToLinear(color);
				#endif
				float alpha = gradient.alphas[0].x;
				UNITY_UNROLL
				for (int a = 1; a < 8; a++)
				{
				float alphaPos = saturate((time - gradient.alphas[a-1].y) / (gradient.alphas[a].y - gradient.alphas[a-1].y)) * step(a, gradient.alphasLength-1);
				alpha = lerp(alpha, gradient.alphas[a].x, lerp(alphaPos, step(0.01, alphaPos), gradient.type));
				}
				return float4(color, alpha);
			}
			
			inline float Dither4x4Bayer( int x, int y )
			{
				const float dither[ 16 ] = {
			 1,  9,  3, 11,
			13,  5, 15,  7,
			 4, 12,  2, 10,
			16,  8, 14,  6 };
				int r = y * 4 + x;
				return dither[r] / 16; // same # of instructions as pre-dividing due to compiler magic
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( ase_worldNormal, o.lightmapUVOrVertexSH.xyz );
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord7 = screenPos;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_normal = v.ase_normal;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				
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
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;

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
				o.ase_texcoord = v.ase_texcoord;
				o.ase_tangent = v.ase_tangent;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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

				float2 uv_Albedo = IN.ase_texcoord2.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float3 desaturateInitialColor570 = ( tex2D( _Albedo, uv_Albedo ) * _Albedo_Tint ).rgb;
				float desaturateDot570 = dot( desaturateInitialColor570, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar570 = lerp( desaturateInitialColor570, desaturateDot570.xxx, _AlbedoDesaturation );
				float3 BaseColour399 = desaturateVar570;
				
				float2 uv_Normal_Map = IN.ase_texcoord2.xy * _Normal_Map_ST.xy + _Normal_Map_ST.zw;
				float3 tex2DNode111 = UnpackNormalScale( tex2D( _Normal_Map, uv_Normal_Map, float2( 0,0 ), float2( 0,0 ) ), 1.0f );
				float2 temp_cast_1 = (_MicroDetail_Tiling).xx;
				float2 temp_cast_2 = (_MicroDetail_Offset).xx;
				float2 texCoord142 = IN.ase_texcoord2.xy * temp_cast_1 + temp_cast_2;
				float2 temp_cast_3 = (_SoftenMicroNormals).xx;
				float2 temp_cast_4 = (_SoftenMicroNormals).xx;
				float3 unpack137 = UnpackNormalScale( tex2D( _Micro_Detail_NormalMap, texCoord142, temp_cast_3, temp_cast_4 ), _MicroDetail_Power );
				unpack137.z = lerp( 1, unpack137.z, saturate(_MicroDetail_Power) );
				float2 uv_MicroDetail_WeightMapGreyscaleR = IN.ase_texcoord2.xy * _MicroDetail_WeightMapGreyscaleR_ST.xy + _MicroDetail_WeightMapGreyscaleR_ST.zw;
				float3 lerpResult135 = lerp( tex2DNode111 , BlendNormal( tex2DNode111 , unpack137 ) , tex2D( _MicroDetail_WeightMapGreyscaleR, uv_MicroDetail_WeightMapGreyscaleR ).r);
				float3 lerpResult187 = lerp( float3(0,0,1) , lerpResult135 , _FinalNormalMapPower);
				float3 normalizeResult188 = normalize( lerpResult187 );
				float3 FinalNormal405 = normalizeResult188;
				float dotResult630 = dot( _MainLightPosition.xyz , ( IN.ase_normal + ( FinalNormal405 * 0.1 ) ) );
				float LightDotNormal707 = dotResult630;
				float2 uv_MetalGloss = IN.ase_texcoord2.xy * _MetalGloss_ST.xy + _MetalGloss_ST.zw;
				float4 tex2DNode118 = tex2D( _MetalGloss, uv_MetalGloss );
				float FinalGloss237 = saturate( ( tex2DNode118.a + _SmoothnessDeviate ) );
				float4 temp_cast_5 = (( _DualSpec * FinalGloss237 )).xxxx;
				float4 temp_output_43_0_g55 = temp_cast_5;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult4_g56 = normalize( ( ase_worldViewDir + _MainLightPosition.xyz ) );
				float3 ase_worldTangent = IN.ase_texcoord3.xyz;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal12_g55 = FinalNormal405;
				float3 worldNormal12_g55 = float3(dot(tanToWorld0,tanNormal12_g55), dot(tanToWorld1,tanNormal12_g55), dot(tanToWorld2,tanNormal12_g55));
				float3 normalizeResult64_g55 = normalize( worldNormal12_g55 );
				float dotResult19_g55 = dot( normalizeResult4_g56 , normalizeResult64_g55 );
				float ase_lightAtten = 0;
				Light ase_lightAtten_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_lightAtten_mainLight.distanceAttenuation * ase_lightAtten_mainLight.shadowAttenuation;
				float4 temp_output_40_0_g55 = ( _MainLightColor * ase_lightAtten );
				float dotResult14_g55 = dot( normalizeResult64_g55 , _MainLightPosition.xyz );
				float3 bakedGI34_g55 = ASEIndirectDiffuse( IN.lightmapUVOrVertexSH.xy, normalizeResult64_g55);
				float4 temp_output_42_0_g55 = _MainColor;
				float3 desaturateInitialColor832 = saturate( ( ( ( LightDotNormal707 * ( ( float4( (temp_output_43_0_g55).rgb , 0.0 ) * (temp_output_43_0_g55).a * pow( max( dotResult19_g55 , 0.0 ) , ( _Shininess * 128.0 ) ) * temp_output_40_0_g55 ) + ( ( ( temp_output_40_0_g55 * max( dotResult14_g55 , 0.0 ) ) + float4( bakedGI34_g55 , 0.0 ) ) * float4( (temp_output_42_0_g55).rgb , 0.0 ) ) ) * ase_lightAtten * _MainLightColor * float4( BaseColour399 , 0.0 ) ) + _DualSpecBias ) * _DualSpecScale ) ).rgb;
				float desaturateDot832 = dot( desaturateInitialColor832, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar832 = lerp( desaturateInitialColor832, desaturateDot832.xxx, 0.95 );
				float clampResult82 = clamp( ( ( LightDotNormal707 + _ForwardLight_Bias ) * _ForwardLight_Scale ) , 0.0 , 1.0 );
				float clampResult107 = clamp( _MainLightColor.a , 0.0 , 1.0 );
				float3 temp_output_62_0 = ( clampResult82 * _MainLightColor.rgb * clampResult107 );
				float4 ForwardLight398 = ( _MainLightTint * float4( temp_output_62_0 , 0.0 ) * float4( temp_output_62_0 , 0.0 ) * _ScatterColor );
				float4 lerpResult446 = lerp( float4( 0,0,0,0 ) , ForwardLight398 , _SSS_ToEmissive);
				float4 clampResult540 = clamp( lerpResult446 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float2 uv_SSS_TextureWeightA = IN.ase_texcoord2.xy * _SSS_TextureWeightA_ST.xy + _SSS_TextureWeightA_ST.zw;
				float4 tex2DNode114 = tex2D( _SSS_TextureWeightA, uv_SSS_TextureWeightA );
				float3 temp_cast_14 = (tex2DNode114.a).xxx;
				float temp_output_2_0_g49 = _SSS_UseAlphaWeight;
				float temp_output_3_0_g49 = ( 1.0 - temp_output_2_0_g49 );
				float3 appendResult7_g49 = (float3(temp_output_3_0_g49 , temp_output_3_0_g49 , temp_output_3_0_g49));
				float4 lerpResult493 = lerp( tex2DNode114 , float4( ( ( temp_cast_14 * temp_output_2_0_g49 ) + appendResult7_g49 ) , 0.0 ) , _SSS_ForceAlphaWeight);
				float4 temp_output_510_0 = ( ( _ScatterColor * tex2DNode114 ) * lerpResult493 );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float fresnelNdotV511 = dot( _MainLightPosition.xyz, ase_worldViewDir );
				float fresnelNode511 = ( _SSS_LighFresBias + _SSS_LighFresScale * pow( 1.0 - fresnelNdotV511, _SSS_LighFresPower ) );
				float clampResult601 = clamp( fresnelNode511 , 0.0 , 1.0 );
				float dotResult605 = dot( _MainLightPosition.xyz , ase_worldViewDir );
				float temp_output_607_0 = ( 1.0 - dotResult605 );
				float LightDotView606 = ( temp_output_607_0 * temp_output_607_0 );
				float clampResult546 = clamp( ( clampResult601 * ase_lightAtten * LightDotView606 ) , 0.0 , 1.0 );
				float FresBackScatterMask797 = clampResult546;
				float4 transform613 = mul(GetWorldToObjectMatrix(),float4( ase_worldViewDir , 0.0 ));
				float dotResult612 = dot( transform613 , float4( IN.ase_normal , 0.0 ) );
				float clampResult618 = clamp( ( 1.0 - ( ( dotResult612 + 0.25 ) * 0.85 ) ) , 0.0 , 1.0 );
				float ViewDotNormal621 = clampResult618;
				float clampResult645 = clamp( ( _SSS_ToEmissive * FresBackScatterMask797 * ViewDotNormal621 ) , 0.0 , 1.0 );
				float BackScatter508 = clampResult645;
				float3 lerpResult433 = lerp( float3( 0,0,0 ) , BaseColour399 , _Base_Glow);
				float clampResult591 = clamp( ( 1.0 - ( LightDotNormal707 * (_SSS_NewMin + (LightDotNormal707 - _SSS_OldMin) * (_SSS_NewMax - _SSS_NewMin) / (_SSS_OldMax - _SSS_OldMin)) ) ) , 0.0 , 1.0 );
				float SSS_Band592 = clampResult591;
				float temp_output_698_0 = ( _EpidermalColor.a + 1.0 );
				float saferPower637 = max( LightDotNormal707 , 0.0001 );
				float clampResult647 = clamp( ( dotResult630 - ( pow( saferPower637 , _Epidermal_Exp ) * _EpidermalTweak ) ) , 0.0 , 1.0 );
				float FineSSS_Band640 = clampResult647;
				float4 temp_output_694_0 = ( float4( BaseColour399 , 0.0 ) * _EpidermalColor );
				float3 desaturateInitialColor653 = temp_output_694_0.rgb;
				float desaturateDot653 = dot( desaturateInitialColor653, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar653 = lerp( desaturateInitialColor653, desaturateDot653.xxx, FineSSS_Band640 );
				Gradient gradient703 = NewGradient( 0, 5, 2, float4( 0, 0, 0, 0.08148318 ), float4( 0, 0, 0, 0.4854505 ), float4( 1, 0, 0, 0.741558 ), float4( 1, 0.7812411, 0, 0.9429618 ), float4( 1, 0.9969188, 0.9859152, 0.9918517 ), 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				float temp_output_736_0 = ( pow( ( _LightAttn_Shift + ase_lightAtten ) , _Refine_LightAttenSSS ) * pow( ( 1.0 - ( _LightAttn_Shift + ase_lightAtten ) ) , _Refine_LightAttenSSS ) );
				float clampResult732 = clamp( temp_output_736_0 , 0.0 , 1.0 );
				float lerpResult725 = lerp( clampResult732 , ( 1.0 - clampResult732 ) , _SubScatterMix);
				float4 temp_output_574_0 = ( ( clampResult540 + ( temp_output_510_0 * BackScatter508 ) ) + float4( lerpResult433 , 0.0 ) + ( ( SSS_Band592 * ( temp_output_698_0 * temp_output_698_0 ) ) * temp_output_510_0 * LightDotView606 * ViewDotNormal621 * FresBackScatterMask797 ) + ( FineSSS_Band640 * temp_output_694_0 * float4( desaturateVar653 , 0.0 ) ) + ( SampleGradient( gradient703, ( ( lerpResult725 + _SubScatterShift ) * ase_lightAtten ) ) * _SSSFinal ) );
				float4 clampResult646 = clamp( temp_output_574_0 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 FinalEmission277 = clampResult646;
				
				float2 uv_OpacityTexture = IN.ase_texcoord2.xy * _OpacityTexture_ST.xy + _OpacityTexture_ST.zw;
				float4 tex2DNode291 = tex2D( _OpacityTexture, uv_OpacityTexture );
				float4 screenPos = IN.ase_texcoord7;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 clipScreen293 = ase_screenPosNorm.xy * _ScreenParams.xy;
				float dither293 = Dither4x4Bayer( fmod(clipScreen293.x, 4), fmod(clipScreen293.y, 4) );
				dither293 = step( dither293, tex2DNode291.r );
				float4 temp_cast_25 = (dither293).xxxx;
				float4 lerpResult294 = lerp( tex2DNode291 , temp_cast_25 , _DitherAmount);
				float4 FinalOpacity402 = lerpResult294;
				
				
				float3 Albedo = BaseColour399;
				float3 Emission = ( float4( desaturateVar832 , 0.0 ) + FinalEmission277 ).rgb;
				float Alpha = FinalOpacity402.r;
				float AlphaClipThreshold = _AlphaClip;

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
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 70301

			#pragma enable_d3d11_debug_symbols
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
			
			

			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Albedo_ST;
			float4 _OpacityTexture_ST;
			float4 _EpidermalColor;
			float4 _ScatterColor;
			float4 _MainLightTint;
			float4 _MainColor;
			float4 _MetalGloss_ST;
			float4 _MicroDetail_WeightMapGreyscaleR_ST;
			float4 _SSS_TextureWeightA_ST;
			float4 _Albedo_Tint;
			float4 _Normal_Map_ST;
			float _FinalNormalMapPower;
			float _SSS_OldMax;
			float _SSS_NewMin;
			float _SSS_NewMax;
			float _AlbedoDesaturation;
			float _Epidermal_Exp;
			float _EpidermalTweak;
			float _LightAttn_Shift;
			float _Refine_LightAttenSSS;
			float _SubScatterMix;
			float _SubScatterShift;
			float _SSSFinal;
			float _MetalnessDeviate;
			float _FakeOcclusion;
			float _SSS_OldMin;
			float _Base_Glow;
			float _SSS_LighFresPower;
			float _SSS_LighFresScale;
			float _DualSpec;
			float _SoftenMicroNormals;
			float _SmoothnessDeviate;
			float _Shininess;
			float _MicroDetail_Offset;
			float _DualSpecBias;
			float _DualSpecScale;
			float _MicroDetail_Tiling;
			float _ForwardLight_Bias;
			float _ForwardLight_Scale;
			float _SSS_ToEmissive;
			float _DitherAmount;
			float _SSS_UseAlphaWeight;
			float _SSS_ForceAlphaWeight;
			float _SSS_LighFresBias;
			float _MicroDetail_Power;
			float _AlphaClip;
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
			sampler2D _Albedo;
			sampler2D _OpacityTexture;


			inline float Dither4x4Bayer( int x, int y )
			{
				const float dither[ 16 ] = {
			 1,  9,  3, 11,
			13,  5, 15,  7,
			 4, 12,  2, 10,
			16,  8, 14,  6 };
				int r = y * 4 + x;
				return dither[r] / 16; // same # of instructions as pre-dividing due to compiler magic
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				
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

				float2 uv_Albedo = IN.ase_texcoord2.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float3 desaturateInitialColor570 = ( tex2D( _Albedo, uv_Albedo ) * _Albedo_Tint ).rgb;
				float desaturateDot570 = dot( desaturateInitialColor570, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar570 = lerp( desaturateInitialColor570, desaturateDot570.xxx, _AlbedoDesaturation );
				float3 BaseColour399 = desaturateVar570;
				
				float2 uv_OpacityTexture = IN.ase_texcoord2.xy * _OpacityTexture_ST.xy + _OpacityTexture_ST.zw;
				float4 tex2DNode291 = tex2D( _OpacityTexture, uv_OpacityTexture );
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 clipScreen293 = ase_screenPosNorm.xy * _ScreenParams.xy;
				float dither293 = Dither4x4Bayer( fmod(clipScreen293.x, 4), fmod(clipScreen293.y, 4) );
				dither293 = step( dither293, tex2DNode291.r );
				float4 temp_cast_2 = (dither293).xxxx;
				float4 lerpResult294 = lerp( tex2DNode291 , temp_cast_2 , _DitherAmount);
				float4 FinalOpacity402 = lerpResult294;
				
				
				float3 Albedo = BaseColour399;
				float Alpha = FinalOpacity402.r;
				float AlphaClipThreshold = _AlphaClip;

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
Version=18500
1159.333;514;1370;873;-884.9697;39.09932;1.555934;True;False
Node;AmplifyShaderEditor.CommentaryNode;397;-2604.378,-1042.914;Inherit;False;370;468.1097;Base Colour;2;112;51;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;401;1038.468,-392.9094;Inherit;False;1096.572;356.4184;Opacity;4;294;293;295;291;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;291;1088.468,-339.1072;Inherit;True;Property;_OpacityTexture;OpacityTexture;27;0;Create;True;0;0;False;0;False;-1;None;bf2c97b29cac2cc4591bb7dd31e3e68c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;51;-2518.228,-786.8037;Float;False;Property;_Albedo_Tint;Albedo_Tint;5;0;Create;True;0;0;False;0;False;1,1,1,0;0.8679245,0.8269847,0.8269847,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;112;-2554.377,-992.9136;Inherit;True;Property;_Albedo;Albedo;6;0;Create;True;0;0;False;0;False;-1;None;58240c6d30fded1478c1244ec1ab79a9;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;751;-2104.573,-977.6867;Inherit;False;3043.432;1789.451;Final SSS Mixing;60;113;571;645;627;650;446;699;653;694;398;697;434;594;539;548;435;656;593;575;433;599;698;648;641;597;646;277;713;574;738;741;704;703;718;540;735;734;732;702;730;736;726;712;725;719;570;399;626;508;760;762;761;763;767;759;768;769;771;770;836;;1,1,1,1;0;0
Node;AmplifyShaderEditor.DitheringNode;293;1399.189,-259.643;Inherit;False;0;False;3;0;FLOAT;0;False;1;SAMPLER2D;;False;2;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;295;1297.749,-134.391;Inherit;False;Property;_DitherAmount;DitherAmount;29;0;Create;True;0;0;False;0;False;0;0.499;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;571;-2026.626,-797.9168;Inherit;False;Property;_AlbedoDesaturation;AlbedoDesaturation;7;0;Create;True;0;0;False;0;False;0;0.261;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;113;-2023.718,-924.8581;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;294;1608.091,-316.9092;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DesaturateOpNode;570;-1838.491,-927.6867;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;834;1164.098,-32.35329;Inherit;False;1318.115;586.2323;DualSpec setup;12;825;819;827;826;817;824;831;821;820;822;832;818;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;399;-1644.141,-924.4302;Inherit;False;BaseColour;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;57;-3174.896,-544.7338;Inherit;False;953.4287;573.0931;MainLight;10;61;62;107;82;42;394;395;243;709;396;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;411;-3167.102,86.82392;Inherit;False;894.2906;626.259;SSS Maps;7;494;393;44;117;114;493;509;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;800;1157.205,563.6138;Inherit;False;1489.817;877.7885;Comment;15;271;701;292;403;406;692;690;317;691;408;801;803;823;404;409;OUTPUTS;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;639;-4964.384,603.2914;Inherit;False;1569.841;812.3967;FineBand;16;717;629;707;716;630;638;714;640;634;636;637;708;635;715;647;628;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;400;1008.575,-929.5414;Inherit;False;1312.799;506.9809;Metal Gloss;9;316;237;118;59;496;315;314;812;815;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;748;-4850.261,1969.334;Inherit;False;1419.37;517.7581;View Dot Normal;10;610;611;613;616;612;615;614;617;618;621;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;134;-2022.178,876.9689;Inherit;False;1832.382;1138.664;MicroDetails;11;811;137;111;138;689;140;136;135;142;139;141;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;750;-3343.937,829.9272;Inherit;False;1208.586;926.0003;Mains SSS Mix;16;604;603;605;536;532;534;512;607;533;511;608;569;601;606;549;546;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;184;-340.3551,865.9921;Inherit;False;558;427.8339;FinalNormal;4;187;186;185;188;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;749;-5004.667,1477.019;Inherit;False;1599.055;454.0491;SSS Band 1;10;592;589;711;591;584;590;585;586;588;587;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;402;1982.816,-323.2871;Inherit;False;FinalOpacity;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;509;-2707.245,194.4806;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;493;-2585.179,410.6767;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;640;-3685.065,1000.869;Inherit;False;FineSSS_Band;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;237;1700.626,-643.5104;Float;False;FinalGloss;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;767;-875.0681,-903.4299;Inherit;False;707;LightDotNormal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;510;-2243.512,292.0372;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;818;1214.098,250.6888;Inherit;False;Property;_DualSpec;DualSpec;44;0;Create;True;0;0;False;0;False;0;9.5;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;762;-1605.068,-784.4299;Inherit;False;Property;_LightAttn_Shift;LightAttn_Shift;41;0;Create;True;0;0;False;0;False;0;-0.111;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GradientNode;703;-402.5022,-608.402;Inherit;False;0;5;2;0,0,0,0.08148318;0,0,0,0.4854505;1,0,0,0.741558;1,0.7812411,0,0.9429618;1,0.9969188,0.9859152,0.9918517;1,0;1,1;0;1;OBJECT;0
Node;AmplifyShaderEditor.LerpOp;446;-1877.781,-266.7923;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;770;-353.0681,-303.4299;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;694;-949.0811,343.1931;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;699;-1352.331,603.6755;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;641;-879.4296,167.3088;Inherit;False;640;FineSSS_Band;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;539;-2036.158,423.8373;Inherit;False;508;BackScatter;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;650;-1172.384,294.8697;Inherit;False;399;BaseColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;508;-758.926,646.6255;Inherit;False;BackScatter;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;404;1204.586,918.725;Inherit;False;237;FinalGloss;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;692;1754.515,1143.786;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;765;-697.0681,-850.4299;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;403;1222.779,998.5322;Inherit;False;402;FinalOpacity;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LightAttenuation;771;-692.0681,-225.4299;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;593;-1756.525,378.3249;Inherit;False;592;SSS_Band;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;591;-3855.12,1565.235;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;647;-3899.298,950.997;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;393;-2830.697,436.3599;Inherit;False;Lerp White To;-1;;49;047d7c189c36a62438973bad9d37b1c2;0;2;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DitheringNode;760;-586.739,-609.3062;Inherit;False;1;False;3;0;FLOAT;0;False;1;SAMPLER2D;;False;2;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;494;-2976.798,629.8943;Float;False;Property;_SSS_ForceAlphaWeight;SSS_ForceAlphaWeight;14;0;Create;True;0;0;False;0;False;0;0.882;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;656;-1757.856,474.5403;Float;False;Property;_EpidermalColor;EpidermalColor;42;0;Create;True;0;0;False;0;False;0,0,0,0;0.7264151,0,0.01513342,0.9921569;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;645;-1647.123,650.5272;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;316;2014.923,-878.754;Inherit;False;finalMetalness;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;718;-477.5739,-343.9997;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;398;-2012.979,-519.8069;Inherit;False;ForwardLight;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;738;-190.7274,-295.5968;Inherit;False;Property;_SSS_SidePower;SSS_SidePower;37;0;Create;True;0;0;False;0;False;0.5;0.386;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;596;-2198.996,45.19159;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;496;1841.417,-884.2255;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;698;-1488.331,576.6755;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;712;-901.6418,-510.9576;Inherit;False;707;LightDotNormal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;713;510.038,-525.0368;Inherit;False;Overlay;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;592;-3629.612,1559.949;Inherit;False;SSS_Band;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;805;2479.746,1189.338;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;43;-2298.209,-461.3163;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;719;-895.564,-319.5797;Inherit;False;Property;_SubScatterShift;SubScatterShift;39;0;Create;True;0;0;False;0;False;0;0.213;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;317;1208.327,852.8901;Inherit;False;316;finalMetalness;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;819;1452.611,354.5472;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;817;1590.638,200.4129;Inherit;False;Blinn-Phong Light;0;;55;cf814dba44d007a4e958d2ddd5813da6;0;3;42;COLOR;0,0,0,0;False;52;FLOAT3;0,0,0;False;43;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT;57
Node;AmplifyShaderEditor.RangedFloatNode;822;2031.711,224.3469;Inherit;False;Property;_DualSpecScale;DualSpecScale;45;0;Create;True;0;0;False;0;False;0;0.138;0;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;820;2242.212,100.1468;Inherit;False;ConstantBiasScale;-1;;53;63208df05c83e8e49a48ffbdce2e43a0;0;3;3;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;701;1957.739,1345.495;Inherit;False;Lerp White To;-1;;54;047d7c189c36a62438973bad9d37b1c2;0;2;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;831;2135.542,335.879;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;277;714.8592,-132.0728;Inherit;False;FinalEmission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;821;2025.211,17.6467;Inherit;False;Property;_DualSpecBias;DualSpecBias;46;0;Create;True;0;0;False;0;False;0;-2.39;-5;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;315;1437.096,-740.3552;Float;False;Property;_MetalnessDeviate;MetalnessDeviate;9;0;Create;True;0;0;False;0;False;0;0.018;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;406;1226.854,701.8403;Inherit;False;405;FinalNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;408;1211.829,776.7073;Inherit;False;277;FinalEmission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.DesaturateOpNode;832;2134.844,420.8789;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.95;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;690;1547.79,1138.063;Inherit;False;False;False;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;823;1933.622,630.5284;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;314;1676.28,-879.5414;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;806;1458.629,1285.883;Inherit;False;Constant;_Float3;Float 3;43;0;Create;True;0;0;False;0;False;100;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IndirectSpecularLight;803;2169.938,1307.51;Inherit;False;Tangent;3;0;FLOAT3;0,0,1;False;1;FLOAT;0.5;False;2;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;292;1207.205,1077.718;Inherit;False;Property;_AlphaClip;AlphaClip;28;0;Create;True;0;0;False;0;False;0.5;0.012;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;691;1277.531,1222.803;Inherit;False;Property;_FakeOcclusion;FakeOcclusion;49;0;Create;True;0;0;False;0;False;0;0.071;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;574;255.6378,-130.9461;Inherit;False;5;5;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;434;-1461.852,-190.3784;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;594;-1332.819,208.33;Inherit;False;5;5;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;646;484.5099,-126.208;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;741;174.3803,-405.0402;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GradientSampleNode;704;-222.9528,-504.2071;Inherit;True;2;0;OBJECT;;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DesaturateOpNode;653;-774.952,298.1273;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;575;-1425.759,-82.23521;Inherit;False;399;BaseColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;801;1760.486,1303.221;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;627;-1607.338,347.8387;Inherit;False;621;ViewDotNormal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;435;-1522.418,10.29995;Inherit;False;Property;_Base_Glow;Base_Glow;18;0;Create;True;0;0;False;0;False;0.05;0.022;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;540;-1678.017,-254.159;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;815;1537.292,-630.8939;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;827;1629.312,373.0762;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;824;1589.312,121.0763;Inherit;False;707;LightDotNormal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;826;1601.312,305.0762;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;825;1881.312,185.0763;Inherit;False;5;5;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;4;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;725;-576.5643,-510.5797;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;409;1209.854,627.1921;Inherit;False;399;BaseColour;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;838;188.3759,-271.4671;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;836;-165.192,-197.7104;Inherit;False;Property;_SSSFinal;SSSFinal;47;0;Create;True;0;0;False;0;False;0.25;0.012;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;697;-1252.331,514.6755;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;590;-4061.058,1563.985;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;62;-2383.812,-214.4511;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalVertexDataNode;611;-4608.146,2195.214;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;548;-1870.478,90.17805;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;599;-1604.473,284.5544;Inherit;False;606;LightDotView;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;433;-1191.175,-84.36584;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;605;-3005.937,1519.927;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;726;-907.564,-420.5797;Inherit;False;Property;_SubScatterMix;SubScatterMix;40;0;Create;True;0;0;False;0;False;0.25;0.856;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;734;-1583.488,-651.7961;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;629;-4904.183,653.2915;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;717;-4463.407,889.3005;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;512;-3277.937,879.9272;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldToObjectTransfNode;613;-4616.263,2022.04;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;534;-3261.937,1343.927;Inherit;False;Property;_SSS_LighFresPower;SSS_LighFresPower;32;0;Create;True;0;0;False;0;False;0;0.039;-0.1;0.2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;616;-4411.973,2371.093;Inherit;False;Constant;_Float1;Float 1;35;0;Create;True;0;0;False;0;False;0.85;0.85;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;536;-3245.937,1023.927;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;533;-3277.937,1263.927;Inherit;False;Property;_SSS_LighFresScale;SSS_LighFresScale;31;0;Create;True;0;0;False;0;False;-0.1;0.021;-0.15;0.15;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;810;-1606.042,901.5248;Inherit;True;Property;_Normal_Map;Normal_Map;19;0;Create;True;0;0;False;0;False;None;1d9b4d817a26d39428f65e4c73302e6f;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;730;-1551.488,-539.7961;Inherit;False;Property;_Refine_LightAttenSSS;Refine_LightAttenSSS;38;0;Create;True;0;0;False;0;False;1;0.33;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;511;-2925.937,943.9272;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;-0.1;False;2;FLOAT;0.1;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;630;-4608.164,731.6441;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;608;-2669.937,1519.927;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;614;-4180.624,2070.745;Inherit;False;ConstantBiasScale;-1;;57;63208df05c83e8e49a48ffbdce2e43a0;0;3;3;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;607;-2845.937,1535.927;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;715;-4613.407,944.3005;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalVertexDataNode;628;-4863.183,789.2914;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;610;-4800.26,2019.334;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;139;-1972.178,1070.482;Float;False;Property;_MicroDetail_Tiling;MicroDetail_Tiling;21;0;Create;True;0;0;False;0;False;10;17.3;1;30;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;615;-4424.149,2262.859;Inherit;False;Constant;_Float0;Float 0;34;0;Create;True;0;0;False;0;False;0.25;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;140;-1958.245,1189.618;Float;False;Property;_MicroDetail_Offset;MicroDetail_Offset;22;0;Create;True;0;0;False;0;False;0;0.496;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;612;-4414.679,2076.157;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;142;-1682.315,1141.541;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;811;-1617.039,1243.532;Inherit;True;Property;_Micro_Detail_NormalMap;Micro_Detail_NormalMap;20;0;Create;True;0;0;False;0;False;None;287acedd1e86ed140951c44576dc5b5c;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;689;-1960.338,968.8049;Inherit;False;Property;_SoftenMicroNormals;Soften Micro Normals;24;0;Create;True;0;0;False;0;False;0;0.0169;0;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;137;-1265.938,1132.384;Inherit;True;Property;_MicroDetailNormalMap;MicroDetail(NormalMap);16;0;Create;True;0;0;False;0;False;-1;None;287acedd1e86ed140951c44576dc5b5c;True;0;True;bump;Auto;True;Object;-1;Derivative;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;111;-1260.253,917.9229;Inherit;True;Property;_NormalMap;NormalMap;4;0;Create;True;0;0;False;0;False;-1;None;1d9b4d817a26d39428f65e4c73302e6f;True;0;True;bump;Auto;True;Object;-1;Derivative;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;138;-1283.641,1346.554;Inherit;True;Property;_MicroDetail_WeightMapGreyscaleR;MicroDetail_WeightMap(Greyscale(R));25;0;Create;True;0;0;False;0;False;-1;None;614f9bfed2388564c8eae99fbb2e706a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BlendNormalsNode;136;-944.895,1004.322;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;135;-694.5716,958.0422;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;186;-290.3551,914.5228;Float;False;Constant;_Vector0;Vector 0;32;0;Create;True;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;185;-236.6692,1178.826;Float;False;Property;_FinalNormalMapPower;FinalNormalMapPower;26;0;Create;True;0;0;False;0;False;1;1.57;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;648;-569.8672,133.44;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;405;358.776,1102.499;Inherit;False;FinalNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;604;-3261.937,1567.927;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;716;-4844.407,1034.301;Inherit;False;Constant;_Float2;Float 2;38;0;Create;True;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;603;-3293.937,1423.927;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;714;-4864.407,944.3005;Inherit;False;405;FinalNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;114;-3138.102,307.2418;Inherit;True;Property;_SSS_TextureWeightA;SSS_Texture-Weight(A);11;0;Create;True;0;0;False;0;False;-1;None;19a5b39467072274ba4c2aba08624458;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;761;-1106.068,-901.4299;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;702;-1448.488,-855.7961;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;141;-1968.873,1301.657;Float;False;Property;_MicroDetail_Power;MicroDetail_Power;23;0;Create;True;0;0;False;0;False;1;1.281;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;187;32.17568,941.0535;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;188;69.86812,1104.626;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;735;-1254.488,-669.7961;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;763;-1394.068,-665.4299;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;118;1058.576,-770.7048;Inherit;True;Property;_MetalGloss;Metal-Gloss;8;0;Create;True;0;0;False;0;False;-1;None;fa41110b0f5eced4589ec89923ef6d81;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;42;-2763.198,-474.6644;Float;False;Property;_MainLightTint;MainLightTint;4;0;Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;797;-2122.695,680.8651;Inherit;False;FresBackScatterMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;107;-2532.032,-120.1295;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;634;-4270.634,1131.16;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;589;-4246.159,1564.218;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;637;-4385.634,1025.16;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;626;-1871.573,771.7455;Inherit;False;621;ViewDotNormal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;732;-741.488,-695.7961;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;394;-2751.281,-307.5204;Inherit;False;ConstantBiasScale;-1;;58;63208df05c83e8e49a48ffbdce2e43a0;0;3;3;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;532;-3277.937,1183.927;Inherit;False;Property;_SSS_LighFresBias;SSS_LighFresBias;30;0;Create;True;0;0;False;0;False;0;0.11;-0.15;0.15;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;812;1382.091,-634.8942;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;117;-3128.014,493.4392;Float;False;Property;_SSS_UseAlphaWeight;SSS_UseAlphaWeight;13;0;Create;True;0;0;False;0;False;0;0.908;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;635;-4115.634,956.16;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;44;-3124.115,135.4704;Float;False;Property;_ScatterColor;ScatterColor;12;0;Create;True;0;0;False;0;False;0,0,0,0;0.735849,0.2716629,0.1735492,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;597;-1836.265,652.7645;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;82;-2537.466,-304.1343;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;636;-4629.634,1250.16;Inherit;False;Property;_EpidermalTweak;EpidermalTweak;43;0;Create;True;0;0;False;0;False;0;-0.04;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;61;-2747.218,-194.2196;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.OneMinusNode;769;-570.0681,-725.4299;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;59;1077.181,-561.9395;Float;False;Property;_SmoothnessDeviate;SmoothnessDeviate;10;0;Create;True;0;0;False;0;False;0;-0.352;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;546;-2306.351,921.0951;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;243;-3079.875,-157.3074;Float;False;Property;_SSS_ToEmissive;SSS_ToEmissive;15;0;Create;True;0;0;False;0;False;0.1;1.94;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;601;-2669.937,943.9272;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;617;-3976.333,2093.745;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;606;-2509.937,1519.927;Inherit;False;LightDotView;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;709;-3029.286,-329.523;Inherit;False;707;LightDotNormal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;768;-1068.068,-800.4299;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;584;-4429.619,1629.427;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;638;-4621.634,1137.16;Inherit;False;Property;_Epidermal_Exp;Epidermal_Exp;48;0;Create;True;0;0;False;0;False;0;2.21;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;586;-4731.667,1815.068;Inherit;False;Property;_SSS_NewMax;SSS_NewMax;36;0;Create;True;0;0;False;0;False;-7;-0.58;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;759;-1078.539,-609.2061;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;569;-2845.937,1263.927;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;587;-4954.667,1681.068;Inherit;False;Property;_SSS_OldMin;SSS_OldMin;33;0;Create;True;0;0;False;0;False;0.05;0.249;0;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;588;-4773.667,1725.068;Inherit;False;Property;_SSS_OldMax;SSS_OldMax;34;0;Create;True;0;0;False;0;False;-3;-0.31;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;618;-3818.042,2096.451;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;395;-3092.275,-240.7136;Inherit;False;Property;_ForwardLight_Bias;ForwardLight_Bias;16;0;Create;True;0;0;False;0;False;0;-0.73;-1;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;708;-4875.49,1139.895;Inherit;False;707;LightDotNormal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;396;-3076.573,-74.89666;Inherit;False;Property;_ForwardLight_Scale;ForwardLight_Scale;17;0;Create;True;0;0;False;0;False;0;0.098;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;549;-2464.003,933.36;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;585;-4909.667,1765.068;Inherit;False;Property;_SSS_NewMin;SSS_NewMin;35;0;Create;True;0;0;False;0;False;2.2;1.48;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;711;-4613.324,1527.019;Inherit;False;707;LightDotNormal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;736;-913.488,-771.7961;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;621;-3658.89,2089.56;Inherit;False;ViewDotNormal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;707;-4468.319,728.1129;Inherit;False;LightDotNormal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;274;6024.633,-40.72271;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;272;6024.633,-40.72271;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;270;4559.75,-526.9295;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;271;2335.022,786.5884;Float;False;True;-1;2;;0;2;RRF_HumanShaders/Skin/SSS_2021_RRF;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;17;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;0;Hidden/InternalErrorShader;0;0;Standard;36;Workflow;1;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;1;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;0;  Transmission Shadow;0.5,False,-1;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;1;  Use Shadow Threshold;0;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;0;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;0;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position,InvertActionOnDeselection;1;0;6;False;True;True;True;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;275;6024.633,-40.72271;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;273;6024.633,-40.72271;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;False;False;False;False;0;False;-1;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;293;0;291;0
WireConnection;113;0;112;0
WireConnection;113;1;51;0
WireConnection;294;0;291;0
WireConnection;294;1;293;0
WireConnection;294;2;295;0
WireConnection;570;0;113;0
WireConnection;570;1;571;0
WireConnection;399;0;570;0
WireConnection;402;0;294;0
WireConnection;509;0;44;0
WireConnection;509;1;114;0
WireConnection;493;0;114;0
WireConnection;493;1;393;0
WireConnection;493;2;494;0
WireConnection;640;0;647;0
WireConnection;237;0;815;0
WireConnection;510;0;509;0
WireConnection;510;1;493;0
WireConnection;446;1;398;0
WireConnection;446;2;596;0
WireConnection;770;0;718;0
WireConnection;770;1;771;0
WireConnection;694;0;650;0
WireConnection;694;1;656;0
WireConnection;699;0;698;0
WireConnection;699;1;698;0
WireConnection;508;0;645;0
WireConnection;692;0;690;0
WireConnection;692;1;691;0
WireConnection;692;2;806;0
WireConnection;765;0;767;0
WireConnection;765;1;736;0
WireConnection;591;0;590;0
WireConnection;647;0;635;0
WireConnection;393;1;114;4
WireConnection;393;2;117;0
WireConnection;760;0;732;0
WireConnection;645;0;597;0
WireConnection;316;0;496;0
WireConnection;718;0;725;0
WireConnection;718;1;719;0
WireConnection;398;0;43;0
WireConnection;596;0;243;0
WireConnection;496;0;314;0
WireConnection;698;0;656;4
WireConnection;713;0;574;0
WireConnection;713;1;704;0
WireConnection;713;2;741;0
WireConnection;592;0;591;0
WireConnection;805;0;409;0
WireConnection;805;1;803;0
WireConnection;43;0;42;0
WireConnection;43;1;62;0
WireConnection;43;2;62;0
WireConnection;43;3;44;0
WireConnection;819;0;818;0
WireConnection;819;1;404;0
WireConnection;817;52;406;0
WireConnection;817;43;819;0
WireConnection;820;3;825;0
WireConnection;820;1;821;0
WireConnection;820;2;822;0
WireConnection;701;1;692;0
WireConnection;701;2;801;0
WireConnection;831;0;820;0
WireConnection;277;0;646;0
WireConnection;832;0;831;0
WireConnection;690;0;406;0
WireConnection;823;0;832;0
WireConnection;823;1;408;0
WireConnection;314;0;118;0
WireConnection;314;1;315;0
WireConnection;803;0;406;0
WireConnection;803;1;404;0
WireConnection;803;2;701;0
WireConnection;574;0;434;0
WireConnection;574;1;433;0
WireConnection;574;2;594;0
WireConnection;574;3;648;0
WireConnection;574;4;838;0
WireConnection;434;0;540;0
WireConnection;434;1;548;0
WireConnection;594;0;697;0
WireConnection;594;1;510;0
WireConnection;594;2;599;0
WireConnection;594;3;627;0
WireConnection;594;4;797;0
WireConnection;646;0;574;0
WireConnection;741;0;738;0
WireConnection;704;0;703;0
WireConnection;704;1;770;0
WireConnection;653;0;694;0
WireConnection;653;1;641;0
WireConnection;801;0;692;0
WireConnection;540;0;446;0
WireConnection;815;0;812;0
WireConnection;825;0;824;0
WireConnection;825;1;817;0
WireConnection;825;2;826;0
WireConnection;825;3;827;0
WireConnection;825;4;409;0
WireConnection;725;0;732;0
WireConnection;725;1;769;0
WireConnection;725;2;726;0
WireConnection;838;0;704;0
WireConnection;838;1;836;0
WireConnection;697;0;593;0
WireConnection;697;1;699;0
WireConnection;590;0;589;0
WireConnection;62;0;82;0
WireConnection;62;1;61;1
WireConnection;62;2;107;0
WireConnection;548;0;510;0
WireConnection;548;1;539;0
WireConnection;433;1;575;0
WireConnection;433;2;435;0
WireConnection;605;0;603;0
WireConnection;605;1;604;0
WireConnection;717;0;628;0
WireConnection;717;1;715;0
WireConnection;613;0;610;0
WireConnection;511;0;512;0
WireConnection;511;4;536;0
WireConnection;511;1;532;0
WireConnection;511;2;533;0
WireConnection;511;3;534;0
WireConnection;630;0;629;0
WireConnection;630;1;717;0
WireConnection;608;0;607;0
WireConnection;608;1;607;0
WireConnection;614;3;612;0
WireConnection;614;1;615;0
WireConnection;614;2;616;0
WireConnection;607;0;605;0
WireConnection;715;0;714;0
WireConnection;715;1;716;0
WireConnection;612;0;613;0
WireConnection;612;1;611;0
WireConnection;142;0;139;0
WireConnection;142;1;140;0
WireConnection;137;0;811;0
WireConnection;137;1;142;0
WireConnection;137;3;689;0
WireConnection;137;4;689;0
WireConnection;137;5;141;0
WireConnection;111;0;810;0
WireConnection;136;0;111;0
WireConnection;136;1;137;0
WireConnection;135;0;111;0
WireConnection;135;1;136;0
WireConnection;135;2;138;1
WireConnection;648;0;641;0
WireConnection;648;1;694;0
WireConnection;648;2;653;0
WireConnection;405;0;188;0
WireConnection;761;0;762;0
WireConnection;761;1;702;0
WireConnection;187;0;186;0
WireConnection;187;1;135;0
WireConnection;187;2;185;0
WireConnection;188;0;187;0
WireConnection;735;0;763;0
WireConnection;763;0;762;0
WireConnection;763;1;734;0
WireConnection;797;0;546;0
WireConnection;107;0;61;2
WireConnection;634;0;637;0
WireConnection;634;1;636;0
WireConnection;589;0;711;0
WireConnection;589;1;584;0
WireConnection;637;0;708;0
WireConnection;637;1;638;0
WireConnection;732;0;736;0
WireConnection;394;3;709;0
WireConnection;394;1;395;0
WireConnection;394;2;396;0
WireConnection;812;0;118;4
WireConnection;812;1;59;0
WireConnection;635;0;630;0
WireConnection;635;1;634;0
WireConnection;597;0;243;0
WireConnection;597;1;797;0
WireConnection;597;2;626;0
WireConnection;82;0;394;0
WireConnection;769;0;732;0
WireConnection;546;0;549;0
WireConnection;601;0;511;0
WireConnection;617;0;614;0
WireConnection;606;0;608;0
WireConnection;768;0;761;0
WireConnection;768;1;730;0
WireConnection;584;0;711;0
WireConnection;584;1;587;0
WireConnection;584;2;588;0
WireConnection;584;3;585;0
WireConnection;584;4;586;0
WireConnection;759;0;735;0
WireConnection;759;1;730;0
WireConnection;618;0;617;0
WireConnection;549;0;601;0
WireConnection;549;1;569;0
WireConnection;549;2;606;0
WireConnection;736;0;768;0
WireConnection;736;1;759;0
WireConnection;621;0;618;0
WireConnection;707;0;630;0
WireConnection;271;0;409;0
WireConnection;271;1;406;0
WireConnection;271;2;823;0
WireConnection;271;3;317;0
WireConnection;271;4;404;0
WireConnection;271;5;805;0
WireConnection;271;6;403;0
WireConnection;271;7;292;0
ASEEND*/
//CHKSM=5A6BCFC9B57A79305F68B337FC3238E4E3080126