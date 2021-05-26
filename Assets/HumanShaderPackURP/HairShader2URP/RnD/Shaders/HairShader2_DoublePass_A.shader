// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "RRF_HumanShaders/HairShader2/RnD/HairShader2_DoublePass_A"
{
	Properties
	{
		_FirstPass_Color("FirstPass_Color", Color) = (0,0,0,0)
		_SecondPass_Color("SecondPass_Color", Color) = (0,0,0,0)
		_TextureTest2("TextureTest2", 2D) = "white" {}
		_TextureTest1("TextureTest1", 2D) = "white" {}
		_Bias("Bias", Range( 0 , 1)) = 0.2
		_Scale("Scale", Range( 0 , 1)) = 1
		_Vector0("Vector 0", Vector) = (0,0,0,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
	}
	
	SubShader
	{
		LOD 100
		GrabPass{ }

		Pass
		{
			Name "First"
			Tags { "RenderType"="TransparentCutout" }
			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend Off
			AlphaToMask On
			Cull Front
			ColorMask RGBA
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			

			struct appdata
			{
				float4 vertex : POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord : TEXCOORD0;
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
			};

			uniform float3 _Vector0;
			uniform sampler2D _GrabTexture;
			uniform float4 _FirstPass_Color;
			uniform float _Bias;
			uniform float _Scale;
			uniform sampler2D _TextureTest1;
			uniform float4 _TextureTest1_ST;
			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
			}
			
			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord = screenPos;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				
				v.vertex.xyz += _Vector0;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				fixed4 finalColor;
				float4 screenPos = i.ase_texcoord;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 screenColor28 = tex2Dproj( _GrabTexture, UNITY_PROJ_COORD( ase_grabScreenPos ) );
				float2 uv39 = i.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 uv_TextureTest1 = i.ase_texcoord1.xy * _TextureTest1_ST.xy + _TextureTest1_ST.zw;
				float4 lerpResult29 = lerp( screenColor28 , _FirstPass_Color , ( _FirstPass_Color.a * ( pow( ( ( uv39.y + _Bias ) * _Scale ) , 4.0 ) * tex2D( _TextureTest1, uv_TextureTest1 ) ) ));
				
				
				finalColor = lerpResult29;
				return finalColor;
			}
			ENDCG
		}

		GrabPass{ }

		Pass
		{
			Name "Second"
			Tags { "RenderType"="TransparentCutout" }
			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend Off
			AlphaToMask On
			Cull Back
			ColorMask RGBA
			ZWrite Off
			ZTest LEqual
			
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "AutoLight.cginc"


			struct appdata
			{
				float4 vertex : POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord2 : TEXCOORD2;
			};

			//This is a late directive
			
			uniform sampler2D _GrabTexture;
			uniform float4 _SecondPass_Color;
			uniform float _Bias;
			uniform float _Scale;
			uniform sampler2D _TextureTest2;
			uniform float4 _TextureTest2_ST;
			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
			}
			
			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord = screenPos;
				float3 ase_worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				o.ase_texcoord1.xyz = ase_worldPos;
				
				o.ase_normal = v.ase_normal;
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.zw = 0;
				
				v.vertex.xyz +=  float3(0,0,0) ;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				fixed4 finalColor;
				float4 screenPos = i.ase_texcoord;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 screenColor25 = tex2Dproj( _GrabTexture, UNITY_PROJ_COORD( ase_grabScreenPos ) );
				float3 ase_worldPos = i.ase_texcoord1.xyz;
				float3 worldSpaceLightDir = UnityWorldSpaceLightDir(ase_worldPos);
				float dotResult58 = dot( worldSpaceLightDir , -i.ase_normal );
				float clampResult59 = clamp( dotResult58 , 0.0 , 1.0 );
				float4 lerpResult63 = lerp( ( clampResult59 + _SecondPass_Color ) , _SecondPass_Color , 0.5);
				float2 uv30 = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 uv_TextureTest2 = i.ase_texcoord2.xy * _TextureTest2_ST.xy + _TextureTest2_ST.zw;
				float4 lerpResult26 = lerp( screenColor25 , lerpResult63 , ( _SecondPass_Color.a * ( pow( ( ( uv30.y + _Bias ) * _Scale ) , 4.0 ) * tex2D( _TextureTest2, uv_TextureTest2 ) ) ));
				
				
				finalColor = lerpResult26;
				return finalColor;
			}
			ENDCG
		}
	}
	//CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=16204
