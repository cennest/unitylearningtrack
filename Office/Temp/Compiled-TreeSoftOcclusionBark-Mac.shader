// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 6.4KB

Shader "Nature/Tree Soft Occlusion Bark" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,0)
 _MainTex ("Main Texture", 2D) = "white" {}
 _BaseLight ("Base Light", Range(0,1)) = 0.35
 _AO ("Amb. Occlusion", Range(0,10)) = 2.4
 _Scale ("Scale", Vector) = (1,1,1,1)
 _SquashAmount ("Squash", Float) = 1
}
SubShader { 
 Tags { "IGNOREPROJECTOR"="true" "RenderType"="TreeOpaque" }
 Pass {
  Tags { "IGNOREPROJECTOR"="true" "RenderType"="TreeOpaque" }
  Lighting On
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [_TerrainEngineBendTree]
Matrix 13 [_CameraToWorld]
Vector 6 [unity_LightColor0]
Vector 7 [unity_LightColor1]
Vector 8 [unity_LightColor2]
Vector 21 [unity_LightColor3]
Vector 22 [unity_LightPosition0]
Vector 23 [unity_LightPosition1]
Vector 24 [unity_LightPosition2]
Vector 25 [unity_LightPosition3]
Vector 26 [unity_LightAtten0]
Vector 27 [unity_LightAtten1]
Vector 28 [unity_LightAtten2]
Vector 29 [unity_LightAtten3]
Vector 30 [_Scale]
Vector 31 [_SquashPlaneNormal]
Float 32 [_SquashAmount]
Float 33 [_AO]
Float 34 [_BaseLight]
Vector 35 [_Color]
"!!ARBvp1.0
PARAM c[36] = { { 0, 1 },
		state.lightmodel.ambient,
		state.matrix.modelview[0],
		program.local[6..16],
		state.matrix.mvp,
		program.local[21..35] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R0.xyz, vertex.position, c[30];
MOV R0.w, c[0].x;
MOV R1.w, c[0].y;
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
ADD R1.xyz, R1, -R0;
MAD R1.xyz, vertex.color.w, R1, R0;
DP3 R0.x, R1, c[31];
ADD R0.x, R0, c[31].w;
MUL R0.xyz, R0.x, c[31];
ADD R1.xyz, -R0, R1;
MAD R1.xyz, R0, c[32].x, R1;
DP4 R2.z, R1, c[4];
DP4 R2.x, R1, c[2];
DP4 R2.y, R1, c[3];
MAD R0.xyz, -R2, c[22].w, c[22];
MAD R3.xyz, -R2, c[24].w, c[24];
MOV R3.z, -R3;
DP3 R0.w, R3, R3;
RSQ R3.w, R0.w;
MOV R0.z, -R0;
DP3 R2.w, R0, R0;
MUL R4.xyz, R3.w, R3;
RSQ R4.w, R2.w;
MUL R3.xyz, R4.w, R0;
DP3 R0.z, R4, c[15];
DP3 R0.x, R4, c[13];
DP3 R0.y, R4, c[14];
DP3 R3.w, vertex.normal, R0;
DP3 R0.z, R3, c[15];
DP3 R0.y, R3, c[14];
DP3 R0.x, R3, c[13];
DP3 R0.x, vertex.normal, R0;
MAX R0.y, R0.x, c[0].x;
MUL R0.z, R2.w, c[26];
ADD R3.x, R0.z, c[0].y;
MUL R0.x, vertex.attrib[14].w, c[33];
ADD R2.w, R0.x, c[34].x;
MUL R4.x, R2.w, R0.y;
MAD R0.xyz, -R2, c[23].w, c[23];
MAD R2.xyz, -R2, c[25].w, c[25];
RCP R4.y, R3.x;
MOV R3.xy, R0;
MOV R3.z, -R0;
MUL R0.x, R4, R4.y;
DP3 R4.w, R3, R3;
RSQ R4.x, R4.w;
MUL R4.xyz, R4.x, R3;
MUL R0.xyz, R0.x, c[6];
ADD R3.xyz, R0, c[1];
DP3 R0.z, R4, c[15];
DP3 R0.y, R4, c[14];
DP3 R0.x, R4, c[13];
DP3 R0.x, vertex.normal, R0;
MUL R4.x, R4.w, c[27].z;
ADD R0.y, R4.x, c[0];
MAX R0.x, R0, c[0];
RCP R0.y, R0.y;
MUL R0.x, R2.w, R0;
MUL R0.x, R0, R0.y;
MAD R0.xyz, R0.x, c[7], R3;
MUL R0.w, R0, c[28].z;
ADD R3.y, R0.w, c[0];
MOV R2.z, -R2;
MAX R3.w, R3, c[0].x;
DP3 R0.w, R2, R2;
RCP R3.z, R3.y;
RSQ R3.y, R0.w;
MUL R2.xyz, R3.y, R2;
MUL R3.x, R2.w, R3.w;
MUL R3.x, R3, R3.z;
MAD R0.xyz, R3.x, c[8], R0;
DP3 R3.z, R2, c[15];
DP3 R3.y, R2, c[14];
DP3 R3.x, R2, c[13];
MUL R2.x, R0.w, c[29].z;
DP3 R0.w, vertex.normal, R3;
ADD R2.x, R2, c[0].y;
MAX R0.w, R0, c[0].x;
RCP R2.x, R2.x;
MUL R0.w, R0, R2;
MUL R0.w, R0, R2.x;
MAD R0.xyz, R0.w, c[21], R0;
MOV R0.w, c[0].y;
MUL result.color, R0, c[35];
DP4 result.position.w, R1, c[20];
DP4 result.position.z, R1, c[19];
DP4 result.position.y, R1, c[18];
DP4 result.position.x, R1, c[17];
MOV result.texcoord[0], vertex.texcoord[0];
END
# 91 instructions, 5 R-regs
"
}
}
Program "fp" {
SubProgram "opengl " {
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[1] = { { 2 } };
TEMP R0;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
MUL R0.xyz, R0, c[0].x;
MUL result.color.xyz, fragment.color.primary, R0;
MOV result.color.w, fragment.color.primary;
END
# 4 instructions, 1 R-regs
"
}
}
 }
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "IGNOREPROJECTOR"="true" "RenderType"="TreeOpaque" }
  Cull Off
  Fog { Mode Off }
  Offset 1, 1
