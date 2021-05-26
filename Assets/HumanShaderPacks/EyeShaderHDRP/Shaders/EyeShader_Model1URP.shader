// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "RRF_HumanShaders/EyeShaders/EyeShader_Model1"
{
	Properties
	{
		[NoScaleOffset]_EyeExtras("EyeExtras", 2D) = "white" {}
		[NoScaleOffset]_IrisExtraDetail("IrisExtraDetail", 2D) = "white" {}
		[NoScaleOffset]_NormalMapBase("NormalMapBase", 2D) = "bump" {}
		_EyeBallColorGlossA("EyeBallColor-Gloss(A)", Color) = (1,1,1,0.853)
		_IrisColorCausticLerpA("IrisColor-CausticLerp(A)", Color) = (0.4482759,1,0,0)
		_IrisExtraColorAmountA("IrisExtraColor-Amount(A)", Color) = (0.08088237,0.07573904,0.04698314,0.591)
		_RingColorAmount("RingColor-Amount", Color) = (0,0,0,0)
		_EyeSize("EyeSize", Range( 0 , 2)) = 1
		_IrisSize("IrisSize", Range( 0 , 10)) = 1
		_IrisGlow("IrisGlow", Range( 0 , 10)) = 0
		_LensGloss("LensGloss", Range( 0 , 1)) = 0.98
		_LensPush("LensPush", Range( 0 , 1)) = 0.64
		_CausticPower("CausticPower", Range( 0 , 5)) = 0.3
		_CausticOffset("CausticOffset", Range( 0 , 5)) = 1
		_CausticScale("CausticScale", Range( 0 , 5)) = 1
		_PupilSize("PupilSize", Range( 0.001 , 89)) = 70
		_PupilHeight1Width1("Pupil Height>1/Width<1", Range( 0.01 , 10)) = 1
		_PupilSharpness("PupilSharpness", Range( 0.1 , 5)) = 5
		_Veins("Veins", Range( 0 , 1)) = 0
		_BoostEyeWhite("BoostEyeWhite", Range( 1 , 2)) = 1
		_GlobalEmissive("GlobalEmissive", Range( 0 , 2)) = 0.5
		_PupilParallaxHeight("PupilParallaxHeight", Range( -4 , 8)) = 1.4
		_ParalaxH("ParalaxH", Float) = -0.2

	}

	SubShader
	{
		LOD 0

		
		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" }
		
		Cull Back
		HLSLINCLUDE
		#pragma target 3.0
		ENDHLSL

		
		Pass
		{
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }
			
			Blend One Zero , One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define ASE_SRP_VERSION 70106
			#define _NORMALMAP 1

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


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			

			sampler2D _EyeExtras;
			sampler2D _IrisExtraDetail;
			sampler2D _NormalMapBase;
			CBUFFER_START( UnityPerMaterial )
			float _BoostEyeWhite;
			float _EyeSize;
			half _PupilSize;
			float _PupilHeight1Width1;
			float _ParalaxH;
			float _PupilParallaxHeight;
			float _PupilSharpness;
			float4 _EyeBallColorGlossA;
			float _CausticPower;
			float _CausticScale;
			float _CausticOffset;
			float4 _IrisColorCausticLerpA;
			float4 _RingColorAmount;
			float _Veins;
			float _IrisSize;
			float4 _IrisExtraColorAmountA;
			float _LensPush;
			float _IrisGlow;
			float _GlobalEmissive;
			float _LensGloss;
			CBUFFER_END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				float4 shadowCoord : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				float4 ase_texcoord7 : TEXCOORD7;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			

			VertexOutput vert ( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord7.xy = v.ase_texcoord.xy;
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

				float3 lwWNormal = TransformObjectToWorldNormal(v.ase_normal);
				float3 lwWorldPos = TransformObjectToWorld(v.vertex.xyz);
				float3 lwWTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float3 lwWBinormal = normalize(cross(lwWNormal, lwWTangent) * v.ase_tangent.w);
				o.tSpace0 = float4(lwWTangent.x, lwWBinormal.x, lwWNormal.x, lwWorldPos.x);
				o.tSpace1 = float4(lwWTangent.y, lwWBinormal.y, lwWNormal.y, lwWorldPos.y);
				o.tSpace2 = float4(lwWTangent.z, lwWBinormal.z, lwWNormal.z, lwWorldPos.z);

				VertexPositionInputs vertexInput = GetVertexPositionInputs(v.vertex.xyz);
				
				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH(lwWNormal, o.lightmapUVOrVertexSH.xyz );

				half3 vertexLight = VertexLighting(vertexInput.positionWS, lwWNormal);
				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( vertexInput.positionCS.z );
				#else
					half fogFactor = 0;
				#endif
				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);
				o.clipPos = vertexInput.positionCS;

				#ifdef _MAIN_LIGHT_SHADOWS
					o.shadowCoord = GetShadowCoord(vertexInput);
				#endif
				return o;
			}

			half4 frag ( VertexOutput IN  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				float3 WorldSpaceNormal = normalize(float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z));
				float3 WorldSpaceTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				float3 WorldSpaceBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				float3 WorldSpacePosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldSpaceViewDirection = _WorldSpaceCameraPos.xyz  - WorldSpacePosition;
	
				#if SHADER_HINT_NICE_QUALITY
					WorldSpaceViewDirection = SafeNormalize( WorldSpaceViewDirection );
				#endif

				float2 temp_cast_0 = (_EyeSize).xx;
				float2 temp_cast_1 = (( ( 1.0 - _EyeSize ) / 2.0 )).xx;
				float2 uv0264 = IN.ase_texcoord7.xy * temp_cast_0 + temp_cast_1;
				float4 tex2DNode166 = tex2D( _EyeExtras, uv0264 );
				float temp_output_151_0 = ( 100.0 - _PupilSize );
				float2 appendResult149 = (float2(( temp_output_151_0 / 2.0 ) , ( temp_output_151_0 / ( _PupilHeight1Width1 * 2.0 ) )));
				float4 appendResult152 = (float4(temp_output_151_0 , ( temp_output_151_0 / _PupilHeight1Width1 ) , 0.0 , 0.0));
				float3 tanToWorld0 = float3( WorldSpaceTangent.x, WorldSpaceBiTangent.x, WorldSpaceNormal.x );
				float3 tanToWorld1 = float3( WorldSpaceTangent.y, WorldSpaceBiTangent.y, WorldSpaceNormal.y );
				float3 tanToWorld2 = float3( WorldSpaceTangent.z, WorldSpaceBiTangent.z, WorldSpaceNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * WorldSpaceViewDirection.x + tanToWorld1 * WorldSpaceViewDirection.y  + tanToWorld2 * WorldSpaceViewDirection.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset255 = ParallaxOffset( _ParalaxH , _PupilParallaxHeight , ase_tanViewDir );
				float2 uv0147 = IN.ase_texcoord7.xy * appendResult152.xy + paralaxOffset255;
				float clampResult122 = clamp( ( pow( distance( appendResult149 , uv0147 ) , ( _PupilSharpness * 7.0 ) ) + ( 1.0 - tex2DNode166.b ) ) , 0.0 , 1.0 );
				float dotResult226 = dot( reflect( _MainLightPosition.xyz , WorldSpaceViewDirection ) , IN.ase_normal );
				float clampResult229 = clamp( (dotResult226*_CausticScale + _CausticOffset) , 0.0 , 1.0 );
				float clampResult232 = clamp( ( _CausticPower * clampResult229 ) , 0.0 , 1.0 );
				float4 lerpResult291 = lerp( ( clampResult232 * _IrisColorCausticLerpA ) , _IrisColorCausticLerpA , _IrisColorCausticLerpA.a);
				float4 lerpResult127 = lerp( _EyeBallColorGlossA , ( tex2DNode166.b * lerpResult291 ) , tex2DNode166.b);
				float4 lerpResult184 = lerp( lerpResult127 , ( _RingColorAmount * tex2DNode166.r ) , ( _RingColorAmount.a * tex2DNode166.r ));
				float4 color170 = IsGammaSpace() ? float4(0.375,0,0,0) : float4(0.1160161,0,0,0);
				float4 lerpResult177 = lerp( lerpResult184 , ( color170 * tex2DNode166.g ) , ( _Veins * tex2DNode166.g ));
				float2 temp_cast_3 = (_IrisSize).xx;
				float2 uv0190 = IN.ase_texcoord7.xy * temp_cast_3 + ( ( paralaxOffset255 * float2( 0.1,0.1 ) ) + ( ( 1.0 - _IrisSize ) / 2.0 ) );
				float4 tex2DNode185 = tex2D( _IrisExtraDetail, uv0190 );
				float4 temp_output_212_0 = ( tex2DNode185 * ( _IrisExtraColorAmountA.a * 2.0 ) * tex2DNode166.b );
				float4 lerpResult211 = lerp( lerpResult177 , ( ( tex2DNode185 * _IrisExtraColorAmountA ) + ( temp_output_212_0 * clampResult232 ) ) , temp_output_212_0);
				float4 temp_output_103_0 = ( clampResult122 * lerpResult184 * lerpResult211 );
				float4 temp_output_216_0 = ( _BoostEyeWhite * ( 1.0 - tex2DNode166.b ) * temp_output_103_0 );
				
				float3 lerpResult139 = lerp( float3(0,0,1) , UnpackNormalScale( tex2D( _NormalMapBase, uv0264 ), 1.0f ) , _LensPush);
				
				float4 clampResult51 = clamp( ( tex2DNode166.b * clampResult232 * float4( _MainLightColor.rgb , 0.0 ) * _MainLightColor.a * temp_output_103_0 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 lerpResult160 = lerp( clampResult51 , ( _IrisGlow * temp_output_103_0 * pow( tex2DNode166.b , 3.0 ) ) , ( _IrisGlow / 10.0 ));
				
				float lerpResult135 = lerp( _EyeBallColorGlossA.a , ( tex2DNode166.b * _LensGloss ) , tex2DNode166.b);
				
				float3 Albedo = temp_output_216_0.rgb;
				float3 Normal = lerpResult139;
				float3 Emission = ( ( temp_output_216_0 + lerpResult160 ) * _GlobalEmissive ).rgb;
				float3 Specular = 0.5;
				float Metallic = 0;
				float Smoothness = lerpResult135;
				float Occlusion = 1;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float3 BakedGI = 0;

				InputData inputData;
				inputData.positionWS = WorldSpacePosition;

				#ifdef _NORMALMAP
					inputData.normalWS = normalize(TransformTangentToWorld(Normal, half3x3(WorldSpaceTangent, WorldSpaceBiTangent, WorldSpaceNormal)));
				#else
					#if !SHADER_HINT_NICE_QUALITY
						inputData.normalWS = WorldSpaceNormal;
					#else
						inputData.normalWS = normalize(WorldSpaceNormal);
					#endif
				#endif

				inputData.viewDirectionWS = WorldSpaceViewDirection;
				inputData.shadowCoord = IN.shadowCoord;

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, IN.lightmapUVOrVertexSH.xyz, inputData.normalWS );
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

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif
				
				#if _AlphaClip
					clip(Alpha - AlphaClipThreshold);
				#endif
				
				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
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

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define ASE_SRP_VERSION 70106

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex ShadowPassVertex
			#pragma fragment ShadowPassFragment


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

			CBUFFER_START( UnityPerMaterial )
			float _BoostEyeWhite;
			float _EyeSize;
			half _PupilSize;
			float _PupilHeight1Width1;
			float _ParalaxH;
			float _PupilParallaxHeight;
			float _PupilSharpness;
			float4 _EyeBallColorGlossA;
			float _CausticPower;
			float _CausticScale;
			float _CausticOffset;
			float4 _IrisColorCausticLerpA;
			float4 _RingColorAmount;
			float _Veins;
			float _IrisSize;
			float4 _IrisExtraColorAmountA;
			float _LensPush;
			float _IrisGlow;
			float _GlobalEmissive;
			float _LensGloss;
			CBUFFER_END


			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			
			float3 _LightDirection;

			VertexOutput ShadowPassVertex( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				
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

				float3 positionWS = TransformObjectToWorld(v.vertex.xyz);
				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

				float4 clipPos = TransformWorldToHClip( ApplyShadowBias( positionWS, normalWS, _LightDirection ) );

				#if UNITY_REVERSED_Z
					clipPos.z = min(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#else
					clipPos.z = max(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#endif
				o.clipPos = clipPos;

				return o;
			}

			half4 ShadowPassFragment(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );

				
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#if _AlphaClip
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
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define ASE_SRP_VERSION 70106

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			

			CBUFFER_START( UnityPerMaterial )
			float _BoostEyeWhite;
			float _EyeSize;
			half _PupilSize;
			float _PupilHeight1Width1;
			float _ParalaxH;
			float _PupilParallaxHeight;
			float _PupilSharpness;
			float4 _EyeBallColorGlossA;
			float _CausticPower;
			float _CausticScale;
			float _CausticOffset;
			float4 _IrisColorCausticLerpA;
			float4 _RingColorAmount;
			float _Veins;
			float _IrisSize;
			float4 _IrisExtraColorAmountA;
			float _LensPush;
			float _IrisGlow;
			float _GlobalEmissive;
			float _LensGloss;
			CBUFFER_END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			
			VertexOutput vert( VertexInput v  )
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

				o.clipPos = TransformObjectToHClip(v.vertex.xyz);
				return o;
			}

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#if _AlphaClip
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
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define ASE_SRP_VERSION 70106

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			

			sampler2D _EyeExtras;
			sampler2D _IrisExtraDetail;
			CBUFFER_START( UnityPerMaterial )
			float _BoostEyeWhite;
			float _EyeSize;
			half _PupilSize;
			float _PupilHeight1Width1;
			float _ParalaxH;
			float _PupilParallaxHeight;
			float _PupilSharpness;
			float4 _EyeBallColorGlossA;
			float _CausticPower;
			float _CausticScale;
			float _CausticOffset;
			float4 _IrisColorCausticLerpA;
			float4 _RingColorAmount;
			float _Veins;
			float _IrisSize;
			float4 _IrisExtraColorAmountA;
			float _LensPush;
			float _IrisGlow;
			float _GlobalEmissive;
			float _LensGloss;
			CBUFFER_END


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
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			

			VertexOutput vert( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord1.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord3.xyz = ase_worldBitangent;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				o.ase_texcoord4.xyz = ase_worldPos;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_normal = v.ase_normal;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				
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

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );
				return o;
			}

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				float2 temp_cast_0 = (_EyeSize).xx;
				float2 temp_cast_1 = (( ( 1.0 - _EyeSize ) / 2.0 )).xx;
				float2 uv0264 = IN.ase_texcoord.xy * temp_cast_0 + temp_cast_1;
				float4 tex2DNode166 = tex2D( _EyeExtras, uv0264 );
				float temp_output_151_0 = ( 100.0 - _PupilSize );
				float2 appendResult149 = (float2(( temp_output_151_0 / 2.0 ) , ( temp_output_151_0 / ( _PupilHeight1Width1 * 2.0 ) )));
				float4 appendResult152 = (float4(temp_output_151_0 , ( temp_output_151_0 / _PupilHeight1Width1 ) , 0.0 , 0.0));
				float3 ase_worldTangent = IN.ase_texcoord1.xyz;
				float3 ase_worldNormal = IN.ase_texcoord2.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord3.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldPos = IN.ase_texcoord4.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset255 = ParallaxOffset( _ParalaxH , _PupilParallaxHeight , ase_tanViewDir );
				float2 uv0147 = IN.ase_texcoord.xy * appendResult152.xy + paralaxOffset255;
				float clampResult122 = clamp( ( pow( distance( appendResult149 , uv0147 ) , ( _PupilSharpness * 7.0 ) ) + ( 1.0 - tex2DNode166.b ) ) , 0.0 , 1.0 );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult226 = dot( reflect( _MainLightPosition.xyz , ase_worldViewDir ) , IN.ase_normal );
				float clampResult229 = clamp( (dotResult226*_CausticScale + _CausticOffset) , 0.0 , 1.0 );
				float clampResult232 = clamp( ( _CausticPower * clampResult229 ) , 0.0 , 1.0 );
				float4 lerpResult291 = lerp( ( clampResult232 * _IrisColorCausticLerpA ) , _IrisColorCausticLerpA , _IrisColorCausticLerpA.a);
				float4 lerpResult127 = lerp( _EyeBallColorGlossA , ( tex2DNode166.b * lerpResult291 ) , tex2DNode166.b);
				float4 lerpResult184 = lerp( lerpResult127 , ( _RingColorAmount * tex2DNode166.r ) , ( _RingColorAmount.a * tex2DNode166.r ));
				float4 color170 = IsGammaSpace() ? float4(0.375,0,0,0) : float4(0.1160161,0,0,0);
				float4 lerpResult177 = lerp( lerpResult184 , ( color170 * tex2DNode166.g ) , ( _Veins * tex2DNode166.g ));
				float2 temp_cast_3 = (_IrisSize).xx;
				float2 uv0190 = IN.ase_texcoord.xy * temp_cast_3 + ( ( paralaxOffset255 * float2( 0.1,0.1 ) ) + ( ( 1.0 - _IrisSize ) / 2.0 ) );
				float4 tex2DNode185 = tex2D( _IrisExtraDetail, uv0190 );
				float4 temp_output_212_0 = ( tex2DNode185 * ( _IrisExtraColorAmountA.a * 2.0 ) * tex2DNode166.b );
				float4 lerpResult211 = lerp( lerpResult177 , ( ( tex2DNode185 * _IrisExtraColorAmountA ) + ( temp_output_212_0 * clampResult232 ) ) , temp_output_212_0);
				float4 temp_output_103_0 = ( clampResult122 * lerpResult184 * lerpResult211 );
				float4 temp_output_216_0 = ( _BoostEyeWhite * ( 1.0 - tex2DNode166.b ) * temp_output_103_0 );
				
				float4 clampResult51 = clamp( ( tex2DNode166.b * clampResult232 * float4( _MainLightColor.rgb , 0.0 ) * _MainLightColor.a * temp_output_103_0 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 lerpResult160 = lerp( clampResult51 , ( _IrisGlow * temp_output_103_0 * pow( tex2DNode166.b , 3.0 ) ) , ( _IrisGlow / 10.0 ));
				
				
				float3 Albedo = temp_output_216_0.rgb;
				float3 Emission = ( ( temp_output_216_0 + lerpResult160 ) * _GlobalEmissive ).rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#if _AlphaClip
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

			Blend One Zero , One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define ASE_SRP_VERSION 70106

			#pragma enable_d3d11_debug_symbols
			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			

			sampler2D _EyeExtras;
			sampler2D _IrisExtraDetail;
			CBUFFER_START( UnityPerMaterial )
			float _BoostEyeWhite;
			float _EyeSize;
			half _PupilSize;
			float _PupilHeight1Width1;
			float _ParalaxH;
			float _PupilParallaxHeight;
			float _PupilSharpness;
			float4 _EyeBallColorGlossA;
			float _CausticPower;
			float _CausticScale;
			float _CausticOffset;
			float4 _IrisColorCausticLerpA;
			float4 _RingColorAmount;
			float _Veins;
			float _IrisSize;
			float4 _IrisExtraColorAmountA;
			float _LensPush;
			float _IrisGlow;
			float _GlobalEmissive;
			float _LensGloss;
			CBUFFER_END


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float3 ase_normal : NORMAL;
			};

			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			

			VertexOutput vert( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;

				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord1.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord3.xyz = ase_worldBitangent;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				o.ase_texcoord4.xyz = ase_worldPos;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_normal = v.ase_normal;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				
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

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.vertex.xyz );
				o.clipPos = vertexInput.positionCS;
				return o;
			}

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				float2 temp_cast_0 = (_EyeSize).xx;
				float2 temp_cast_1 = (( ( 1.0 - _EyeSize ) / 2.0 )).xx;
				float2 uv0264 = IN.ase_texcoord.xy * temp_cast_0 + temp_cast_1;
				float4 tex2DNode166 = tex2D( _EyeExtras, uv0264 );
				float temp_output_151_0 = ( 100.0 - _PupilSize );
				float2 appendResult149 = (float2(( temp_output_151_0 / 2.0 ) , ( temp_output_151_0 / ( _PupilHeight1Width1 * 2.0 ) )));
				float4 appendResult152 = (float4(temp_output_151_0 , ( temp_output_151_0 / _PupilHeight1Width1 ) , 0.0 , 0.0));
				float3 ase_worldTangent = IN.ase_texcoord1.xyz;
				float3 ase_worldNormal = IN.ase_texcoord2.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord3.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldPos = IN.ase_texcoord4.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset255 = ParallaxOffset( _ParalaxH , _PupilParallaxHeight , ase_tanViewDir );
				float2 uv0147 = IN.ase_texcoord.xy * appendResult152.xy + paralaxOffset255;
				float clampResult122 = clamp( ( pow( distance( appendResult149 , uv0147 ) , ( _PupilSharpness * 7.0 ) ) + ( 1.0 - tex2DNode166.b ) ) , 0.0 , 1.0 );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult226 = dot( reflect( _MainLightPosition.xyz , ase_worldViewDir ) , IN.ase_normal );
				float clampResult229 = clamp( (dotResult226*_CausticScale + _CausticOffset) , 0.0 , 1.0 );
				float clampResult232 = clamp( ( _CausticPower * clampResult229 ) , 0.0 , 1.0 );
				float4 lerpResult291 = lerp( ( clampResult232 * _IrisColorCausticLerpA ) , _IrisColorCausticLerpA , _IrisColorCausticLerpA.a);
				float4 lerpResult127 = lerp( _EyeBallColorGlossA , ( tex2DNode166.b * lerpResult291 ) , tex2DNode166.b);
				float4 lerpResult184 = lerp( lerpResult127 , ( _RingColorAmount * tex2DNode166.r ) , ( _RingColorAmount.a * tex2DNode166.r ));
				float4 color170 = IsGammaSpace() ? float4(0.375,0,0,0) : float4(0.1160161,0,0,0);
				float4 lerpResult177 = lerp( lerpResult184 , ( color170 * tex2DNode166.g ) , ( _Veins * tex2DNode166.g ));
				float2 temp_cast_3 = (_IrisSize).xx;
				float2 uv0190 = IN.ase_texcoord.xy * temp_cast_3 + ( ( paralaxOffset255 * float2( 0.1,0.1 ) ) + ( ( 1.0 - _IrisSize ) / 2.0 ) );
				float4 tex2DNode185 = tex2D( _IrisExtraDetail, uv0190 );
				float4 temp_output_212_0 = ( tex2DNode185 * ( _IrisExtraColorAmountA.a * 2.0 ) * tex2DNode166.b );
				float4 lerpResult211 = lerp( lerpResult177 , ( ( tex2DNode185 * _IrisExtraColorAmountA ) + ( temp_output_212_0 * clampResult232 ) ) , temp_output_212_0);
				float4 temp_output_103_0 = ( clampResult122 * lerpResult184 * lerpResult211 );
				float4 temp_output_216_0 = ( _BoostEyeWhite * ( 1.0 - tex2DNode166.b ) * temp_output_103_0 );
				
				
				float3 Albedo = temp_output_216_0.rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				half4 color = half4( Albedo, Alpha );

				#if _AlphaClip
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}
		
	}
	//CustomEditor "UnityEditor.ShaderGraph.PBRMasterGUI"
	Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=17500
1927;7;1906;1015;-1813.203;1656.085;2.345302;True;True
Node;AmplifyShaderEditor.CommentaryNode;219;-456.8235,203.5645;Inherit;False;2546.831;732.6423;IrisConeCaustics;15;232;231;229;227;226;225;224;223;220;50;290;291;221;222;126;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;221;-422.1765,429.9774;Float;True;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;220;-425.0949,270.5084;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ReflectOpNode;223;-79.0856,298.3011;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalVertexDataNode;222;-393.1745,669.2433;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DotProductOpNode;226;184.3642,360.0952;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;225;-5.398302,587.6693;Float;False;Property;_CausticScale;CausticScale;21;0;Create;True;0;0;False;0;1;2.5;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;224;4.006065,718.6566;Float;False;Property;_CausticOffset;CausticOffset;20;0;Create;True;0;0;False;0;1;2.18;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;227;368.1605,488.9672;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1.54;False;2;FLOAT;1.62;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;298;-205.7515,-1779.411;Inherit;False;1316.846;355.723;Parralax;4;257;256;259;255;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;168;463.7572,-851.6978;Inherit;False;803.1489;1005.685;Inputs;9;133;158;20;170;179;182;183;247;249;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;299;-1235.127,-257.868;Inherit;False;1546.065;389.3438;Size and RGB control;5;266;265;264;166;267;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;267;-1185.127,-207.868;Float;False;Property;_EyeSize;EyeSize;14;0;Create;True;0;0;False;0;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;50;980.6463,470.0244;Float;False;Property;_CausticPower;CausticPower;19;0;Create;True;0;0;False;0;0.3;2.24;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;229;754.3712,495.7002;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;256;-155.7515,-1607.688;Float;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;257;481.1172,-1647.115;Float;False;Property;_PupilParallaxHeight;PupilParallaxHeight;28;0;Create;True;0;0;False;0;1.4;0;-4;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;247;486.2794,-246.3401;Float;False;Property;_IrisSize;IrisSize;15;0;Create;True;0;0;False;0;1;5.75;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;164;379.8337,-1375.361;Inherit;False;2247.17;550.2261;Pupil;16;91;151;156;153;157;148;154;152;149;147;146;155;213;214;285;286;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;259;539.9,-1729.411;Float;False;Property;_ParalaxH;ParalaxH;29;0;Create;True;0;0;False;0;-0.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;218;1286.445,-840.8356;Inherit;False;1193.157;961.5587;IrisFunk;16;125;190;127;185;180;187;210;184;175;177;212;251;261;250;283;284;;1,1,1,1;0;0
Node;AmplifyShaderEditor.OneMinusNode;266;-890.6987,-66.62741;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;231;1360.488,253.4962;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;249;1000.997,-337.0559;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;91;429.8337,-1268.59;Half;False;Property;_PupilSize;PupilSize;22;0;Create;True;0;0;False;0;70;11.1;0.001;89;0;1;FLOAT;0
Node;AmplifyShaderEditor.ParallaxOffsetHlpNode;255;895.0944,-1641.001;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ClampOpNode;232;1605.908,348.4679;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;284;1392.947,-482.0075;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0.1,0.1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;156;446.8543,-987.0623;Float;False;Property;_PupilHeight1Width1;Pupil Height>1/Width<1;23;0;Create;True;0;0;False;0;1;6.21;0.01;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;250;1192.376,-329.3226;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;151;784.7245,-1289.568;Inherit;False;2;0;FLOAT;100;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;126;312.4452,261.8859;Float;False;Property;_IrisColorCausticLerpA;IrisColor-CausticLerp(A);11;0;Create;True;0;0;False;0;0.4482759,1,0,0;1,0.8068966,0,0.934;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;265;-662.8491,-72.2561;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;283;1375.066,-390.3073;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;153;1037.148,-1256.788;Inherit;False;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;264;-374.8492,-120.2561;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;6,6;False;1;FLOAT2;-2.5,-2.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;157;805.5457,-959.7744;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;290;1008.214,360.8691;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;154;1148.628,-958.1364;Inherit;False;2;0;FLOAT;2;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;152;1199.614,-1316.963;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SamplerNode;166;-10.0615,-98.52415;Inherit;True;Property;_EyeExtras;EyeExtras;7;1;[NoScaleOffset];Create;True;0;0;False;0;-1;d0431c3a16ed8b54c8d648bb79ca09a5;d0431c3a16ed8b54c8d648bb79ca09a5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;291;776.5474,239.524;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;148;1111.045,-1115.693;Inherit;False;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;190;1518.348,-321.9586;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;6,6;False;1;FLOAT2;-2.5,-2.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;187;1470.249,-97.25425;Float;False;Property;_IrisExtraColorAmountA;IrisExtraColor-Amount(A);12;0;Create;True;0;0;False;0;0.08088237,0.07573904,0.04698314,0.591;1,0.7993914,0.3676471,0.803;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;125;1294.371,-580.3928;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;251;1973.598,-8.451658;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;185;1762.989,-349.6219;Inherit;True;Property;_IrisExtraDetail;IrisExtraDetail;8;1;[NoScaleOffset];Create;True;0;0;False;0;-1;7b7c97e104d9817418725e17f5ca2659;7b7c97e104d9817418725e17f5ca2659;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;147;1446.926,-1352.734;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;213;1648.015,-962.9574;Float;False;Property;_PupilSharpness;PupilSharpness;24;0;Create;True;0;0;False;0;5;0.43;0.1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;133;548.1866,-797.3047;Float;False;Property;_EyeBallColorGlossA;EyeBallColor-Gloss(A);10;0;Create;True;0;0;False;0;1,1,1,0.853;0.9287465,0.9779412,0.7550281,0.891;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;149;1384.686,-1059.491;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;182;841.4723,-756.5477;Float;False;Property;_RingColorAmount;RingColor-Amount;13;0;Create;True;0;0;False;0;0,0,0,0;0.7573529,0.1280817,0.1280817,0.684;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;261;1362.131,-706.0457;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;183;1159.741,-694.2678;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;179;763.1091,-175.6612;Float;False;Property;_Veins;Veins;25;0;Create;True;0;0;False;0;0;0.734;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;127;1541.502,-790.8356;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;212;2269.312,-104.9449;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;170;524.4473,-617.8412;Float;False;Constant;_EyeVeinColorAmountA;EyeVeinColor-Amount(A);12;0;Create;True;0;0;False;0;0.375,0,0,0;1,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;169;2513.791,-819.8705;Inherit;False;2125.866;921.7941;Mixing;16;159;160;161;51;18;26;134;135;103;181;215;217;211;246;245;216;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;214;1946.015,-953.9571;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;7;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;146;1746.54,-1220.662;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;175;1878.082,-587.0409;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;155;2066.258,-1227.059;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;12;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;210;2150.731,-383.4299;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;180;1882.64,-481.08;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;184;1859.063,-780.4681;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;285;2333.083,-909.7061;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;246;2547.968,-408.5809;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;177;2241.192,-641.3635;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;245;2747.727,-569.4694;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;286;2508.24,-1109.957;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;211;3019.525,-652.8688;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;122;2714.136,-951.641;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;103;3378.247,-731.1182;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;215;3667.23,-740.4073;Float;False;Property;_BoostEyeWhite;BoostEyeWhite;26;0;Create;True;0;0;False;0;1;1.01;1;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;217;3740.518,-592.8753;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;167;3144.018,-1401.414;Inherit;False;836.5276;442.498;FakewLens;4;138;141;139;140;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;216;4377.033,-700.0588;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;181;3383.324,-399.1982;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;161;4083.307,-338.9263;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;51;4145.942,-161.2845;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LightColorNode;26;2615.167,-41.84431;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;159;4083.297,-474.6382;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;160;4433.033,-329.2557;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;20;824.8633,36.09259;Float;False;Property;_LensGloss;LensGloss;17;0;Create;True;0;0;False;0;0.98;0.652;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;134;3364.983,-282.8188;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;140;3533.887,-1351.414;Float;False;Constant;_Vector0;Vector 0;10;0;Create;True;0;0;False;0;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;158;803.1615,-84.68832;Float;False;Property;_IrisGlow;IrisGlow;16;0;Create;True;0;0;False;0;0;7.79;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;141;3194.092,-1079.333;Float;False;Property;_LensPush;LensPush;18;0;Create;True;0;0;False;0;0.64;0.426;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;252;4778.718,-346.1298;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;254;4657.472,-41.69465;Float;False;Property;_GlobalEmissive;GlobalEmissive;27;0;Create;True;0;0;False;0;0.5;0.1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;139;3796.54,-1114.917;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;135;3399.614,-182.554;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;253;5009.6,-183.0875;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;288;4746.598,50.94391;Float;False;Property;_SSS;SSS;30;0;Create;True;0;0;False;0;0;0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;3736.22,-91.6116;Inherit;False;5;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;138;3194.018,-1284.083;Inherit;True;Property;_NormalMapBase;NormalMapBase;9;1;[NoScaleOffset];Create;True;0;0;False;0;-1;8ee6d0418eaa08e40ad667b400177c1c;8ee6d0418eaa08e40ad667b400177c1c;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;301;5798.091,-204.7162;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;1;ShadowCaster;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;302;5798.091,-204.7162;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;2;DepthOnly;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;False;False;False;False;True;False;False;False;False;0;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;303;5798.091,-204.7162;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;3;Meta;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;False;False;False;True;2;False;-1;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;300;5798.091,-204.7162;Float;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;10;RRF_HumanShaders/EyeShaders/EyeShader_Model1;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;0;Forward;12;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;0;Hidden/InternalErrorShader;0;0;Standard;12;Workflow;1;Surface;0;  Blend;0;Two Sided;1;Cast Shadows;1;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;Meta Pass;1;Override Baked GI;0;Vertex Position,InvertActionOnDeselection;1;0;5;True;True;True;True;True;False;;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;304;5798.091,-204.7162;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;4;Universal2D;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;True;True;True;True;True;0;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
WireConnection;223;0;220;0
WireConnection;223;1;221;0
WireConnection;226;0;223;0
WireConnection;226;1;222;0
WireConnection;227;0;226;0
WireConnection;227;1;225;0
WireConnection;227;2;224;0
WireConnection;229;0;227;0
WireConnection;266;0;267;0
WireConnection;231;0;50;0
WireConnection;231;1;229;0
WireConnection;249;0;247;0
WireConnection;255;0;259;0
WireConnection;255;1;257;0
WireConnection;255;2;256;0
WireConnection;232;0;231;0
WireConnection;284;0;255;0
WireConnection;250;0;249;0
WireConnection;151;1;91;0
WireConnection;265;0;266;0
WireConnection;283;0;284;0
WireConnection;283;1;250;0
WireConnection;153;0;151;0
WireConnection;153;1;156;0
WireConnection;264;0;267;0
WireConnection;264;1;265;0
WireConnection;157;0;156;0
WireConnection;290;0;232;0
WireConnection;290;1;126;0
WireConnection;154;0;151;0
WireConnection;154;1;157;0
WireConnection;152;0;151;0
WireConnection;152;1;153;0
WireConnection;166;1;264;0
WireConnection;291;0;290;0
WireConnection;291;1;126;0
WireConnection;291;2;126;4
WireConnection;148;0;151;0
WireConnection;190;0;247;0
WireConnection;190;1;283;0
WireConnection;125;0;166;3
WireConnection;125;1;291;0
WireConnection;251;0;187;4
WireConnection;185;1;190;0
WireConnection;147;0;152;0
WireConnection;147;1;255;0
WireConnection;149;0;148;0
WireConnection;149;1;154;0
WireConnection;261;0;182;4
WireConnection;261;1;166;1
WireConnection;183;0;182;0
WireConnection;183;1;166;1
WireConnection;127;0;133;0
WireConnection;127;1;125;0
WireConnection;127;2;166;3
WireConnection;212;0;185;0
WireConnection;212;1;251;0
WireConnection;212;2;166;3
WireConnection;214;0;213;0
WireConnection;146;0;149;0
WireConnection;146;1;147;0
WireConnection;175;0;170;0
WireConnection;175;1;166;2
WireConnection;155;0;146;0
WireConnection;155;1;214;0
WireConnection;210;0;185;0
WireConnection;210;1;187;0
WireConnection;180;0;179;0
WireConnection;180;1;166;2
WireConnection;184;0;127;0
WireConnection;184;1;183;0
WireConnection;184;2;261;0
WireConnection;285;0;166;3
WireConnection;246;0;212;0
WireConnection;246;1;232;0
WireConnection;177;0;184;0
WireConnection;177;1;175;0
WireConnection;177;2;180;0
WireConnection;245;0;210;0
WireConnection;245;1;246;0
WireConnection;286;0;155;0
WireConnection;286;1;285;0
WireConnection;211;0;177;0
WireConnection;211;1;245;0
WireConnection;211;2;212;0
WireConnection;122;0;286;0
WireConnection;103;0;122;0
WireConnection;103;1;184;0
WireConnection;103;2;211;0
WireConnection;217;0;166;3
WireConnection;216;0;215;0
WireConnection;216;1;217;0
WireConnection;216;2;103;0
WireConnection;181;0;166;3
WireConnection;161;0;158;0
WireConnection;51;0;18;0
WireConnection;159;0;158;0
WireConnection;159;1;103;0
WireConnection;159;2;181;0
WireConnection;160;0;51;0
WireConnection;160;1;159;0
WireConnection;160;2;161;0
WireConnection;134;0;166;3
WireConnection;134;1;20;0
WireConnection;252;0;216;0
WireConnection;252;1;160;0
WireConnection;139;0;140;0
WireConnection;139;1;138;0
WireConnection;139;2;141;0
WireConnection;135;0;133;4
WireConnection;135;1;134;0
WireConnection;135;2;166;3
WireConnection;253;0;252;0
WireConnection;253;1;254;0
WireConnection;18;0;166;3
WireConnection;18;1;232;0
WireConnection;18;2;26;1
WireConnection;18;3;26;2
WireConnection;18;4;103;0
WireConnection;138;1;264;0
WireConnection;300;0;216;0
WireConnection;300;1;139;0
WireConnection;300;2;253;0
WireConnection;300;4;135;0
ASEEND*/
//CHKSM=13B11FD5CB1240549987287B5DE5A244F3303365