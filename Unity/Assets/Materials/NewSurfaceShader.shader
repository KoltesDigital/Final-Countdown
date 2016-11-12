// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:8430,x:33319,y:33150,varname:node_8430,prsc:2|diff-6114-OUT;n:type:ShaderForge.SFN_Color,id:8825,x:31750,y:32890,ptovrint:False,ptlb:node_8825,ptin:_node_8825,varname:node_8825,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2607591,c2:0.3311658,c3:0.6691177,c4:1;n:type:ShaderForge.SFN_Color,id:4864,x:31750,y:33060,ptovrint:False,ptlb:node_4864,ptin:_node_4864,varname:node_4864,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9338235,c2:0.06866351,c3:0.06866351,c4:1;n:type:ShaderForge.SFN_Color,id:4797,x:31750,y:33229,ptovrint:False,ptlb:node_4797,ptin:_node_4797,varname:node_4797,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2647059,c2:0.2647059,c3:0.2647059,c4:1;n:type:ShaderForge.SFN_Slider,id:2057,x:31750,y:33392,ptovrint:False,ptlb:node_2057,ptin:_node_2057,varname:node_2057,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Lerp,id:935,x:32320,y:33222,varname:node_935,prsc:2|A-4864-RGB,B-4797-RGB,T-2057-OUT;n:type:ShaderForge.SFN_Lerp,id:1480,x:32185,y:32950,varname:node_1480,prsc:2|A-8825-RGB,B-4864-RGB,T-2057-OUT;n:type:ShaderForge.SFN_Lerp,id:2048,x:32672,y:33140,varname:node_2048,prsc:2|A-1480-OUT,B-935-OUT,T-2057-OUT;n:type:ShaderForge.SFN_Blend,id:6114,x:33063,y:33122,varname:node_6114,prsc:2,blmd:10,clmp:True|SRC-8491-RGB,DST-2048-OUT;n:type:ShaderForge.SFN_Tex2d,id:8491,x:32778,y:32976,ptovrint:False,ptlb:node_8491,ptin:_node_8491,varname:node_8491,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:3f40087bcd968ee47a3c1af6d19e9333,ntxv:0,isnm:False;proporder:8825-4864-4797-2057-8491;pass:END;sub:END;*/

Shader "Custom/NewSurfaceShader" {
    Properties {
        _node_8825 ("node_8825", Color) = (0.2607591,0.3311658,0.6691177,1)
        _node_4864 ("node_4864", Color) = (0.9338235,0.06866351,0.06866351,1)
        _node_4797 ("node_4797", Color) = (0.2647059,0.2647059,0.2647059,1)
        _node_2057 ("node_2057", Range(0, 1)) = 0
        _node_8491 ("node_8491", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _node_8825;
            uniform float4 _node_4864;
            uniform float4 _node_4797;
            uniform float _node_2057;
            uniform sampler2D _node_8491; uniform float4 _node_8491_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _node_8491_var = tex2D(_node_8491,TRANSFORM_TEX(i.uv0, _node_8491));
                float3 diffuseColor = saturate(( lerp(lerp(_node_8825.rgb,_node_4864.rgb,_node_2057),lerp(_node_4864.rgb,_node_4797.rgb,_node_2057),_node_2057) > 0.5 ? (1.0-(1.0-2.0*(lerp(lerp(_node_8825.rgb,_node_4864.rgb,_node_2057),lerp(_node_4864.rgb,_node_4797.rgb,_node_2057),_node_2057)-0.5))*(1.0-_node_8491_var.rgb)) : (2.0*lerp(lerp(_node_8825.rgb,_node_4864.rgb,_node_2057),lerp(_node_4864.rgb,_node_4797.rgb,_node_2057),_node_2057)*_node_8491_var.rgb) ));
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _node_8825;
            uniform float4 _node_4864;
            uniform float4 _node_4797;
            uniform float _node_2057;
            uniform sampler2D _node_8491; uniform float4 _node_8491_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _node_8491_var = tex2D(_node_8491,TRANSFORM_TEX(i.uv0, _node_8491));
                float3 diffuseColor = saturate(( lerp(lerp(_node_8825.rgb,_node_4864.rgb,_node_2057),lerp(_node_4864.rgb,_node_4797.rgb,_node_2057),_node_2057) > 0.5 ? (1.0-(1.0-2.0*(lerp(lerp(_node_8825.rgb,_node_4864.rgb,_node_2057),lerp(_node_4864.rgb,_node_4797.rgb,_node_2057),_node_2057)-0.5))*(1.0-_node_8491_var.rgb)) : (2.0*lerp(lerp(_node_8825.rgb,_node_4864.rgb,_node_2057),lerp(_node_4864.rgb,_node_4797.rgb,_node_2057),_node_2057)*_node_8491_var.rgb) ));
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
