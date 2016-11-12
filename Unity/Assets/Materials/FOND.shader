// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:7339,x:32829,y:32669,varname:node_7339,prsc:2|diff-2808-OUT;n:type:ShaderForge.SFN_Tex2d,id:3998,x:32056,y:32446,ptovrint:False,ptlb:node_3998,ptin:_node_3998,varname:node_3998,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4d989bb4d91e0eb4ea2824665e58233f,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:9588,x:31623,y:33068,ptovrint:False,ptlb:node_9588,ptin:_node_9588,varname:node_9588,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4703951,max:1;n:type:ShaderForge.SFN_Blend,id:2808,x:32576,y:32693,varname:node_2808,prsc:2,blmd:10,clmp:True|SRC-3998-RGB,DST-2752-OUT;n:type:ShaderForge.SFN_Color,id:9688,x:31780,y:32577,ptovrint:False,ptlb:node_9688,ptin:_node_9688,varname:node_9688,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3543469,c2:0.456227,c3:0.8308824,c4:1;n:type:ShaderForge.SFN_Color,id:4960,x:31780,y:32731,ptovrint:False,ptlb:node_4960,ptin:_node_4960,varname:node_4960,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8382353,c2:0.2773573,c3:0.2773573,c4:1;n:type:ShaderForge.SFN_Color,id:1544,x:31780,y:32888,ptovrint:False,ptlb:node_1544,ptin:_node_1544,varname:node_1544,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1544118,c2:0.1544118,c3:0.1544118,c4:1;n:type:ShaderForge.SFN_Lerp,id:6136,x:32180,y:32646,varname:node_6136,prsc:2|A-9688-RGB,B-4960-RGB,T-9588-OUT;n:type:ShaderForge.SFN_Lerp,id:8666,x:32180,y:32809,varname:node_8666,prsc:2|A-4960-RGB,B-1544-RGB,T-9588-OUT;n:type:ShaderForge.SFN_Lerp,id:2752,x:32394,y:32754,varname:node_2752,prsc:2|A-6136-OUT,B-8666-OUT,T-9588-OUT;proporder:3998-9688-4960-9588-1544;pass:END;sub:END;*/

Shader "Custom/FOND" {
    Properties {
        _node_3998 ("node_3998", 2D) = "white" {}
        _node_9688 ("node_9688", Color) = (0.3543469,0.456227,0.8308824,1)
        _node_4960 ("node_4960", Color) = (0.8382353,0.2773573,0.2773573,1)
        _node_9588 ("node_9588", Range(0, 1)) = 0.4703951
        _node_1544 ("node_1544", Color) = (0.1544118,0.1544118,0.1544118,1)
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
            uniform sampler2D _node_3998; uniform float4 _node_3998_ST;
            uniform float _node_9588;
            uniform float4 _node_9688;
            uniform float4 _node_4960;
            uniform float4 _node_1544;
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
                float4 _node_3998_var = tex2D(_node_3998,TRANSFORM_TEX(i.uv0, _node_3998));
                float3 diffuseColor = saturate(( lerp(lerp(_node_9688.rgb,_node_4960.rgb,_node_9588),lerp(_node_4960.rgb,_node_1544.rgb,_node_9588),_node_9588) > 0.5 ? (1.0-(1.0-2.0*(lerp(lerp(_node_9688.rgb,_node_4960.rgb,_node_9588),lerp(_node_4960.rgb,_node_1544.rgb,_node_9588),_node_9588)-0.5))*(1.0-_node_3998_var.rgb)) : (2.0*lerp(lerp(_node_9688.rgb,_node_4960.rgb,_node_9588),lerp(_node_4960.rgb,_node_1544.rgb,_node_9588),_node_9588)*_node_3998_var.rgb) ));
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
            uniform sampler2D _node_3998; uniform float4 _node_3998_ST;
            uniform float _node_9588;
            uniform float4 _node_9688;
            uniform float4 _node_4960;
            uniform float4 _node_1544;
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
                float4 _node_3998_var = tex2D(_node_3998,TRANSFORM_TEX(i.uv0, _node_3998));
                float3 diffuseColor = saturate(( lerp(lerp(_node_9688.rgb,_node_4960.rgb,_node_9588),lerp(_node_4960.rgb,_node_1544.rgb,_node_9588),_node_9588) > 0.5 ? (1.0-(1.0-2.0*(lerp(lerp(_node_9688.rgb,_node_4960.rgb,_node_9588),lerp(_node_4960.rgb,_node_1544.rgb,_node_9588),_node_9588)-0.5))*(1.0-_node_3998_var.rgb)) : (2.0*lerp(lerp(_node_9688.rgb,_node_4960.rgb,_node_9588),lerp(_node_4960.rgb,_node_1544.rgb,_node_9588),_node_9588)*_node_3998_var.rgb) ));
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