85;270;1272;773;2497.667;1212.834;2.360013;True;False
Node;AmplifyShaderEditor.CommentaryNode;54;-1720.055,129.6449;Float;False;787.215;393.9366;Light;5;59;58;57;56;55;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;35;-2729.664,264.17;Float;False;924.2474;353.1714;Gradient;3;30;33;34;;1,1,1,1;0;0
Node;AmplifyShaderEditor.NormalVertexDataNode;56;-1649.187,344.5815;Float;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;52;-3159.143,-99.55917;Float;False;Property;_Bias;Bias;4;0;Create;True;0;0;False;0;0.2;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;30;-2679.664,314.1701;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;51;-3154.814,-17.35028;Float;False;Property;_Scale;Scale;5;0;Create;True;0;0;False;0;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;57;-1416.013,353.9159;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;55;-1670.055,179.6449;Float;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode;33;-2357.339,363.7379;Float;True;ConstantBiasScale;-1;;1;63208df05c83e8e49a48ffbdce2e43a0;0;3;3;FLOAT;0;False;1;FLOAT;0.2;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;58;-1284.511,176.5782;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;34;-2066.418,364.3415;Float;True;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;41;-2107.155,649.0107;Float;True;Property;_TextureTest2;TextureTest2;2;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;59;-1089.281,174.6403;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;10;-962.8691,489.5685;Float;False;Property;_SecondPass_Color;SecondPass_Color;1;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;44;-1361.935,639.3528;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;62;-2817.031,-666.4122;Float;False;2670.48;751.3707;Render Backfaces;9;21;36;42;40;43;29;31;9;28;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;61;-524.1384,152.1753;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;64;-540.3556,244.9125;Float;False;Constant;_Float0;Float 0;6;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;36;-2767.031,-561.1845;Float;False;924.2474;353.1714;Gradient;3;39;38;37;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ScreenColorNode;25;-905.0046,292.5541;Float;False;Global;_GrabScreen1;Grab Screen 1;4;0;Create;True;0;0;True;0;Object;-1;False;False;1;0;FLOAT2;0,0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;21;-1759.705,-565.2139;Float;False;787.215;393.9366;Light;5;12;14;16;13;49;;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;63;-228.231,151.7785;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;45;-475.4485,608.5049;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;40;-1996.355,-145.0415;Float;True;Property;_TextureTest1;TextureTest1;3;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DotProductOpNode;13;-1324.161,-518.2806;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;-1262.65,-156.0671;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.NegateNode;16;-1455.663,-340.9429;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;65;-238.8969,-177.0354;Float;False;Property;_Vector0;Vector 0;6;0;Create;True;0;0;False;0;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ScreenColorNode;28;-881.9523,-616.4122;Float;False;Global;_GrabScreen0;Grab Screen 0;4;0;Create;True;0;0;False;0;Instance;25;False;False;1;0;FLOAT2;0,0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;37;-2103.783,-461.013;Float;True;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;43;-1732.206,-182.8784;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;14;-1688.837,-350.2773;Float;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;26;-11.98519,276.3583;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;9;-935.7476,-338.0582;Float;False;Property;_FirstPass_Color;FirstPass_Color;0;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;12;-1709.705,-515.2139;Float;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode;38;-2394.705,-461.6165;Float;True;ConstantBiasScale;-1;;2;63208df05c83e8e49a48ffbdce2e43a0;0;3;3;FLOAT;0;False;1;FLOAT;0.2;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-597.1418,-210.3702;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;39;-2717.03,-511.1844;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;49;-1148.915,-521.5652;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;29;-330.5503,-461.0291;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;7;398.8339,250.9851;Float;False;False;2;Float;ASEMaterialInspector;0;9;ASESampleTemplates/DoublePassUnlit;003dfa9c16768d048b74f75c088119d8;0;1;Second;2;False;False;False;False;False;False;False;False;False;False;False;0;True;0;5;False;-1;10;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;True;True;True;0;False;-1;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;3;False;-1;True;False;-50;False;-1;0;False;-1;True;1;RenderType=TransparentCutout=RenderType;True;2;0;;0;0;Standard;0;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;6;-20.55324,-454.6101;Float;False;True;2;Float;ASEMaterialInspector;0;9;RRF_HumanShaders/HairShader2/RnD/HairShader2_DoublePass_A;003dfa9c16768d048b74f75c088119d8;0;0;First;2;False;False;False;False;False;False;False;False;False;False;False;0;True;0;5;False;-1;10;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;True;True;True;1;False;-1;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;RenderType=TransparentCutout=RenderType;True;2;0;;0;0;Standard;0;0;2;True;True;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;0
WireConnection;57;0;56;0
WireConnection;33;3;30;2
WireConnection;33;1;52;0
WireConnection;33;2;51;0
WireConnection;58;0;55;0
WireConnection;58;1;57;0
WireConnection;34;0;33;0
WireConnection;59;0;58;0
WireConnection;44;0;34;0
WireConnection;44;1;41;0
WireConnection;61;0;59;0
WireConnection;61;1;10;0
WireConnection;63;0;61;0
WireConnection;63;1;10;0
WireConnection;63;2;64;0
WireConnection;45;0;10;4
WireConnection;45;1;44;0
WireConnection;13;0;12;0
WireConnection;13;1;16;0
WireConnection;42;0;43;0
WireConnection;42;1;40;0
WireConnection;16;0;14;0
WireConnection;37;0;38;0
WireConnection;43;0;37;0
WireConnection;26;0;25;0
WireConnection;26;1;63;0
WireConnection;26;2;45;0
WireConnection;38;3;39;2
WireConnection;38;1;52;0
WireConnection;38;2;51;0
WireConnection;31;0;9;4
WireConnection;31;1;42;0
WireConnection;49;0;13;0
WireConnection;29;0;28;0
WireConnection;29;1;9;0
WireConnection;29;2;31;0
WireConnection;7;0;26;0
WireConnection;6;0;29;0
WireConnection;6;1;65;0
ASEEND*/
//CHKSM=B39E799BEA7C1F9CB6F5BED5271E0C9E83AE4092