Program "vp" {
SubProgram "opengl " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 5 [_TerrainEngineBendTree]
Vector 9 [unity_LightShadowBias]
Vector 10 [_Scale]
Vector 11 [_SquashPlaneNormal]
Float 12 [_SquashAmount]
"!!ARBvp1.0
PARAM c[13] = { { 0, 1 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.position, c[10];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
ADD R0.xyz, R0, -R1;
MAD R0.xyz, vertex.color.w, R0, R1;
DP3 R0.w, R0, c[11];
ADD R0.w, R0, c[11];
MUL R1.xyz, R0.w, c[11];
ADD R0.xyz, -R1, R0;
MAD R0.xyz, R1, c[12].x, R0;
MOV R0.w, c[0].y;
DP4 R1.x, R0, c[4];
DP4 R1.y, R0, c[3];
ADD R1.y, R1, c[9].x;
MAX R1.z, R1.y, -R1.x;
ADD R1.z, R1, -R1.y;
MAD result.position.z, R1, c[9].y, R1.y;
MOV result.position.w, R1.x;
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
END
# 22 instructions, 2 R-regs
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 5 [_Object2World]
Matrix 9 [_TerrainEngineBendTree]
Vector 13 [_LightPositionRange]
Vector 14 [_Scale]
Vector 15 [_SquashPlaneNormal]
Float 16 [_SquashAmount]
"!!ARBvp1.0
PARAM c[17] = { { 0, 1 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.position, c[14];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
ADD R0.xyz, R0, -R1;
MAD R1.xyz, vertex.color.w, R0, R1;
DP3 R0.x, R1, c[15];
ADD R0.x, R0, c[15].w;
MUL R0.xyz, R0.x, c[15];
ADD R1.xyz, -R0, R1;
MAD R1.xyz, R0, c[16].x, R1;
MOV R1.w, c[0].y;
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
ADD result.texcoord[0].xyz, R0, -c[13];
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
END
# 21 instructions, 2 R-regs
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "SHADOWS_DEPTH" }
"!!ARBfp1.0
PARAM c[1] = { { 0 } };
MOV result.color, c[0].x;
END
# 1 instructions, 0 R-regs
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_CUBE" }
Vector 0 [_LightPositionRange]
"!!ARBfp1.0
PARAM c[3] = { program.local[0],
		{ 1, 255, 65025, 16581375 },
		{ 0.99900001, 0.0039215689 } };
TEMP R0;
DP3 R0.x, fragment.texcoord[0], fragment.texcoord[0];
RSQ R0.x, R0.x;
RCP R0.x, R0.x;
MUL R0.x, R0, c[0].w;
MIN R0.x, R0, c[2];
MUL R0, R0.x, c[1];
FRC R0, R0;
MAD result.color, -R0.yzww, c[2].y, R0;
END
# 8 instructions, 1 R-regs
"
}
}
 }
}
Dependency "BillboardShader" = "Hidden/Nature/Tree Soft Occlusion Bark Rendertex"
Fallback Off
}