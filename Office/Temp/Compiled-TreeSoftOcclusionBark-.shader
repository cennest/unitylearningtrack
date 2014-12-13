// Compiled shader for all platforms, uncompressed size: 96.2KB

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
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_TerrainEngineBendTree]
Matrix 12 [_CameraToWorld]
Vector 16 [glstate_lightmodel_ambient]
Vector 17 [unity_LightColor0]
Vector 18 [unity_LightColor1]
Vector 19 [unity_LightColor2]
Vector 20 [unity_LightColor3]
Vector 21 [unity_LightPosition0]
Vector 22 [unity_LightPosition1]
Vector 23 [unity_LightPosition2]
Vector 24 [unity_LightPosition3]
Vector 25 [unity_LightAtten0]
Vector 26 [unity_LightAtten1]
Vector 27 [unity_LightAtten2]
Vector 28 [unity_LightAtten3]
Vector 29 [_Scale]
Vector 30 [_SquashPlaneNormal]
Float 31 [_SquashAmount]
Float 32 [_AO]
Float 33 [_BaseLight]
Vector 34 [_Color]
"vs_2_0
def c35, 0.00000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_color0 v3
dcl_texcoord0 v4
mul r0.xyz, v0, c29
mov r0.w, c35.x
mov r1.w, c35.y
dp4 r1.z, r0, c10
dp4 r1.x, r0, c8
dp4 r1.y, r0, c9
add r1.xyz, r1, -r0
mad r1.xyz, v3.w, r1, r0
dp3 r0.x, r1, c30
add r0.x, r0, c30.w
mul r0.xyz, r0.x, c30
add r1.xyz, -r0, r1
mad r1.xyz, r0, c31.x, r1
dp4 r2.z, r1, c2
dp4 r2.x, r1, c0
dp4 r2.y, r1, c1
mad r0.xyz, -r2, c21.w, c21
mad r3.xyz, -r2, c23.w, c23
mov r3.z, -r3
dp3 r0.w, r3, r3
rsq r3.w, r0.w
mov r0.z, -r0
dp3 r2.w, r0, r0
mul r4.xyz, r3.w, r3
rsq r4.w, r2.w
mul r3.xyz, r4.w, r0
dp3 r0.z, r4, c14
dp3 r0.x, r4, c12
dp3 r0.y, r4, c13
dp3 r3.w, v2, r0
dp3 r0.z, r3, c14
dp3 r0.y, r3, c13
dp3 r0.x, r3, c12
dp3 r0.x, v2, r0
max r0.y, r0.x, c35.x
mul r0.z, r2.w, c25
add r3.x, r0.z, c35.y
mul r0.x, v1.w, c32
add r2.w, r0.x, c33.x
mul r4.x, r2.w, r0.y
mad r0.xyz, -r2, c22.w, c22
mad r2.xyz, -r2, c24.w, c24
rcp r4.y, r3.x
mov r3.xy, r0
mov r3.z, -r0
mul r0.x, r4, r4.y
dp3 r4.w, r3, r3
rsq r4.x, r4.w
mul r4.xyz, r4.x, r3
mul r0.xyz, r0.x, c17
add r3.xyz, r0, c16
dp3 r0.z, r4, c14
dp3 r0.y, r4, c13
dp3 r0.x, r4, c12
dp3 r0.x, v2, r0
mul r4.x, r4.w, c26.z
add r0.y, r4.x, c35
max r0.x, r0, c35
rcp r0.y, r0.y
mul r0.x, r2.w, r0
mul r0.x, r0, r0.y
mad r0.xyz, r0.x, c18, r3
mul r0.w, r0, c27.z
add r3.y, r0.w, c35
mov r2.z, -r2
max r3.w, r3, c35.x
dp3 r0.w, r2, r2
rcp r3.z, r3.y
rsq r3.y, r0.w
mul r2.xyz, r3.y, r2
mul r3.x, r2.w, r3.w
mul r3.x, r3, r3.z
mad r0.xyz, r3.x, c19, r0
dp3 r3.z, r2, c14
dp3 r3.y, r2, c13
dp3 r3.x, r2, c12
mul r2.x, r0.w, c28.z
dp3 r0.w, v2, r3
add r2.x, r2, c35.y
max r0.w, r0, c35.x
rcp r2.x, r2.x
mul r0.w, r0, r2
mul r0.w, r0, r2.x
mad r0.xyz, r0.w, c20, r0
mov r0.w, c35.y
mul oD0, r0, c34
dp4 oPos.w, r1, c7
dp4 oPos.z, r1, c6
dp4 oPos.y, r1, c5
dp4 oPos.x, r1, c4
mov oT0, v4
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 80
Float 36 [_AO]
Float 40 [_BaseLight]
Vector 48 [_Color]
ConstBuffer "UnityLighting" 720
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 224 [unity_LightPosition0]
Vector 240 [unity_LightPosition1]
Vector 256 [unity_LightPosition2]
Vector 272 [unity_LightPosition3]
Vector 288 [unity_LightPosition4]
Vector 304 [unity_LightPosition5]
Vector 320 [unity_LightPosition6]
Vector 336 [unity_LightPosition7]
Vector 352 [unity_LightAtten0]
Vector 368 [unity_LightAtten1]
Vector 384 [unity_LightAtten2]
Vector 400 [unity_LightAtten3]
Vector 416 [unity_LightAtten4]
Vector 432 [unity_LightAtten5]
Vector 448 [unity_LightAtten6]
Vector 464 [unity_LightAtten7]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
ConstBuffer "UnityTerrain" 256
Matrix 96 [_TerrainEngineBendTree]
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
ConstBuffer "UnityPerCamera2" 64
Matrix 0 [_CameraToWorld]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityPerFrame" 3
BindCB  "UnityTerrain" 4
BindCB  "UnityPerCamera2" 5
"vs_4_0
eefiecednpakjcegbjbcngbbfgagedloilfcjlmlabaaaaaanmahaaaaadaaaaaa
cmaaaaaanmaaaaaafaabaaaaejfdeheokiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaaijaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaiaaaajbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaiaaaajoaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaaedepemepfcaafeeffiedepepfceeaaklepfdeheo
gmaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaagfaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcieagaaaaeaaaabaakbabaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaiaaaeegiocaaaabaaaaaablaaaaaa
fjaaaaaeegiocaaaacaaaaaaaiaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaa
fjaaaaaeegiocaaaaeaaaaaaamaaaaaafjaaaaaeegiocaaaafaaaaaaadaaaaaa
fpaaaaadhcbabaaaaaaaaaaafpaaaaadicbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaadicbabaaaadaaaaaafpaaaaadpcbabaaaaeaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagiaaaaacafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaaaaaaaaa
egiccaaaaeaaaaaaafaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaaeaaaaaaahaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaeaaaaaa
agaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaeaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegbcbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaa
egacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaapgbpbaaaadaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkiacaaaaeaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaeaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaafaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaeaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaagaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaegiccaaaacaaaaaaahaaaaaadiaaaaaipcaabaaaacaaaaaafgafbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaacaaaaaa
aaaaaaaipccabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
dcaaaaalbcaabaaaaaaaaaaabkiacaaaaaaaaaaaacaaaaaadkbabaaaabaaaaaa
ckiacaaaaaaaaaaaacaaaaaadgaaaaaghcaabaaaacaaaaaaegiccaaaadaaaaaa
aeaaaaaadgaaaaafccaabaaaaaaaaaaaabeaaaaaaaaaaaaadaaaaaabcbaaaaah
ecaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaeaaaaaaadaaaeadckaabaaa
aaaaaaaadcaaaabahcaabaaaadaaaaaaegacbaiaebaaaaaaabaaaaaapgipcaag
abaaaaaaaoaaaaaabkaabaaaaaaaaaaaegiccaagabaaaaaaaoaaaaaabkaabaaa
aaaaaaaadgaaaaagicaabaaaadaaaaaackaabaiaebaaaaaaadaaaaaabaaaaaah
ecaabaaaaaaaaaaaegadbaaaadaaaaaaegadbaaaadaaaaaaeeaaaaaficaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaa
egadbaaaadaaaaaadiaaaaaihcaabaaaaeaaaaaafgafbaaaadaaaaaaegiccaaa
afaaaaaaabaaaaaadcaaaaaklcaabaaaadaaaaaaegiicaaaafaaaaaaaaaaaaaa
agaabaaaadaaaaaaegaibaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaa
afaaaaaaacaaaaaakgakbaaaadaaaaaaegadbaaaadaaaaaadcaaaaamecaabaaa
aaaaaaaackaabaaaaaaaaaaackiacaagabaaaaaabgaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiadpaoaaaaakecaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpckaabaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaadaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaadkaabaaaaaaaaaaa
dcaaaaamhcaabaaaacaaaaaaegiccaagabaaaaaaagaaaaaabkaabaaaaaaaaaaa
kgakbaaaaaaaaaaaegacbaaaacaaaaaaboaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaabaaaaaabgaaaaabdgaaaaaficaabaaaacaaaaaaabeaaaaa
aaaaiadpdiaaaaaipccabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaaaaaaaaa
adaaaaaadgaaaaafpccabaaaabaaaaaaegbobaaaaeaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 80
Float 36 [_AO]
Float 40 [_BaseLight]
Vector 48 [_Color]
ConstBuffer "UnityLighting" 720
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 224 [unity_LightPosition0]
Vector 240 [unity_LightPosition1]
Vector 256 [unity_LightPosition2]
Vector 272 [unity_LightPosition3]
Vector 288 [unity_LightPosition4]
Vector 304 [unity_LightPosition5]
Vector 320 [unity_LightPosition6]
Vector 336 [unity_LightPosition7]
Vector 352 [unity_LightAtten0]
Vector 368 [unity_LightAtten1]
Vector 384 [unity_LightAtten2]
Vector 400 [unity_LightAtten3]
Vector 416 [unity_LightAtten4]
Vector 432 [unity_LightAtten5]
Vector 448 [unity_LightAtten6]
Vector 464 [unity_LightAtten7]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
ConstBuffer "UnityTerrain" 256
Matrix 96 [_TerrainEngineBendTree]
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
ConstBuffer "UnityPerCamera2" 64
Matrix 0 [_CameraToWorld]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityPerFrame" 3
BindCB  "UnityTerrain" 4
BindCB  "UnityPerCamera2" 5
"vs_4_0_level_9_1
eefiecedpngccnknffcfnhmafigfnmikhabpomliabaaaaaaheaoaaaaaeaaaaaa
daaaaaaameagaaaafaanaaaaaaaoaaaaebgpgodjimagaaaaimagaaaaaaacpopp
piafaaaajeaaaaaaajaaceaaaaaajaaaaaaajaaaaaaaceaaabaajaaaaaaaacaa
acaaabaaaaaaaaaaabaaagaaaeaaadaaaaaaaaaaabaaaoaaaeaaahaaaaaaaaaa
abaabgaaaeaaalaaaaaaaaaaacaaaaaaaiaaapaaaaaaaaaaadaaaeaaabaabhaa
aaaaaaaaaeaaafaaaeaabiaaaaaaaaaaaeaaakaaacaabmaaaaaaaaaaafaaaaaa
adaaboaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafcbaaapkaaaaaiadpaaaaaaaa
aaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaafaaaaadaaaaahiaaaaaoejabiaaoekaafaaaaadabaaahiaaaaaffia
bkaaoekaaeaaaaaeabaaahiabjaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahia
blaaoekaaaaakkiaabaaoeiaaeaaaaaeabaaahiaaaaaoejabiaaoekbabaaoeia
aeaaaaaeaaaaahiaadaappjaabaaoeiaaaaaoeiaaiaaaaadaaaaaiiabmaaoeka
aaaaoeiaacaaaaadaaaaaiiaaaaappiabmaappkaaeaaaaaeabaaahiaaaaappia
bmaaoekbaaaaoeiabcaaaaaeacaaahiabnaaaakaaaaaoeiaabaaoeiaafaaaaad
aaaaahiaacaaffiabeaaoekaaeaaaaaeaaaaahiabdaaoekaacaaaaiaaaaaoeia
aeaaaaaeaaaaahiabfaaoekaacaakkiaaaaaoeiaacaaaaadaaaaahiaaaaaoeia
bgaaoekaaeaaaaaeabaaahiaaaaaoeiaahaappkbahaaoekaabaaaaacabaaaiia
abaakkibaiaaaaadaaaaaiiaabaapeiaabaapeiaahaaaaacabaaaeiaaaaappia
abaaaaacadaaabiacbaaaakaaeaaaaaeaaaaaiiaaaaappiaalaakkkaadaaaaia
agaaaaacaaaaaiiaaaaappiaafaaaaadabaaahiaabaakkiaabaapeiaafaaaaad
adaaaoiaabaaffiabpaajakaaeaaaaaeabaaaliaboaakekaabaaaaiaadaaojia
aeaaaaaeabaaahiacaaaoekaabaakkiaabaapeiaaiaaaaadabaaabiaacaaoeja
abaaoeiaalaaaaadabaaabiaabaaaaiacbaaffkaaeaaaaaeabaaaciaabaaffka
abaappjaabaakkkaafaaaaadabaaabiaabaaffiaabaaaaiaafaaaaadaaaaaiia
aaaappiaabaaaaiaabaaaaacaeaaahiaadaaoekaaeaaaaaeabaaaniaaeaajeia
aaaappiabhaajekaaeaaaaaeaeaaahiaaaaaoeiaaiaappkbaiaaoekaabaaaaac
aeaaaiiaaeaakkibaiaaaaadaaaaaiiaaeaapeiaaeaapeiaahaaaaacacaaaiia
aaaappiaaeaaaaaeaaaaaiiaaaaappiaamaakkkaadaaaaiaagaaaaacaaaaaiia
aaaappiaafaaaaadadaaaoiaacaappiaaeaanaiaafaaaaadaeaaahiaadaakkia
bpaaoekaaeaaaaaeaeaaahiaboaaoekaadaaffiaaeaaoeiaaeaaaaaeadaaaoia
caaajakaadaappiaaeaajaiaaiaaaaadacaaaiiaacaaoejaadaapjiaalaaaaad
acaaaiiaacaappiacbaaffkaafaaaaadacaaaiiaabaaffiaacaappiaafaaaaad
aaaaaiiaaaaappiaacaappiaaeaaaaaeabaaaniaaeaajekaaaaappiaabaaoeia
aeaaaaaeaeaaahiaaaaaoeiaajaappkbajaaoekaaeaaaaaeaaaaahiaaaaaoeia
akaappkbakaaoekaabaaaaacaeaaaiiaaeaakkibaiaaaaadacaaaiiaaeaapeia
aeaapeiaahaaaaacadaaaciaacaappiaaeaaaaaeacaaaiiaacaappiaanaakkka
adaaaaiaagaaaaacacaaaiiaacaappiaafaaaaadadaaaoiaadaaffiaaeaanaia
afaaaaadaeaaahiaadaakkiabpaaoekaaeaaaaaeaeaaahiaboaaoekaadaaffia
aeaaoeiaaeaaaaaeadaaaoiacaaajakaadaappiaaeaajaiaaiaaaaadadaaacia
acaaoejaadaapjiaalaaaaadadaaaciaadaaffiacbaaffkaafaaaaadadaaacia
abaaffiaadaaffiaafaaaaadacaaaiiaacaappiaadaaffiaaeaaaaaeabaaania
afaajekaacaappiaabaaoeiaabaaaaacaaaaaiiaaaaakkibaiaaaaadaaaaaeia
aaaapeiaaaaapeiaahaaaaacacaaaiiaaaaakkiaaeaaaaaeaaaaaeiaaaaakkia
aoaakkkaadaaaaiaagaaaaacaaaaaeiaaaaakkiaafaaaaadaaaaaliaaaaaoeia
acaappiaafaaaaadadaaahiaaaaaffiabpaaoekaaeaaaaaeadaaahiaboaaoeka
aaaaaaiaadaaoeiaaeaaaaaeaaaaaliacaaakekaaaaappiaadaakeiaaiaaaaad
aaaaabiaacaaoejaaaaapeiaalaaaaadaaaaabiaaaaaaaiacbaaffkaafaaaaad
aaaaabiaabaaffiaaaaaaaiaafaaaaadaaaaabiaaaaakkiaaaaaaaiaaeaaaaae
aaaaahiaagaaoekaaaaaaaiaabaapiiaabaaaaacaaaaaiiacbaaaakaafaaaaad
abaaapoaaaaaoeiaacaaoekaafaaaaadaaaaapiaacaaffiabaaaoekaaeaaaaae
aaaaapiaapaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiabbaaoekaacaakkia
aaaaoeiaacaaaaadaaaaapiaaaaaoeiabcaaoekaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaapoaaeaaoeja
ppppaaaafdeieefcieagaaaaeaaaabaakbabaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafjaiaaaeegiocaaaabaaaaaablaaaaaafjaaaaaeegiocaaaacaaaaaa
aiaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaafjaaaaaeegiocaaaaeaaaaaa
amaaaaaafjaaaaaeegiocaaaafaaaaaaadaaaaaafpaaaaadhcbabaaaaaaaaaaa
fpaaaaadicbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaadicbabaaa
adaaaaaafpaaaaadpcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacafaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaeaaaaaaahaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaaeaaaaaaagaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaeaaaaaaaiaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegbcbaia
ebaaaaaaaaaaaaaaegiccaaaaeaaaaaaafaaaaaaegacbaaaabaaaaaadcaaaaaj
hcaabaaaaaaaaaaapgbpbaaaadaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaaiicaabaaaaaaaaaaaegiccaaaaeaaaaaaakaaaaaaegacbaaaaaaaaaaa
aaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaeaaaaaaakaaaaaa
dcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaaeaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaeaaaaaa
alaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaacaaaaaaafaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaacaaaaaaaeaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaagaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaacaaaaaa
ahaaaaaadiaaaaaipcaabaaaacaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaaipccabaaaaaaaaaaa
egaobaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaadcaaaaalbcaabaaaaaaaaaaa
bkiacaaaaaaaaaaaacaaaaaadkbabaaaabaaaaaackiacaaaaaaaaaaaacaaaaaa
dgaaaaaghcaabaaaacaaaaaaegiccaaaadaaaaaaaeaaaaaadgaaaaafccaabaaa
aaaaaaaaabeaaaaaaaaaaaaadaaaaaabcbaaaaahecaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaeaaaaaaadaaaeadckaabaaaaaaaaaaadcaaaabahcaabaaa
adaaaaaaegacbaiaebaaaaaaabaaaaaapgipcaagabaaaaaaaoaaaaaabkaabaaa
aaaaaaaaegiccaagabaaaaaaaoaaaaaabkaabaaaaaaaaaaadgaaaaagicaabaaa
adaaaaaackaabaiaebaaaaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegadbaaa
adaaaaaaegadbaaaadaaaaaaeeaaaaaficaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaaegadbaaaadaaaaaadiaaaaai
hcaabaaaaeaaaaaafgafbaaaadaaaaaaegiccaaaafaaaaaaabaaaaaadcaaaaak
lcaabaaaadaaaaaaegiicaaaafaaaaaaaaaaaaaaagaabaaaadaaaaaaegaibaaa
aeaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaafaaaaaaacaaaaaakgakbaaa
adaaaaaaegadbaaaadaaaaaadcaaaaamecaabaaaaaaaaaaackaabaaaaaaaaaaa
ckiacaagabaaaaaabgaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiadpaoaaaaak
ecaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpckaabaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaa
deaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaadiaaaaah
icaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahecaabaaa
aaaaaaaackaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaamhcaabaaaacaaaaaa
egiccaagabaaaaaaagaaaaaabkaabaaaaaaaaaaakgakbaaaaaaaaaaaegacbaaa
acaaaaaaboaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaabaaaaaa
bgaaaaabdgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaiadpdiaaaaaipccabaaa
acaaaaaaegaobaaaacaaaaaaegiocaaaaaaaaaaaadaaaaaadgaaaaafpccabaaa
abaaaaaaegbobaaaaeaaaaaadoaaaaabejfdeheokiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaaijaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaiaaaajbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaiaaaa
joaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaaedepemepfcaafeeffiedepepfceeaakl
epfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
gfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "ps3 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 256 [glstate_matrix_modelview0]
Matrix 260 [glstate_matrix_mvp]
Matrix 264 [_TerrainEngineBendTree]
Matrix 268 [_CameraToWorld]
Vector 467 [glstate_lightmodel_ambient]
Vector 459 [unity_LightColor0]
Vector 460 [unity_LightColor1]
Vector 461 [unity_LightColor2]
Vector 462 [unity_LightColor3]
Vector 463 [unity_LightColor4]
Vector 464 [unity_LightColor5]
Vector 465 [unity_LightColor6]
Vector 466 [unity_LightColor7]
Vector 451 [unity_LightPosition0]
Vector 452 [unity_LightPosition1]
Vector 453 [unity_LightPosition2]
Vector 454 [unity_LightPosition3]
Vector 455 [unity_LightPosition4]
Vector 456 [unity_LightPosition5]
Vector 457 [unity_LightPosition6]
Vector 458 [unity_LightPosition7]
Vector 443 [unity_LightAtten0]
Vector 444 [unity_LightAtten1]
Vector 445 [unity_LightAtten2]
Vector 446 [unity_LightAtten3]
Vector 447 [unity_LightAtten4]
Vector 448 [unity_LightAtten5]
Vector 449 [unity_LightAtten6]
Vector 450 [unity_LightAtten7]
Vector 442 [_Scale]
Vector 441 [_SquashPlaneNormal]
Float 440 [_SquashAmount]
Float 439 [_AO]
Float 438 [_BaseLight]
Vector 437 [_Color]
"sce_vp_rsx // 48 instructions using 6 registers
[Configuration]
8
00000030410d0600
[Defaults]
1
436 3
00000000408000003f800000
[Microcode]
768
00009c6c009ba00c010600c36041dffc00001c6c0150a00c028600c360405ffc
00001c6c0150900c028600c360409ffc00001c6c0150800c028600c360411ffc
00001c6c00c0000c0086c0a300a1dffc00001c6c0100037f8106004300a1dffc
00001c6c015b900c008600c360403ffc00001c6c00db907f8186c09fe0203ffc
00011c6c005d300c0186c0836041dffc00009c6c011b90ff808600c30021dffc
00001c6c00c0000c0086c0a300a1dffc201fdc6c02db4000019540c360411ffc
00019c6c011b800c008000c300a1dffc00001c6c005b40000186c08360403ffc
00001c6c0190200c0686c0c360405ffc00001c6c0190100c0686c0c360409ffc
00001c6c0190000c0686c0c360411ffc00009c6c0190700c0686c0c360403ffc
00009c6c0190600c0686c0c360405ffc00009c6c0190500c0686c0c360409ffc
000088004990400c0686c0c560411ffc00001c6c0340007f8086c08360411ffc
00001c6c00db40550186c09fe0203ffc00019c6c009c308c00bfc0c36041dffe
00019c6c00dc300c0686c0830061dffe00011c6c009b7e7f810000c360403ffc
00019c6c004000d50686c08360405ffc00021c6c0140000c0686034360411ffc
00011c6c00db60000186c09fe1203ffc00019c6c209bb00008aa80c0023022fe
00021c6c008000000a8603436041dffc00019c6c0150e00c088600c360405ffc
00019c6c0150d00c088600c360409ffc00019c6c0150c00c088600c360411ffc
00019c6c00db40550186c09fe1a03ffc00019c6c0140020c0106034360411ffc
201fdc6c02db407f809540c360411ffc001f9c6c1000000d8106c09fe1a801fc
00019c6c029b4000068000c360411ffc00011c6c0080000006bfc24360403ffc
00011c6c0080007f8495434360403ffc00011c6c011cb00c01bfc2430121dffe
001f94004800000d8106c082a0401ffc401f9c6c0040000d8286c0836041ff80
401f9c6c0040080d8106c0836041ff9c00001c6c0040000c0486c0836041dffc
00001c6c005b40550186c08360403ffc401f9c6c009b500d8086c0c36041ff85
"
}
SubProgram "xbox360 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 30 [_CameraToWorld] 3
Matrix 22 [_TerrainEngineBendTree] 3
Matrix 16 [glstate_matrix_modelview0]
Matrix 12 [glstate_matrix_mvp]
Float 27 [_AO]
Float 28 [_BaseLight]
Vector 29 [_Color]
Vector 21 [_Scale]
Float 26 [_SquashAmount]
Vector 25 [_SquashPlaneNormal]
Vector 20 [glstate_lightmodel_ambient]
Vector 8 [unity_LightAtten0]
Vector 9 [unity_LightAtten1]
Vector 10 [unity_LightAtten2]
Vector 11 [unity_LightAtten3]
Vector 0 [unity_LightColor0]
Vector 1 [unity_LightColor1]
Vector 2 [unity_LightColor2]
Vector 3 [unity_LightColor3]
Vector 4 [unity_LightPosition0]
Vector 5 [unity_LightPosition1]
Vector 6 [unity_LightPosition2]
Vector 7 [unity_LightPosition3]
"vs_360
backbbabaaaaadaiaaaaaeeiaaaaaaaaaaaaaaceaaaaacjeaaaaaclmaaaaaaaa
aaaaaaaaaaaaacgmaaaaaabmaaaaacgapppoadaaaaaaaaaoaaaaaabmaaaaaaaa
aaaaacfjaaaaabdeaaacaablaaabaaaaaaaaabdiaaaaaaaaaaaaabeiaaacaabm
aaabaaaaaaaaabdiaaaaaaaaaaaaabfdaaacaaboaaadaaaaaaaaabgeaaaaaaaa
aaaaabheaaacaabnaaabaaaaaaaaabhmaaaaaaaaaaaaabimaaacaabfaaabaaaa
aaaaabhmaaaaaaaaaaaaabjdaaacaabkaaabaaaaaaaaabdiaaaaaaaaaaaaabkb
aaacaabjaaabaaaaaaaaabhmaaaaaaaaaaaaableaaacaabgaaadaaaaaaaaabge
aaaaaaaaaaaaabmlaaacaabeaaabaaaaaaaaabhmaaaaaaaaaaaaabogaaacaaba
aaaeaaaaaaaaabgeaaaaaaaaaaaaacaaaaacaaamaaaeaaaaaaaaabgeaaaaaaaa
aaaaacbdaaacaaaiaaaeaaaaaaaaacceaaaaaaaaaaaaacdeaaacaaaaaaaeaaaa
aaaaacceaaaaaaaaaaaaacefaaacaaaeaaaeaaaaaaaaacceaaaaaaaafpebepaa
aaaaaaadaaabaaabaaabaaaaaaaaaaaafpecgbhdgfemgjghgiheaafpedgbgngf
hcgbfegpfhgphcgmgeaaklklaaadaaadaaaeaaaeaaabaaaaaaaaaaaafpedgpgm
gphcaaklaaabaaadaaabaaaeaaabaaaaaaaaaaaafpfdgdgbgmgfaafpfdhbhfgb
hdgiebgngphfgoheaafpfdhbhfgbhdgifagmgbgogfeogphcgngbgmaafpfegfhc
hcgbgjgoefgoghgjgogfecgfgogefehcgfgfaaghgmhdhegbhegffpgmgjghgihe
gngpgegfgmfpgbgngcgjgfgoheaaghgmhdhegbhegffpgngbhehcgjhifpgngpge
gfgmhggjgfhhdaaaghgmhdhegbhegffpgngbhehcgjhifpgnhghaaahfgogjhehj
fpemgjghgiheebhehegfgoaaaaabaaadaaabaaaeaaaiaaaaaaaaaaaahfgogjhe
hjfpemgjghgiheedgpgmgphcaahfgogjhehjfpemgjghgihefagphdgjhegjgpgo
aahghdfpddfpdaaadccodacodcdadddfddcodaaaaaaaaaaaaaaaaaabaaaaaaaa
aaaaaaaaaaaaaabeaapmaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaea
aaaaaeaiaabbaaajaaaaaaaaaaaaaaaaaaaacaecaaaaaaabaaaaaaafaaaaaaac
aaaaacjaaabaaaaiaaaagaajaaaadaakaaaakaalaacafaamaaaapafaaaabpbka
aaaababnaaaabafeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadpiaaaaaaaaaaaaa
lpiaaaaaaaaaaaaapbfffaaiaaaabcabmcaaaaaaaaaagaangabdbcaabcaaaaaa
aaaaaaaagabjmeaabcaaaaaaaaaagabpgacfbcaabcaaaaaaaaaagaclgadbbcaa
bcaaaaaaaaaagadhgadnbcaabcaaaaaaaaaagaedgaejbcaabcaaaaaaaaaagaep
aaaaccaaaaaaaaaaafpicaaaaaaaafmiaaaaaaaaafpicaaaaaaaaoppaaaaaaaa
afpiaaaaaaaaaeehaaaaaaaaafpidaaaaaaaapplaaaaaaaaafpibaaaaaaaagii
aaaaaaaaceiladacaabamagmkbacbfiamiahaaaeabblleliklacbiacmiahaaae
aalbmaleklacbhaemiahaaaeaagmleleklacbgaemiahaaadaalegmbaolaeadac
miabaaaaaadodoaagpbjadaamialaaacaegmleleklaabjadmiahaaadaelimaaa
oaacadaamialaaacaagfgmgdkladbkacmiapaaadaalbaaaailacaoapmiapaaad
aagmdedeklacanadmiapiadoaablaadeklacamadmiabaaaaaamggmgmilacblbm
miahaaadaalbgcgcilacbcbdmiahaaacaagmloleklacbbadmiahaaacaablgcle
klacbaacmiapiaaaaaaaaaaaocababaamiabaaabaegmblmgilacahahmiacaaab
aegmblmgilacafafmiaeaaabaegmblmgilacaeaemiaiaaabaegmblmgilacagag
miamaaagaeigblkmilacaeaemiadaaafaemfblgnilacahahmiadaaagaemfblgn
ilacafafmiamaaafaeigblkmilacagagmiadaaaeaabkbkaaobafafaaaiedaead
aalalagmobafafagaiimaeadaaagaglbobagagagaabpabacaaaamglmkbabppad
aacmababaacmpbmloaaeaeadmiapaaaeaajejeaaolacacabfibbadabaablmggm
kbaeajieficcadabaagmmgmgkbaealiefieeadabaalbmgblkbaeaiiefiiiadab
aamgmglbkbaeakiemiadaaaeaabilaaaobafadaabeamaaaeaacmaglbobagadaf
ambmagagaapbaggmobagadadbeapaaacaapiaamgobacadafamcpagajaaaalblb
kbaccaadmiapaaadaaaalbaakbagboaamiapaaafaaaagmaakbagboaamiapaaag
aaaamgaakbagboaamiapaaahaapimgpiklaebpagmiapaaafaapigmpiklaebpaf
miapaaaiaapilbpiklaebpadmiacaaadaamglbaaoaaiajaamiapaaagaaaagmaa
kbaccaaamiabaaadaamglbaaoaafagaamiapaaacaaaamgaakbaccaaamiaeaaad
aamglbaaoaahacaamiabaaaeaalbblaaoaafagaamiacaaaeaalbblaaoaaiajaa
miaeaaaeaalbblaaoaahacaamiacaaacaablmgaaoaahacaamiaeaaacaablmgaa
oaaiajaamiaiaaacaablmgaaoaafagaamiacaaafaagmgmaaoaaiajaabeapaaab
aaangmgmkaabppahaebeafafaagmgmgmoaafagacmiabaaacaalemdaapaafaaaa
embcabacaamjmdgmpaacaaabemceabacaalomdlbpaaeaaabemeiabacaalomdmg
paadaaabemipabacaaaalbblkcacppabmiapaaabaaaaaaaaobacabaamiapaaaa
aaedgmaaobabaaaamiahaaabaamgmamailaaaabemiahaaabaalbleleklaaabab
miahaaaaaagmmaleklaaacabmiahaaaaaablleleklaaadaabeihiaabaalemabl
ibaabnbnaaaaaaaaaaaaaaaaaaaaaaaa"
}
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp vec4 unity_LightAtten[8];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform highp vec4 _Scale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
uniform highp float _AO;
uniform highp float _BaseLight;
uniform lowp vec4 _Color;
uniform highp mat4 _CameraToWorld;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  highp vec4 light_1;
  highp vec4 lightColor_2;
  highp vec4 lightDir_3;
  highp vec3 viewpos_4;
  lowp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6.w = _glesVertex.w;
  pos_6.xyz = (_glesVertex.xyz * _Scale.xyz);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.xyz = pos_6.xyz;
  pos_6.xyz = mix (pos_6.xyz, (_TerrainEngineBendTree * tmpvar_7).xyz, _glesColor.www);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = mix ((pos_6.xyz - ((dot (_SquashPlaneNormal.xyz, pos_6.xyz) + _SquashPlaneNormal.w) * _SquashPlaneNormal.xyz)), pos_6.xyz, vec3(_SquashAmount));
  pos_6 = tmpvar_8;
  viewpos_4 = (glstate_matrix_modelview0 * tmpvar_8).xyz;
  lightColor_2.w = 0.0;
  lightDir_3.w = _AO;
  highp vec3 toLight_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_LightPosition[0].xyz - (viewpos_4 * unity_LightPosition[0].w));
  toLight_9.xy = tmpvar_10.xy;
  toLight_9.z = (tmpvar_10.z * -1.0);
  highp mat3 tmpvar_11;
  tmpvar_11[0] = _CameraToWorld[0].xyz;
  tmpvar_11[1] = _CameraToWorld[1].xyz;
  tmpvar_11[2] = _CameraToWorld[2].xyz;
  lightDir_3.xyz = (tmpvar_11 * normalize(toLight_9));
  lightColor_2.xyz = unity_LightColor[0].xyz;
  light_1 = (glstate_lightmodel_ambient + (lightColor_2 * ((max (0.0, dot (_glesNormal, lightDir_3.xyz)) * ((_AO * _glesTANGENT.w) + _BaseLight)) * (1.0/((1.0 + (dot (toLight_9, toLight_9) * unity_LightAtten[0].z)))))));
  highp vec3 toLight_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (unity_LightPosition[1].xyz - (viewpos_4 * unity_LightPosition[1].w));
  toLight_12.xy = tmpvar_13.xy;
  toLight_12.z = (tmpvar_13.z * -1.0);
  highp mat3 tmpvar_14;
  tmpvar_14[0] = _CameraToWorld[0].xyz;
  tmpvar_14[1] = _CameraToWorld[1].xyz;
  tmpvar_14[2] = _CameraToWorld[2].xyz;
  lightDir_3.xyz = (tmpvar_14 * normalize(toLight_12));
  lightColor_2.xyz = unity_LightColor[1].xyz;
  light_1 = (light_1 + (lightColor_2 * ((max (0.0, dot (_glesNormal, lightDir_3.xyz)) * ((_AO * _glesTANGENT.w) + _BaseLight)) * (1.0/((1.0 + (dot (toLight_12, toLight_12) * unity_LightAtten[1].z)))))));
  highp vec3 toLight_15;
  highp vec3 tmpvar_16;
  tmpvar_16 = (unity_LightPosition[2].xyz - (viewpos_4 * unity_LightPosition[2].w));
  toLight_15.xy = tmpvar_16.xy;
  toLight_15.z = (tmpvar_16.z * -1.0);
  highp mat3 tmpvar_17;
  tmpvar_17[0] = _CameraToWorld[0].xyz;
  tmpvar_17[1] = _CameraToWorld[1].xyz;
  tmpvar_17[2] = _CameraToWorld[2].xyz;
  lightDir_3.xyz = (tmpvar_17 * normalize(toLight_15));
  lightColor_2.xyz = unity_LightColor[2].xyz;
  light_1 = (light_1 + (lightColor_2 * ((max (0.0, dot (_glesNormal, lightDir_3.xyz)) * ((_AO * _glesTANGENT.w) + _BaseLight)) * (1.0/((1.0 + (dot (toLight_15, toLight_15) * unity_LightAtten[2].z)))))));
  highp vec3 toLight_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (unity_LightPosition[3].xyz - (viewpos_4 * unity_LightPosition[3].w));
  toLight_18.xy = tmpvar_19.xy;
  toLight_18.z = (tmpvar_19.z * -1.0);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = _CameraToWorld[0].xyz;
  tmpvar_20[1] = _CameraToWorld[1].xyz;
  tmpvar_20[2] = _CameraToWorld[2].xyz;
  lightDir_3.xyz = (tmpvar_20 * normalize(toLight_18));
  lightColor_2.xyz = unity_LightColor[3].xyz;
  light_1.xyz = (light_1 + (lightColor_2 * ((max (0.0, dot (_glesNormal, lightDir_3.xyz)) * ((_AO * _glesTANGENT.w) + _BaseLight)) * (1.0/((1.0 + (dot (toLight_18, toLight_18) * unity_LightAtten[3].z))))))).xyz;
  light_1.w = 1.0;
  highp vec4 tmpvar_21;
  tmpvar_21 = (light_1 * _Color);
  tmpvar_5 = tmpvar_21;
  gl_Position = (glstate_matrix_mvp * tmpvar_8);
  xlv_TEXCOORD0 = _glesMultiTexCoord0;
  xlv_COLOR0 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 col_1;
  col_1.w = xlv_COLOR0.w;
  col_1.xyz = (xlv_COLOR0.xyz * (2.0 * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz));
  gl_FragData[0] = col_1;
}



#endif"
}
SubProgram "flash " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_TerrainEngineBendTree]
Matrix 12 [_CameraToWorld]
Vector 16 [glstate_lightmodel_ambient]
Vector 17 [unity_LightColor0]
Vector 18 [unity_LightColor1]
Vector 19 [unity_LightColor2]
Vector 20 [unity_LightColor3]
Vector 21 [unity_LightPosition0]
Vector 22 [unity_LightPosition1]
Vector 23 [unity_LightPosition2]
Vector 24 [unity_LightPosition3]
Vector 25 [unity_LightAtten0]
Vector 26 [unity_LightAtten1]
Vector 27 [unity_LightAtten2]
Vector 28 [unity_LightAtten3]
Vector 29 [_Scale]
Vector 30 [_SquashPlaneNormal]
Float 31 [_SquashAmount]
Float 32 [_AO]
Float 33 [_BaseLight]
Vector 34 [_Color]
"agal_vs
c35 0.0 1.0 0.0 0.0
[bc]
adaaaaaaaaaaahacaaaaaaoeaaaaaaaabnaaaaoeabaaaaaa mul r0.xyz, a0, c29
aaaaaaaaaaaaaiaccdaaaaaaabaaaaaaaaaaaaaaaaaaaaaa mov r0.w, c35.x
aaaaaaaaabaaaiaccdaaaaffabaaaaaaaaaaaaaaaaaaaaaa mov r1.w, c35.y
bdaaaaaaabaaaeacaaaaaaoeacaaaaaaakaaaaoeabaaaaaa dp4 r1.z, r0, c10
bdaaaaaaabaaabacaaaaaaoeacaaaaaaaiaaaaoeabaaaaaa dp4 r1.x, r0, c8
bdaaaaaaabaaacacaaaaaaoeacaaaaaaajaaaaoeabaaaaaa dp4 r1.y, r0, c9
acaaaaaaabaaahacabaaaakeacaaaaaaaaaaaakeacaaaaaa sub r1.xyz, r1.xyzz, r0.xyzz
adaaaaaaabaaahacacaaaappaaaaaaaaabaaaakeacaaaaaa mul r1.xyz, a2.w, r1.xyzz
abaaaaaaabaaahacabaaaakeacaaaaaaaaaaaakeacaaaaaa add r1.xyz, r1.xyzz, r0.xyzz
bcaaaaaaaaaaabacabaaaakeacaaaaaaboaaaaoeabaaaaaa dp3 r0.x, r1.xyzz, c30
abaaaaaaaaaaabacaaaaaaaaacaaaaaaboaaaappabaaaaaa add r0.x, r0.x, c30.w
adaaaaaaaaaaahacaaaaaaaaacaaaaaaboaaaaoeabaaaaaa mul r0.xyz, r0.x, c30
bfaaaaaaacaaahacaaaaaakeacaaaaaaaaaaaaaaaaaaaaaa neg r2.xyz, r0.xyzz
abaaaaaaabaaahacacaaaakeacaaaaaaabaaaakeacaaaaaa add r1.xyz, r2.xyzz, r1.xyzz
adaaaaaaadaaahacaaaaaakeacaaaaaabpaaaaaaabaaaaaa mul r3.xyz, r0.xyzz, c31.x
abaaaaaaabaaahacadaaaakeacaaaaaaabaaaakeacaaaaaa add r1.xyz, r3.xyzz, r1.xyzz
bdaaaaaaacaaaeacabaaaaoeacaaaaaaacaaaaoeabaaaaaa dp4 r2.z, r1, c2
bdaaaaaaacaaabacabaaaaoeacaaaaaaaaaaaaoeabaaaaaa dp4 r2.x, r1, c0
bdaaaaaaacaaacacabaaaaoeacaaaaaaabaaaaoeabaaaaaa dp4 r2.y, r1, c1
bfaaaaaaaaaaahacacaaaakeacaaaaaaaaaaaaaaaaaaaaaa neg r0.xyz, r2.xyzz
adaaaaaaaaaaahacaaaaaakeacaaaaaabfaaaappabaaaaaa mul r0.xyz, r0.xyzz, c21.w
abaaaaaaaaaaahacaaaaaakeacaaaaaabfaaaaoeabaaaaaa add r0.xyz, r0.xyzz, c21
bfaaaaaaadaaahacacaaaakeacaaaaaaaaaaaaaaaaaaaaaa neg r3.xyz, r2.xyzz
adaaaaaaadaaahacadaaaakeacaaaaaabhaaaappabaaaaaa mul r3.xyz, r3.xyzz, c23.w
abaaaaaaadaaahacadaaaakeacaaaaaabhaaaaoeabaaaaaa add r3.xyz, r3.xyzz, c23
bfaaaaaaadaaaeacadaaaakkacaaaaaaaaaaaaaaaaaaaaaa neg r3.z, r3.z
bcaaaaaaaaaaaiacadaaaakeacaaaaaaadaaaakeacaaaaaa dp3 r0.w, r3.xyzz, r3.xyzz
akaaaaaaadaaaiacaaaaaappacaaaaaaaaaaaaaaaaaaaaaa rsq r3.w, r0.w
bfaaaaaaaaaaaeacaaaaaakkacaaaaaaaaaaaaaaaaaaaaaa neg r0.z, r0.z
bcaaaaaaacaaaiacaaaaaakeacaaaaaaaaaaaakeacaaaaaa dp3 r2.w, r0.xyzz, r0.xyzz
adaaaaaaaeaaahacadaaaappacaaaaaaadaaaakeacaaaaaa mul r4.xyz, r3.w, r3.xyzz
akaaaaaaaeaaaiacacaaaappacaaaaaaaaaaaaaaaaaaaaaa rsq r4.w, r2.w
adaaaaaaadaaahacaeaaaappacaaaaaaaaaaaakeacaaaaaa mul r3.xyz, r4.w, r0.xyzz
bcaaaaaaaaaaaeacaeaaaakeacaaaaaaaoaaaaoeabaaaaaa dp3 r0.z, r4.xyzz, c14
bcaaaaaaaaaaabacaeaaaakeacaaaaaaamaaaaoeabaaaaaa dp3 r0.x, r4.xyzz, c12
bcaaaaaaaaaaacacaeaaaakeacaaaaaaanaaaaoeabaaaaaa dp3 r0.y, r4.xyzz, c13
bcaaaaaaadaaaiacabaaaaoeaaaaaaaaaaaaaakeacaaaaaa dp3 r3.w, a1, r0.xyzz
bcaaaaaaaaaaaeacadaaaakeacaaaaaaaoaaaaoeabaaaaaa dp3 r0.z, r3.xyzz, c14
bcaaaaaaaaaaacacadaaaakeacaaaaaaanaaaaoeabaaaaaa dp3 r0.y, r3.xyzz, c13
bcaaaaaaaaaaabacadaaaakeacaaaaaaamaaaaoeabaaaaaa dp3 r0.x, r3.xyzz, c12
bcaaaaaaaaaaabacabaaaaoeaaaaaaaaaaaaaakeacaaaaaa dp3 r0.x, a1, r0.xyzz
ahaaaaaaaaaaacacaaaaaaaaacaaaaaacdaaaaaaabaaaaaa max r0.y, r0.x, c35.x
adaaaaaaaaaaaeacacaaaappacaaaaaabjaaaaoeabaaaaaa mul r0.z, r2.w, c25
abaaaaaaadaaabacaaaaaakkacaaaaaacdaaaaffabaaaaaa add r3.x, r0.z, c35.y
adaaaaaaaaaaabacafaaaappaaaaaaaacaaaaaoeabaaaaaa mul r0.x, a5.w, c32
abaaaaaaacaaaiacaaaaaaaaacaaaaaacbaaaaaaabaaaaaa add r2.w, r0.x, c33.x
adaaaaaaaeaaabacacaaaappacaaaaaaaaaaaaffacaaaaaa mul r4.x, r2.w, r0.y
bfaaaaaaaaaaahacacaaaakeacaaaaaaaaaaaaaaaaaaaaaa neg r0.xyz, r2.xyzz
adaaaaaaaaaaahacaaaaaakeacaaaaaabgaaaappabaaaaaa mul r0.xyz, r0.xyzz, c22.w
abaaaaaaaaaaahacaaaaaakeacaaaaaabgaaaaoeabaaaaaa add r0.xyz, r0.xyzz, c22
bfaaaaaaacaaahacacaaaakeacaaaaaaaaaaaaaaaaaaaaaa neg r2.xyz, r2.xyzz
adaaaaaaacaaahacacaaaakeacaaaaaabiaaaappabaaaaaa mul r2.xyz, r2.xyzz, c24.w
abaaaaaaacaaahacacaaaakeacaaaaaabiaaaaoeabaaaaaa add r2.xyz, r2.xyzz, c24
afaaaaaaaeaaacacadaaaaaaacaaaaaaaaaaaaaaaaaaaaaa rcp r4.y, r3.x
aaaaaaaaadaaadacaaaaaafeacaaaaaaaaaaaaaaaaaaaaaa mov r3.xy, r0.xyyy
bfaaaaaaadaaaeacaaaaaakkacaaaaaaaaaaaaaaaaaaaaaa neg r3.z, r0.z
adaaaaaaaaaaabacaeaaaaaaacaaaaaaaeaaaaffacaaaaaa mul r0.x, r4.x, r4.y
bcaaaaaaaeaaaiacadaaaakeacaaaaaaadaaaakeacaaaaaa dp3 r4.w, r3.xyzz, r3.xyzz
akaaaaaaaeaaabacaeaaaappacaaaaaaaaaaaaaaaaaaaaaa rsq r4.x, r4.w
adaaaaaaaeaaahacaeaaaaaaacaaaaaaadaaaakeacaaaaaa mul r4.xyz, r4.x, r3.xyzz
adaaaaaaaaaaahacaaaaaaaaacaaaaaabbaaaaoeabaaaaaa mul r0.xyz, r0.x, c17
abaaaaaaadaaahacaaaaaakeacaaaaaabaaaaaoeabaaaaaa add r3.xyz, r0.xyzz, c16
bcaaaaaaaaaaaeacaeaaaakeacaaaaaaaoaaaaoeabaaaaaa dp3 r0.z, r4.xyzz, c14
bcaaaaaaaaaaacacaeaaaakeacaaaaaaanaaaaoeabaaaaaa dp3 r0.y, r4.xyzz, c13
bcaaaaaaaaaaabacaeaaaakeacaaaaaaamaaaaoeabaaaaaa dp3 r0.x, r4.xyzz, c12
bcaaaaaaaaaaabacabaaaaoeaaaaaaaaaaaaaakeacaaaaaa dp3 r0.x, a1, r0.xyzz
adaaaaaaaeaaabacaeaaaappacaaaaaabkaaaakkabaaaaaa mul r4.x, r4.w, c26.z
abaaaaaaaaaaacacaeaaaaaaacaaaaaacdaaaaoeabaaaaaa add r0.y, r4.x, c35
ahaaaaaaaaaaabacaaaaaaaaacaaaaaacdaaaaoeabaaaaaa max r0.x, r0.x, c35
afaaaaaaaaaaacacaaaaaaffacaaaaaaaaaaaaaaaaaaaaaa rcp r0.y, r0.y
adaaaaaaaaaaabacacaaaappacaaaaaaaaaaaaaaacaaaaaa mul r0.x, r2.w, r0.x
adaaaaaaaaaaabacaaaaaaaaacaaaaaaaaaaaaffacaaaaaa mul r0.x, r0.x, r0.y
adaaaaaaaaaaahacaaaaaaaaacaaaaaabcaaaaoeabaaaaaa mul r0.xyz, r0.x, c18
abaaaaaaaaaaahacaaaaaakeacaaaaaaadaaaakeacaaaaaa add r0.xyz, r0.xyzz, r3.xyzz
adaaaaaaaaaaaiacaaaaaappacaaaaaablaaaakkabaaaaaa mul r0.w, r0.w, c27.z
abaaaaaaadaaacacaaaaaappacaaaaaacdaaaaoeabaaaaaa add r3.y, r0.w, c35
bfaaaaaaacaaaeacacaaaakkacaaaaaaaaaaaaaaaaaaaaaa neg r2.z, r2.z
ahaaaaaaadaaaiacadaaaappacaaaaaacdaaaaaaabaaaaaa max r3.w, r3.w, c35.x
bcaaaaaaaaaaaiacacaaaakeacaaaaaaacaaaakeacaaaaaa dp3 r0.w, r2.xyzz, r2.xyzz
afaaaaaaadaaaeacadaaaaffacaaaaaaaaaaaaaaaaaaaaaa rcp r3.z, r3.y
akaaaaaaadaaacacaaaaaappacaaaaaaaaaaaaaaaaaaaaaa rsq r3.y, r0.w
adaaaaaaacaaahacadaaaaffacaaaaaaacaaaakeacaaaaaa mul r2.xyz, r3.y, r2.xyzz
adaaaaaaadaaabacacaaaappacaaaaaaadaaaappacaaaaaa mul r3.x, r2.w, r3.w
adaaaaaaadaaabacadaaaaaaacaaaaaaadaaaakkacaaaaaa mul r3.x, r3.x, r3.z
adaaaaaaaeaaahacadaaaaaaacaaaaaabdaaaaoeabaaaaaa mul r4.xyz, r3.x, c19
abaaaaaaaaaaahacaeaaaakeacaaaaaaaaaaaakeacaaaaaa add r0.xyz, r4.xyzz, r0.xyzz
bcaaaaaaadaaaeacacaaaakeacaaaaaaaoaaaaoeabaaaaaa dp3 r3.z, r2.xyzz, c14
bcaaaaaaadaaacacacaaaakeacaaaaaaanaaaaoeabaaaaaa dp3 r3.y, r2.xyzz, c13
bcaaaaaaadaaabacacaaaakeacaaaaaaamaaaaoeabaaaaaa dp3 r3.x, r2.xyzz, c12
adaaaaaaacaaabacaaaaaappacaaaaaabmaaaakkabaaaaaa mul r2.x, r0.w, c28.z
bcaaaaaaaaaaaiacabaaaaoeaaaaaaaaadaaaakeacaaaaaa dp3 r0.w, a1, r3.xyzz
abaaaaaaacaaabacacaaaaaaacaaaaaacdaaaaffabaaaaaa add r2.x, r2.x, c35.y
ahaaaaaaaaaaaiacaaaaaappacaaaaaacdaaaaaaabaaaaaa max r0.w, r0.w, c35.x
afaaaaaaacaaabacacaaaaaaacaaaaaaaaaaaaaaaaaaaaaa rcp r2.x, r2.x
adaaaaaaaaaaaiacaaaaaappacaaaaaaacaaaappacaaaaaa mul r0.w, r0.w, r2.w
adaaaaaaaaaaaiacaaaaaappacaaaaaaacaaaaaaacaaaaaa mul r0.w, r0.w, r2.x
adaaaaaaacaaahacaaaaaappacaaaaaabeaaaaoeabaaaaaa mul r2.xyz, r0.w, c20
abaaaaaaaaaaahacacaaaakeacaaaaaaaaaaaakeacaaaaaa add r0.xyz, r2.xyzz, r0.xyzz
aaaaaaaaaaaaaiaccdaaaaffabaaaaaaaaaaaaaaaaaaaaaa mov r0.w, c35.y
adaaaaaaahaaapaeaaaaaaoeacaaaaaaccaaaaoeabaaaaaa mul v7, r0, c34
bdaaaaaaaaaaaiadabaaaaoeacaaaaaaahaaaaoeabaaaaaa dp4 o0.w, r1, c7
bdaaaaaaaaaaaeadabaaaaoeacaaaaaaagaaaaoeabaaaaaa dp4 o0.z, r1, c6
bdaaaaaaaaaaacadabaaaaoeacaaaaaaafaaaaoeabaaaaaa dp4 o0.y, r1, c5
bdaaaaaaaaaaabadabaaaaoeacaaaaaaaeaaaaoeabaaaaaa dp4 o0.x, r1, c4
aaaaaaaaaaaaapaeadaaaaoeaaaaaaaaaaaaaaaaaaaaaaaa mov v0, a3
"
}
SubProgram "glesdesktop " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp vec4 unity_LightAtten[8];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform highp vec4 _Scale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
uniform highp float _AO;
uniform highp float _BaseLight;
uniform lowp vec4 _Color;
uniform highp mat4 _CameraToWorld;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  highp vec4 light_1;
  highp vec4 lightColor_2;
  highp vec4 lightDir_3;
  highp vec3 viewpos_4;
  lowp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6.w = _glesVertex.w;
  pos_6.xyz = (_glesVertex.xyz * _Scale.xyz);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.xyz = pos_6.xyz;
  pos_6.xyz = mix (pos_6.xyz, (_TerrainEngineBendTree * tmpvar_7).xyz, _glesColor.www);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = mix ((pos_6.xyz - ((dot (_SquashPlaneNormal.xyz, pos_6.xyz) + _SquashPlaneNormal.w) * _SquashPlaneNormal.xyz)), pos_6.xyz, vec3(_SquashAmount));
  pos_6 = tmpvar_8;
  viewpos_4 = (glstate_matrix_modelview0 * tmpvar_8).xyz;
  lightColor_2.w = 0.0;
  lightDir_3.w = _AO;
  highp vec3 toLight_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_LightPosition[0].xyz - (viewpos_4 * unity_LightPosition[0].w));
  toLight_9.xy = tmpvar_10.xy;
  toLight_9.z = (tmpvar_10.z * -1.0);
  highp mat3 tmpvar_11;
  tmpvar_11[0] = _CameraToWorld[0].xyz;
  tmpvar_11[1] = _CameraToWorld[1].xyz;
  tmpvar_11[2] = _CameraToWorld[2].xyz;
  lightDir_3.xyz = (tmpvar_11 * normalize(toLight_9));
  lightColor_2.xyz = unity_LightColor[0].xyz;
  light_1 = (glstate_lightmodel_ambient + (lightColor_2 * ((max (0.0, dot (_glesNormal, lightDir_3.xyz)) * ((_AO * _glesTANGENT.w) + _BaseLight)) * (1.0/((1.0 + (dot (toLight_9, toLight_9) * unity_LightAtten[0].z)))))));
  highp vec3 toLight_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (unity_LightPosition[1].xyz - (viewpos_4 * unity_LightPosition[1].w));
  toLight_12.xy = tmpvar_13.xy;
  toLight_12.z = (tmpvar_13.z * -1.0);
  highp mat3 tmpvar_14;
  tmpvar_14[0] = _CameraToWorld[0].xyz;
  tmpvar_14[1] = _CameraToWorld[1].xyz;
  tmpvar_14[2] = _CameraToWorld[2].xyz;
  lightDir_3.xyz = (tmpvar_14 * normalize(toLight_12));
  lightColor_2.xyz = unity_LightColor[1].xyz;
  light_1 = (light_1 + (lightColor_2 * ((max (0.0, dot (_glesNormal, lightDir_3.xyz)) * ((_AO * _glesTANGENT.w) + _BaseLight)) * (1.0/((1.0 + (dot (toLight_12, toLight_12) * unity_LightAtten[1].z)))))));
  highp vec3 toLight_15;
  highp vec3 tmpvar_16;
  tmpvar_16 = (unity_LightPosition[2].xyz - (viewpos_4 * unity_LightPosition[2].w));
  toLight_15.xy = tmpvar_16.xy;
  toLight_15.z = (tmpvar_16.z * -1.0);
  highp mat3 tmpvar_17;
  tmpvar_17[0] = _CameraToWorld[0].xyz;
  tmpvar_17[1] = _CameraToWorld[1].xyz;
  tmpvar_17[2] = _CameraToWorld[2].xyz;
  lightDir_3.xyz = (tmpvar_17 * normalize(toLight_15));
  lightColor_2.xyz = unity_LightColor[2].xyz;
  light_1 = (light_1 + (lightColor_2 * ((max (0.0, dot (_glesNormal, lightDir_3.xyz)) * ((_AO * _glesTANGENT.w) + _BaseLight)) * (1.0/((1.0 + (dot (toLight_15, toLight_15) * unity_LightAtten[2].z)))))));
  highp vec3 toLight_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (unity_LightPosition[3].xyz - (viewpos_4 * unity_LightPosition[3].w));
  toLight_18.xy = tmpvar_19.xy;
  toLight_18.z = (tmpvar_19.z * -1.0);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = _CameraToWorld[0].xyz;
  tmpvar_20[1] = _CameraToWorld[1].xyz;
  tmpvar_20[2] = _CameraToWorld[2].xyz;
  lightDir_3.xyz = (tmpvar_20 * normalize(toLight_18));
  lightColor_2.xyz = unity_LightColor[3].xyz;
  light_1.xyz = (light_1 + (lightColor_2 * ((max (0.0, dot (_glesNormal, lightDir_3.xyz)) * ((_AO * _glesTANGENT.w) + _BaseLight)) * (1.0/((1.0 + (dot (toLight_18, toLight_18) * unity_LightAtten[3].z))))))).xyz;
  light_1.w = 1.0;
  highp vec4 tmpvar_21;
  tmpvar_21 = (light_1 * _Color);
  tmpvar_5 = tmpvar_21;
  gl_Position = (glstate_matrix_mvp * tmpvar_8);
  xlv_TEXCOORD0 = _glesMultiTexCoord0;
  xlv_COLOR0 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 col_1;
  col_1.w = xlv_COLOR0.w;
  col_1.xyz = (xlv_COLOR0.xyz * (2.0 * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz));
  gl_FragData[0] = col_1;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT _glesTANGENT
in vec4 _glesTANGENT;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp vec4 unity_LightAtten[8];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform highp vec4 _Scale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
uniform highp float _AO;
uniform highp float _BaseLight;
uniform lowp vec4 _Color;
uniform highp mat4 _CameraToWorld;
out highp vec4 xlv_TEXCOORD0;
out lowp vec4 xlv_COLOR0;
void main ()
{
  highp vec4 light_1;
  highp vec4 lightColor_2;
  highp vec4 lightDir_3;
  highp vec3 viewpos_4;
  lowp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6.w = _glesVertex.w;
  pos_6.xyz = (_glesVertex.xyz * _Scale.xyz);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.xyz = pos_6.xyz;
  pos_6.xyz = mix (pos_6.xyz, (_TerrainEngineBendTree * tmpvar_7).xyz, _glesColor.www);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = mix ((pos_6.xyz - ((dot (_SquashPlaneNormal.xyz, pos_6.xyz) + _SquashPlaneNormal.w) * _SquashPlaneNormal.xyz)), pos_6.xyz, vec3(_SquashAmount));
  pos_6 = tmpvar_8;
  viewpos_4 = (glstate_matrix_modelview0 * tmpvar_8).xyz;
  lightColor_2.w = 0.0;
  lightDir_3.w = _AO;
  highp vec3 toLight_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_LightPosition[0].xyz - (viewpos_4 * unity_LightPosition[0].w));
  toLight_9.xy = tmpvar_10.xy;
  toLight_9.z = (tmpvar_10.z * -1.0);
  highp mat3 tmpvar_11;
  tmpvar_11[0] = _CameraToWorld[0].xyz;
  tmpvar_11[1] = _CameraToWorld[1].xyz;
  tmpvar_11[2] = _CameraToWorld[2].xyz;
  lightDir_3.xyz = (tmpvar_11 * normalize(toLight_9));
  lightColor_2.xyz = unity_LightColor[0].xyz;
  light_1 = (glstate_lightmodel_ambient + (lightColor_2 * ((max (0.0, dot (_glesNormal, lightDir_3.xyz)) * ((_AO * _glesTANGENT.w) + _BaseLight)) * (1.0/((1.0 + (dot (toLight_9, toLight_9) * unity_LightAtten[0].z)))))));
  highp vec3 toLight_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (unity_LightPosition[1].xyz - (viewpos_4 * unity_LightPosition[1].w));
  toLight_12.xy = tmpvar_13.xy;
  toLight_12.z = (tmpvar_13.z * -1.0);
  highp mat3 tmpvar_14;
  tmpvar_14[0] = _CameraToWorld[0].xyz;
  tmpvar_14[1] = _CameraToWorld[1].xyz;
  tmpvar_14[2] = _CameraToWorld[2].xyz;
  lightDir_3.xyz = (tmpvar_14 * normalize(toLight_12));
  lightColor_2.xyz = unity_LightColor[1].xyz;
  light_1 = (light_1 + (lightColor_2 * ((max (0.0, dot (_glesNormal, lightDir_3.xyz)) * ((_AO * _glesTANGENT.w) + _BaseLight)) * (1.0/((1.0 + (dot (toLight_12, toLight_12) * unity_LightAtten[1].z)))))));
  highp vec3 toLight_15;
  highp vec3 tmpvar_16;
  tmpvar_16 = (unity_LightPosition[2].xyz - (viewpos_4 * unity_LightPosition[2].w));
  toLight_15.xy = tmpvar_16.xy;
  toLight_15.z = (tmpvar_16.z * -1.0);
  highp mat3 tmpvar_17;
  tmpvar_17[0] = _CameraToWorld[0].xyz;
  tmpvar_17[1] = _CameraToWorld[1].xyz;
  tmpvar_17[2] = _CameraToWorld[2].xyz;
  lightDir_3.xyz = (tmpvar_17 * normalize(toLight_15));
  lightColor_2.xyz = unity_LightColor[2].xyz;
  light_1 = (light_1 + (lightColor_2 * ((max (0.0, dot (_glesNormal, lightDir_3.xyz)) * ((_AO * _glesTANGENT.w) + _BaseLight)) * (1.0/((1.0 + (dot (toLight_15, toLight_15) * unity_LightAtten[2].z)))))));
  highp vec3 toLight_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (unity_LightPosition[3].xyz - (viewpos_4 * unity_LightPosition[3].w));
  toLight_18.xy = tmpvar_19.xy;
  toLight_18.z = (tmpvar_19.z * -1.0);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = _CameraToWorld[0].xyz;
  tmpvar_20[1] = _CameraToWorld[1].xyz;
  tmpvar_20[2] = _CameraToWorld[2].xyz;
  lightDir_3.xyz = (tmpvar_20 * normalize(toLight_18));
  lightColor_2.xyz = unity_LightColor[3].xyz;
  light_1.xyz = (light_1 + (lightColor_2 * ((max (0.0, dot (_glesNormal, lightDir_3.xyz)) * ((_AO * _glesTANGENT.w) + _BaseLight)) * (1.0/((1.0 + (dot (toLight_18, toLight_18) * unity_LightAtten[3].z))))))).xyz;
  light_1.w = 1.0;
  highp vec4 tmpvar_21;
  tmpvar_21 = (light_1 * _Color);
  tmpvar_5 = tmpvar_21;
  gl_Position = (glstate_matrix_mvp * tmpvar_8);
  xlv_TEXCOORD0 = _glesMultiTexCoord0;
  xlv_COLOR0 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform sampler2D _MainTex;
in highp vec4 xlv_TEXCOORD0;
in lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 col_1;
  col_1.w = xlv_COLOR0.w;
  col_1.xyz = (xlv_COLOR0.xyz * (2.0 * texture (_MainTex, xlv_TEXCOORD0.xy).xyz));
  _glesFragData[0] = col_1;
}



#endif"
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
SubProgram "d3d9 " {
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c0, 2.00000000, 0, 0, 0
dcl t0.xy
dcl v0
texld r0, t0, s0
mul r0.xyz, r0, c0.x
mov_pp r0.w, v0
mul_pp r0.xyz, v0, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
"ps_4_0
eefiecedjcnidbopalgmkbcooimboajnpfinkdfeabaaaaaakaabaaaaadaaaaaa
cmaaaaaakaaaaaaaneaaaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaagfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmeaaaaaaeaaaaaaa
dbaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkbabaaaacaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
"ps_4_0_level_9_1
eefiecedlgegiilienhkojcgjkgiinfghdocpngeabaaaaaaeiacaaaaaeaaaaaa
daaaaaaaneaaaaaakaabaaaabeacaaaaebgpgodjjmaaaaaajmaaaaaaaaacpppp
heaaaaaaciaaaaaaaaaaciaaaaaaciaaaaaaciaaabaaceaaaaaaciaaaaaaaaaa
aaacppppbpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaacplabpaaaaac
aaaaaajaaaaiapkaecaaaaadaaaaapiaaaaaoelaaaaioekaacaaaaadaaaaahia
aaaaoeiaaaaaoeiaafaaaaadaaaachiaaaaaoeiaabaaoelaabaaaaacaaaaciia
abaapplaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcmeaaaaaaeaaaaaaa
dbaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkbabaaaacaaaaaadoaaaaab
ejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapadaaaa
gfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "ps3 " {
SetTexture 0 [_MainTex] 2D 0
"sce_fp_rsx // 4 instructions using 2 registers
[Configuration]
24
ffffffff000040250001fffe000000000000840002000000
[Microcode]
64
8e021700c8011c9dc8000001c8003fe13e800140c8011c9dc8000001c8003fe1
0e800200c8041c9dc9001001c800000110810140c9001c9dc8000001c8000001
"
}
SubProgram "xbox360 " {
SetTexture 0 [_MainTex] 2D 0
"ps_360
backbbaaaaaaaalaaaaaaaeiaaaaaaaaaaaaaaceaaaaaaaaaaaaaaiiaaaaaaaa
aaaaaaaaaaaaaagaaaaaaabmaaaaaafdppppadaaaaaaaaabaaaaaabmaaaaaaaa
aaaaaaemaaaaaadaaaadaaaaaaabaaaaaaaaaadmaaaaaaaafpengbgjgofegfhi
aaklklklaaaeaaamaaabaaabaaabaaaaaaaaaaaahahdfpddfpdaaadccodacodc
dadddfddcodaaaklaaaaaaaaaaaaaaeibaaaabaaaaaaaaaiaaaaaaaaaaaacaec
aaabaaadaaaaaaabaaaapafaaaaapbkaaaabbaacaaaabcaameaaaaaaaaaacaad
aaaaccaaaaaaaaaabaaiaaabbpbppoiiaaaaeaaamiahaaaaaamamaaaoaaaaaaa
beihiaaaaamamablobaaababaaaaaaaaaaaaaaaaaaaaaaaa"
}
SubProgram "gles " {
"!!GLES"
}
SubProgram "flash " {
SetTexture 0 [_MainTex] 2D 0
"agal_ps
c0 2.0 0.0 0.0 0.0
[bc]
ciaaaaaaaaaaapacaaaaaaoeaeaaaaaaaaaaaaaaafaababb tex r0, v0, s0 <2d wrap linear point>
adaaaaaaaaaaahacaaaaaakeacaaaaaaaaaaaaaaabaaaaaa mul r0.xyz, r0.xyzz, c0.x
aaaaaaaaaaaaaiacahaaaaoeaeaaaaaaaaaaaaaaaaaaaaaa mov r0.w, v7
adaaaaaaaaaaahacahaaaaoeaeaaaaaaaaaaaakeacaaaaaa mul r0.xyz, v7, r0.xyzz
aaaaaaaaaaaaapadaaaaaaoeacaaaaaaaaaaaaaaaaaaaaaa mov o0, r0
"
}
SubProgram "glesdesktop " {
"!!GLES"
}
SubProgram "gles3 " {
"!!GLES3"
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
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_TerrainEngineBendTree]
Vector 8 [unity_LightShadowBias]
Vector 9 [_Scale]
Vector 10 [_SquashPlaneNormal]
Float 11 [_SquashAmount]
"vs_2_0
def c12, 0.00000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_color0 v1
mul r1.xyz, v0, c9
mov r1.w, c12.x
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
add r0.xyz, r0, -r1
mad r1.xyz, v1.w, r0, r1
dp3 r0.x, r1, c10
add r0.x, r0, c10.w
mul r0.xyz, r0.x, c10
add r1.xyz, -r0, r1
mad r1.xyz, r0, c11.x, r1
mov r1.w, c12.y
dp4 r0.x, r1, c2
add r0.x, r0, c8
max r0.y, r0.x, c12.x
add r0.y, r0, -r0.x
mad r0.z, r0.y, c8.y, r0.x
dp4 r0.w, r1, c3
dp4 r0.x, r1, c0
dp4 r0.y, r1, c1
mov oPos, r0
mov oT0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
ConstBuffer "UnityShadows" 416
Vector 80 [unity_LightShadowBias]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Matrix 96 [_TerrainEngineBendTree]
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "UnityShadows" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityTerrain" 2
"vs_4_0
eefiecedmmknimgbnfpmdplckehlmjmiabkanajgabaaaaaaoaadaaaaadaaaaaa
cmaaaaaahmaaaaaalaaaaaaaejfdeheoeiaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaaebaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaiaaaafaepfdejfeejepeoaaedepemepfcaaklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafdeieefcciadaaaaeaaaabaamkaaaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaaeaaaaaa
fjaaaaaeegiocaaaacaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaad
icbabaaaabaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagiaaaaacacaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaaaacaaaaaaafaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaahaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaiaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegbcbaia
ebaaaaaaaaaaaaaaegiccaaaacaaaaaaafaaaaaaegacbaaaabaaaaaadcaaaaaj
hcaabaaaaaaaaaaapgbpbaaaabaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaaiicaabaaaaaaaaaaaegiccaaaacaaaaaaakaaaaaaegacbaaaaaaaaaaa
aaaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaacaaaaaaakaaaaaa
dcaaaaalhcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaa
akaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaacaaaaaa
alaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaabaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaaaaaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaaaaaaaaaiecaabaaaaaaaaaaackaabaaaaaaaaaaaakiacaaaaaaaaaaa
afaaaaaadgaaaaaflccabaaaaaaaaaaaegambaaaaaaaaaaadeaaaaahbcaabaaa
aaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaa
ckaabaiaebaaaaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakeccabaaaaaaaaaaa
bkiacaaaaaaaaaaaafaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
ConstBuffer "UnityShadows" 416
Vector 80 [unity_LightShadowBias]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Matrix 96 [_TerrainEngineBendTree]
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "UnityShadows" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityTerrain" 2
"vs_4_0_level_9_1
eefiecedmnegfedgdccninaggfddgfnjmkdagkaeabaaaaaaoaafaaaaaeaaaaaa
daaaaaaacmacaaaafmafaaaakmafaaaaebgpgodjpeabaaaapeabaaaaaaacpopp
jmabaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaafaa
abaaabaaaaaaaaaaabaaaaaaaeaaacaaaaaaaaaaacaaafaaaeaaagaaaaaaaaaa
acaaakaaacaaakaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafamaaapkaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjaafaaaaadaaaaahiaaaaaoejaagaaoekaafaaaaadabaaahiaaaaaffia
aiaaoekaaeaaaaaeabaaahiaahaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahia
ajaaoekaaaaakkiaabaaoeiaaeaaaaaeabaaahiaaaaaoejaagaaoekbabaaoeia
aeaaaaaeaaaaahiaabaappjaabaaoeiaaaaaoeiaaiaaaaadaaaaaiiaakaaoeka
aaaaoeiaacaaaaadaaaaaiiaaaaappiaakaappkaaeaaaaaeabaaahiaaaaappia
akaaoekbaaaaoeiabcaaaaaeacaaahiaalaaaakaaaaaoeiaabaaoeiaafaaaaad
aaaaapiaacaaffiaadaaoekaaeaaaaaeaaaaapiaacaaoekaacaaaaiaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaacaakkiaaaaaoeiaacaaaaadaaaaapiaaaaaoeia
afaaoekaacaaaaadaaaaaeiaaaaakkiaabaaaakaalaaaaadabaaabiaaaaakkia
amaaaakaacaaaaadabaaabiaaaaakkibabaaaaiaaeaaaaaeaaaaaemaabaaffka
abaaaaiaaaaakkiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaaimaaaaappiappppaaaafdeieefcciadaaaaeaaaabaamkaaaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaaeaaaaaafjaaaaae
egiocaaaacaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaafpaaaaadicbabaaa
abaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagiaaaaacacaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaaaacaaaaaaafaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegbcbaiaebaaaaaa
aaaaaaaaegiccaaaacaaaaaaafaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaa
aaaaaaaapgbpbaaaabaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaai
icaabaaaaaaaaaaaegiccaaaacaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
icaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaacaaaaaaakaaaaaadcaaaaal
hcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaaakaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaia
ebaaaaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaacaaaaaaalaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
abaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaa
aaaaaaaiecaabaaaaaaaaaaackaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaa
dgaaaaaflccabaaaaaaaaaaaegambaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaa
ckaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaackaabaia
ebaaaaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakeccabaaaaaaaaaaabkiacaaa
aaaaaaaaafaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaadoaaaaabejfdeheo
eiaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apahaaaaebaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaiaaaafaepfdej
feejepeoaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
"
}
SubProgram "ps3 " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 256 [glstate_matrix_mvp]
Matrix 260 [_TerrainEngineBendTree]
Vector 467 [unity_LightShadowBias]
Vector 466 [_Scale]
Vector 465 [_SquashPlaneNormal]
Float 464 [_SquashAmount]
"sce_vp_rsx // 19 instructions using 2 registers
[Configuration]
8
0000001300090200
[Defaults]
1
463 1
00000000
[Microcode]
304
00009c6c009d200c010600c36041dffc00001c6c0150600c028600c360405ffc
00001c6c0150500c028600c360409ffc00001c6c0150400c028600c360411ffc
00001c6c00c0000c0086c0a300a1dffc00001c6c0100037f8106004300a1dffc
00001c6c015d100c008600c360403ffc00001c6c00dd107f8186c09fe0203ffc
00009c6c011d10ff808600c30021dffc00001c6c00c0000c0086c0a300a1dffc
00001c6c011d000c008000c300a1dffc401f9c6c0190300c0086c0c360403f80
00001c6c0190200c0086c0c360403ffc00001c6c00dd30000186c09fe0203ffc
401f9c6c0190100c0086c0c360409f8000009c6c029cf07f808000c360411ffc
00009c6c00c000000286c0bfe0211ffc401f9c6c0190000c0086c0c360411f80
401f9c6c011d3000029540dfe0205f81
"
}
SubProgram "xbox360 " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 6 [_TerrainEngineBendTree] 3
Matrix 1 [glstate_matrix_mvp]
Vector 5 [_Scale]
Float 10 [_SquashAmount]
Vector 9 [_SquashPlaneNormal]
Vector 0 [unity_LightShadowBias]
"vs_360
backbbabaaaaabmeaaaaabgmaaaaaaaaaaaaaaceaaaaabgmaaaaabjeaaaaaaaa
aaaaaaaaaaaaabeeaaaaaabmaaaaabdipppoadaaaaaaaaagaaaaaabmaaaaaaaa
aaaaabdbaaaaaajeaaacaaafaaabaaaaaaaaaajmaaaaaaaaaaaaaakmaaacaaak
aaabaaaaaaaaaalmaaaaaaaaaaaaaammaaacaaajaaabaaaaaaaaaajmaaaaaaaa
aaaaaanpaaacaaagaaadaaaaaaaaaapiaaaaaaaaaaaaabaiaaacaaabaaaeaaaa
aaaaaapiaaaaaaaaaaaaabblaaacaaaaaaabaaaaaaaaaajmaaaaaaaafpfdgdgb
gmgfaaklaaabaaadaaabaaaeaaabaaaaaaaaaaaafpfdhbhfgbhdgiebgngphfgo
heaaklklaaaaaaadaaabaaabaaabaaaaaaaaaaaafpfdhbhfgbhdgifagmgbgogf
eogphcgngbgmaafpfegfhchcgbgjgoefgoghgjgogfecgfgogefehcgfgfaaklkl
aaadaaadaaaeaaaeaaabaaaaaaaaaaaaghgmhdhegbhegffpgngbhehcgjhifpgn
hghaaahfgogjhehjfpemgjghgihefdgigbgegphhecgjgbhdaahghdfpddfpdaaa
dccodacodcdadddfddcodaaaaaaaaaaaaaaaaaabaaaaaaaaaaaaaaaaaaaaaabe
aapmaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaeaaaaaabcmaaabaaab
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaaaacaaaaaaaaaaaaacjaaabaaaae
aacakaafaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaadaafcaaeaaaabcaamcaaaaaaaaaagaaggaambcaabcaaaaaaaaaagabc
aaaabcaameaaaaaaaaaaaaaeaaaaccaaaaaaaaaaafpibaaaaaaaaoiiaaaaaaaa
afpiaaaaaaaaahppaaaaaaaaceihabaaaalelegmkbabafiamiahaaabablbmale
klaaaiaamiahaaabaamgleleklaaahabmiahaaabaagmmaleklaaagabmiahaaab
aamablleolabaaaamiabaaaaaadodoaagpajabaamiahaaaaaegmmamaklaaajab
miahaaabaeleleaaoaaaabaamiahaaabaamagmleklabakaamiapaaaaaalbpiaa
kbabadaamiapaaaaaamgpiaaklabacaamiapaaaaaagmjepiklababaalacaaaaa
aaaaaambmcaaaaaemialiadoaamibaaakaaaaeaalabaaaaaaaaaaaebmcaaaaaa
miacaaaaaagmgmaakcaappaamiacaaaaaegmlbaaoaaaaaaamiaeiadoaalblbgm
klaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
}
SubProgram "gles " {
Keywords { "SHADOWS_DEPTH" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _Scale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 pos_2;
  pos_2.w = _glesVertex.w;
  pos_2.xyz = (_glesVertex.xyz * _Scale.xyz);
  highp vec4 tmpvar_3;
  tmpvar_3.w = 0.0;
  tmpvar_3.xyz = pos_2.xyz;
  pos_2.xyz = mix (pos_2.xyz, (_TerrainEngineBendTree * tmpvar_3).xyz, _glesColor.www);
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = mix ((pos_2.xyz - ((dot (_SquashPlaneNormal.xyz, pos_2.xyz) + _SquashPlaneNormal.w) * _SquashPlaneNormal.xyz)), pos_2.xyz, vec3(_SquashAmount));
  pos_2 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * tmpvar_4);
  tmpvar_1.xyw = tmpvar_5.xyw;
  tmpvar_1.z = (tmpvar_5.z + unity_LightShadowBias.x);
  tmpvar_1.z = mix (tmpvar_1.z, max (tmpvar_1.z, (tmpvar_5.w * -1.0)), unity_LightShadowBias.y);
  gl_Position = tmpvar_1;
}



#endif
#ifdef FRAGMENT

void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}



#endif"
}
SubProgram "flash " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_TerrainEngineBendTree]
Vector 8 [unity_LightShadowBias]
Vector 9 [_Scale]
Vector 10 [_SquashPlaneNormal]
Float 11 [_SquashAmount]
"agal_vs
c12 0.0 1.0 0.0 0.0
[bc]
adaaaaaaabaaahacaaaaaaoeaaaaaaaaajaaaaoeabaaaaaa mul r1.xyz, a0, c9
aaaaaaaaabaaaiacamaaaaaaabaaaaaaaaaaaaaaaaaaaaaa mov r1.w, c12.x
bdaaaaaaaaaaaeacabaaaaoeacaaaaaaagaaaaoeabaaaaaa dp4 r0.z, r1, c6
bdaaaaaaaaaaabacabaaaaoeacaaaaaaaeaaaaoeabaaaaaa dp4 r0.x, r1, c4
bdaaaaaaaaaaacacabaaaaoeacaaaaaaafaaaaoeabaaaaaa dp4 r0.y, r1, c5
acaaaaaaaaaaahacaaaaaakeacaaaaaaabaaaakeacaaaaaa sub r0.xyz, r0.xyzz, r1.xyzz
adaaaaaaacaaahacacaaaappaaaaaaaaaaaaaakeacaaaaaa mul r2.xyz, a2.w, r0.xyzz
abaaaaaaabaaahacacaaaakeacaaaaaaabaaaakeacaaaaaa add r1.xyz, r2.xyzz, r1.xyzz
bcaaaaaaaaaaabacabaaaakeacaaaaaaakaaaaoeabaaaaaa dp3 r0.x, r1.xyzz, c10
abaaaaaaaaaaabacaaaaaaaaacaaaaaaakaaaappabaaaaaa add r0.x, r0.x, c10.w
adaaaaaaaaaaahacaaaaaaaaacaaaaaaakaaaaoeabaaaaaa mul r0.xyz, r0.x, c10
bfaaaaaaacaaahacaaaaaakeacaaaaaaaaaaaaaaaaaaaaaa neg r2.xyz, r0.xyzz
abaaaaaaabaaahacacaaaakeacaaaaaaabaaaakeacaaaaaa add r1.xyz, r2.xyzz, r1.xyzz
adaaaaaaacaaahacaaaaaakeacaaaaaaalaaaaaaabaaaaaa mul r2.xyz, r0.xyzz, c11.x
abaaaaaaabaaahacacaaaakeacaaaaaaabaaaakeacaaaaaa add r1.xyz, r2.xyzz, r1.xyzz
aaaaaaaaabaaaiacamaaaaffabaaaaaaaaaaaaaaaaaaaaaa mov r1.w, c12.y
bdaaaaaaaaaaabacabaaaaoeacaaaaaaacaaaaoeabaaaaaa dp4 r0.x, r1, c2
abaaaaaaaaaaabacaaaaaaaaacaaaaaaaiaaaaoeabaaaaaa add r0.x, r0.x, c8
ahaaaaaaaaaaacacaaaaaaaaacaaaaaaamaaaaaaabaaaaaa max r0.y, r0.x, c12.x
acaaaaaaaaaaacacaaaaaaffacaaaaaaaaaaaaaaacaaaaaa sub r0.y, r0.y, r0.x
adaaaaaaacaaaeacaaaaaaffacaaaaaaaiaaaaffabaaaaaa mul r2.z, r0.y, c8.y
abaaaaaaaaaaaeacacaaaakkacaaaaaaaaaaaaaaacaaaaaa add r0.z, r2.z, r0.x
bdaaaaaaaaaaaiacabaaaaoeacaaaaaaadaaaaoeabaaaaaa dp4 r0.w, r1, c3
bdaaaaaaaaaaabacabaaaaoeacaaaaaaaaaaaaoeabaaaaaa dp4 r0.x, r1, c0
bdaaaaaaaaaaacacabaaaaoeacaaaaaaabaaaaoeabaaaaaa dp4 r0.y, r1, c1
aaaaaaaaaaaaapadaaaaaaoeacaaaaaaaaaaaaaaaaaaaaaa mov o0, r0
aaaaaaaaaaaaapaeaaaaaaoeacaaaaaaaaaaaaaaaaaaaaaa mov v0, r0
"
}
SubProgram "glesdesktop " {
Keywords { "SHADOWS_DEPTH" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _Scale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 pos_2;
  pos_2.w = _glesVertex.w;
  pos_2.xyz = (_glesVertex.xyz * _Scale.xyz);
  highp vec4 tmpvar_3;
  tmpvar_3.w = 0.0;
  tmpvar_3.xyz = pos_2.xyz;
  pos_2.xyz = mix (pos_2.xyz, (_TerrainEngineBendTree * tmpvar_3).xyz, _glesColor.www);
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = mix ((pos_2.xyz - ((dot (_SquashPlaneNormal.xyz, pos_2.xyz) + _SquashPlaneNormal.w) * _SquashPlaneNormal.xyz)), pos_2.xyz, vec3(_SquashAmount));
  pos_2 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * tmpvar_4);
  tmpvar_1.xyw = tmpvar_5.xyw;
  tmpvar_1.z = (tmpvar_5.z + unity_LightShadowBias.x);
  tmpvar_1.z = mix (tmpvar_1.z, max (tmpvar_1.z, (tmpvar_5.w * -1.0)), unity_LightShadowBias.y);
  gl_Position = tmpvar_1;
}



#endif
#ifdef FRAGMENT

void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}



#endif"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_DEPTH" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _Scale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 pos_2;
  pos_2.w = _glesVertex.w;
  pos_2.xyz = (_glesVertex.xyz * _Scale.xyz);
  highp vec4 tmpvar_3;
  tmpvar_3.w = 0.0;
  tmpvar_3.xyz = pos_2.xyz;
  pos_2.xyz = mix (pos_2.xyz, (_TerrainEngineBendTree * tmpvar_3).xyz, _glesColor.www);
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = mix ((pos_2.xyz - ((dot (_SquashPlaneNormal.xyz, pos_2.xyz) + _SquashPlaneNormal.w) * _SquashPlaneNormal.xyz)), pos_2.xyz, vec3(_SquashAmount));
  pos_2 = tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * tmpvar_4);
  tmpvar_1.xyw = tmpvar_5.xyw;
  tmpvar_1.z = (tmpvar_5.z + unity_LightShadowBias.x);
  tmpvar_1.z = mix (tmpvar_1.z, max (tmpvar_1.z, (tmpvar_5.w * -1.0)), unity_LightShadowBias.y);
  gl_Position = tmpvar_1;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
void main ()
{
  _glesFragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}



#endif"
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
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_TerrainEngineBendTree]
Vector 12 [_LightPositionRange]
Vector 13 [_Scale]
Vector 14 [_SquashPlaneNormal]
Float 15 [_SquashAmount]
"vs_2_0
def c16, 0.00000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_color0 v1
mul r1.xyz, v0, c13
mov r1.w, c16.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
add r0.xyz, r0, -r1
mad r1.xyz, v1.w, r0, r1
dp3 r0.x, r1, c14
add r0.x, r0, c14.w
mul r0.xyz, r0.x, c14
add r1.xyz, -r0, r1
mad r1.xyz, r0, c15.x, r1
mov r1.w, c16.y
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
add oT0.xyz, r0, -c12
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Matrix 96 [_TerrainEngineBendTree]
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "UnityLighting" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityTerrain" 2
"vs_4_0
eefiecedbfjiippplacjnfobjpknmackopaaifljabaaaaaacmaeaaaaadaaaaaa
cmaaaaaahmaaaaaaneaaaaaaejfdeheoeiaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaaebaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaiaaaafaepfdejfeejepeoaaedepemepfcaaklepfdeheo
faaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcfaadaaaaeaaaabaa
neaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafjaaaaaeegiocaaaabaaaaaa
baaaaaaafjaaaaaeegiocaaaacaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaa
fpaaaaadicbabaaaabaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
hccabaaaabaaaaaagiaaaaacacaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaa
aaaaaaaaegiccaaaacaaaaaaafaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
acaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegbcbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaa
afaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaapgbpbaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaa
acaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkiacaaaacaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaia
ebaaaaaaaaaaaaaaegiccaaaacaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaagiacaaaacaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaabaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaa
egaobaaaabaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaabaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaabaaaaaa
apaaaaaaaaaaaaajhccabaaaabaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaa
aaaaaaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Matrix 96 [_TerrainEngineBendTree]
Vector 80 [_Scale]
Vector 160 [_SquashPlaneNormal]
Float 176 [_SquashAmount]
BindCB  "UnityLighting" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityTerrain" 2
"vs_4_0_level_9_1
eefiecedbnlfcljjpejbpaofbkemomepdimcoaccabaaaaaadeagaaaaaeaaaaaa
daaaaaaadeacaaaaimafaaaanmafaaaaebgpgodjpmabaaaapmabaaaaaaacpopp
jiabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaabaa
abaaabaaaaaaaaaaabaaaaaaaeaaacaaaaaaaaaaabaaamaaaeaaagaaaaaaaaaa
acaaafaaaeaaakaaaaaaaaaaacaaakaaacaaaoaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjaafaaaaadaaaaahia
aaaaoejaakaaoekaafaaaaadabaaahiaaaaaffiaamaaoekaaeaaaaaeabaaahia
alaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaanaaoekaaaaakkiaabaaoeia
aeaaaaaeabaaahiaaaaaoejaakaaoekbabaaoeiaaeaaaaaeaaaaahiaabaappja
abaaoeiaaaaaoeiaaiaaaaadaaaaaiiaaoaaoekaaaaaoeiaacaaaaadaaaaaiia
aaaappiaaoaappkaaeaaaaaeabaaahiaaaaappiaaoaaoekbaaaaoeiabcaaaaae
acaaahiaapaaaakaaaaaoeiaabaaoeiaafaaaaadaaaaahiaacaaffiaahaaoeka
aeaaaaaeaaaaahiaagaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaahiaaiaaoeka
acaakkiaaaaaoeiaacaaaaadaaaaahiaaaaaoeiaajaaoekaacaaaaadaaaaahoa
aaaaoeiaabaaoekbafaaaaadaaaaapiaacaaffiaadaaoekaaeaaaaaeaaaaapia
acaaoekaacaaaaiaaaaaoeiaaeaaaaaeaaaaapiaaeaaoekaacaakkiaaaaaoeia
acaaaaadaaaaapiaaaaaoeiaafaaoekaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcfaadaaaaeaaaabaa
neaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafjaaaaaeegiocaaaabaaaaaa
baaaaaaafjaaaaaeegiocaaaacaaaaaaamaaaaaafpaaaaadhcbabaaaaaaaaaaa
fpaaaaadicbabaaaabaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
hccabaaaabaaaaaagiaaaaacacaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaa
aaaaaaaaegiccaaaacaaaaaaafaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
acaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegbcbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaa
afaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaapgbpbaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegiccaaa
acaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkiacaaaacaaaaaaakaaaaaadcaaaaalhcaabaaaabaaaaaapgapbaia
ebaaaaaaaaaaaaaaegiccaaaacaaaaaaakaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaagiacaaaacaaaaaaalaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaabaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaaipccabaaaaaaaaaaa
egaobaaaabaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaabaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaabaaaaaa
apaaaaaaaaaaaaajhccabaaaabaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaa
aaaaaaaaabaaaaaadoaaaaabejfdeheoeiaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapahaaaaebaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaiaaaafaepfdejfeejepeoaaedepemepfcaaklepfdeheo
faaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "ps3 " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 256 [glstate_matrix_mvp]
Matrix 260 [_Object2World]
Matrix 264 [_TerrainEngineBendTree]
Vector 467 [_LightPositionRange]
Vector 466 [_Scale]
Vector 465 [_SquashPlaneNormal]
Float 464 [_SquashAmount]
"sce_vp_rsx // 19 instructions using 2 registers
[Configuration]
8
0000001300090200
[Microcode]
304
00009c6c009d200c010600c36041dffc00001c6c0150a00c028600c360405ffc
00001c6c0150900c028600c360409ffc00001c6c0150800c028600c360411ffc
00001c6c00c0000c0086c0a300a1dffc00001c6c0100037f8106004300a1dffc
00001c6c015d100c008600c360403ffc00001c6c00dd107f8186c09fe0203ffc
00009c6c011d10ff808600c30021dffc00001c6c00c0000c0086c0a300a1dffc
00009c6c011d000c008000c300a1dffc401f9c6c0190300c0286c0c360403f80
401f9c6c0190200c0286c0c360405f80401f9c6c0190100c0286c0c360409f80
401f9c6c0190000c0286c0c360411f8000001c6c0190600c0286c0c360405ffc
00001c6c0190500c0286c0c360409ffc00001c6c0190400c0286c0c360411ffc
401f9c6c00dd308c0186c0830021df9d
"
}
SubProgram "xbox360 " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 5 [_Object2World]
Matrix 10 [_TerrainEngineBendTree] 3
Matrix 1 [glstate_matrix_mvp]
Vector 0 [_LightPositionRange]
Vector 9 [_Scale]
Float 14 [_SquashAmount]
Vector 13 [_SquashPlaneNormal]
"vs_360
backbbabaaaaabmeaaaaabaiaaaaaaaaaaaaaaceaaaaaaaaaaaaabimaaaaaaaa
aaaaaaaaaaaaabgeaaaaaabmaaaaabfipppoadaaaaaaaaahaaaaaabmaaaaaaaa
aaaaabfbaaaaaakiaaacaaaaaaabaaaaaaaaaalmaaaaaaaaaaaaaammaaacaaaf
aaaeaaaaaaaaaanmaaaaaaaaaaaaaaomaaacaaajaaabaaaaaaaaaalmaaaaaaaa
aaaaaapdaaacaaaoaaabaaaaaaaaabaeaaaaaaaaaaaaabbeaaacaaanaaabaaaa
aaaaaalmaaaaaaaaaaaaabchaaacaaakaaadaaaaaaaaaanmaaaaaaaaaaaaabdo
aaacaaabaaaeaaaaaaaaaanmaaaaaaaafpemgjghgihefagphdgjhegjgpgofcgb
goghgfaaaaabaaadaaabaaaeaaabaaaaaaaaaaaafpepgcgkgfgdhedcfhgphcgm
geaaklklaaadaaadaaaeaaaeaaabaaaaaaaaaaaafpfdgdgbgmgfaafpfdhbhfgb
hdgiebgngphfgoheaaklklklaaaaaaadaaabaaabaaabaaaaaaaaaaaafpfdhbhf
gbhdgifagmgbgogfeogphcgngbgmaafpfegfhchcgbgjgoefgoghgjgogfecgfgo
gefehcgfgfaaghgmhdhegbhegffpgngbhehcgjhifpgnhghaaahghdfpddfpdaaa
dccodacodcdadddfddcodaaaaaaaaaaaaaaaabaiaaabaaabaaaaaaaaaaaaaaaa
aaaaamcbaaaaaaabaaaaaaacaaaaaaabaaaaacjaaabaaaadaacakaaeaaaahafa
aaaababedaafcaadaaaabcaamcaaaaaaaaaagaafgaalbcaabcaaaaaaaaaaaaaa
eabbmeaaccaaaaaaafpibaaaaaaaaoiiaaaaaaaaafpiaaaaaaaaahppaaaaaaaa
ceihabaaaalelegmkbabajiamiahaaabablbmaleklaaamaamiahaaabaamglele
klaaalabmiahaaabaagmmaleklaaakabmiahaaabaamablleolabaaaamiabaaaa
aadodoaagpanabaamiahaaaaaegmmamaklaaanabmiahaaabaeleleaaoaaaabaa
mialaaaaaagfgmgcklabaoaamiapaaabaagmaaaailaaadaemiapaaabaalbdede
klaaacabmiapiadoaablaadeklaaababmiahaaabaagmmamailaaahaimiahaaaa
aalbleleklaaagabmiahaaaaaablmaleklaaafaamiahiaaaacmamaaakaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaa"
}
SubProgram "gles " {
Keywords { "SHADOWS_CUBE" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 _Scale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 pos_1;
  pos_1.w = _glesVertex.w;
  pos_1.xyz = (_glesVertex.xyz * _Scale.xyz);
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = pos_1.xyz;
  pos_1.xyz = mix (pos_1.xyz, (_TerrainEngineBendTree * tmpvar_2).xyz, _glesColor.www);
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = mix ((pos_1.xyz - ((dot (_SquashPlaneNormal.xyz, pos_1.xyz) + _SquashPlaneNormal.w) * _SquashPlaneNormal.xyz)), pos_1.xyz, vec3(_SquashAmount));
  pos_1 = tmpvar_3;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_Object2World * tmpvar_3).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _LightPositionRange;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = fract((vec4(1.0, 255.0, 65025.0, 1.65814e+07) * min ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) * _LightPositionRange.w), 0.999)));
  highp vec4 tmpvar_2;
  tmpvar_2 = (tmpvar_1 - (tmpvar_1.yzww * 0.00392157));
  gl_FragData[0] = tmpvar_2;
}



#endif"
}
SubProgram "flash " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_TerrainEngineBendTree]
Vector 12 [_LightPositionRange]
Vector 13 [_Scale]
Vector 14 [_SquashPlaneNormal]
Float 15 [_SquashAmount]
"agal_vs
c16 0.0 1.0 0.0 0.0
[bc]
adaaaaaaabaaahacaaaaaaoeaaaaaaaaanaaaaoeabaaaaaa mul r1.xyz, a0, c13
aaaaaaaaabaaaiacbaaaaaaaabaaaaaaaaaaaaaaaaaaaaaa mov r1.w, c16.x
bdaaaaaaaaaaaeacabaaaaoeacaaaaaaakaaaaoeabaaaaaa dp4 r0.z, r1, c10
bdaaaaaaaaaaabacabaaaaoeacaaaaaaaiaaaaoeabaaaaaa dp4 r0.x, r1, c8
bdaaaaaaaaaaacacabaaaaoeacaaaaaaajaaaaoeabaaaaaa dp4 r0.y, r1, c9
acaaaaaaaaaaahacaaaaaakeacaaaaaaabaaaakeacaaaaaa sub r0.xyz, r0.xyzz, r1.xyzz
adaaaaaaacaaahacacaaaappaaaaaaaaaaaaaakeacaaaaaa mul r2.xyz, a2.w, r0.xyzz
abaaaaaaabaaahacacaaaakeacaaaaaaabaaaakeacaaaaaa add r1.xyz, r2.xyzz, r1.xyzz
bcaaaaaaaaaaabacabaaaakeacaaaaaaaoaaaaoeabaaaaaa dp3 r0.x, r1.xyzz, c14
abaaaaaaaaaaabacaaaaaaaaacaaaaaaaoaaaappabaaaaaa add r0.x, r0.x, c14.w
adaaaaaaaaaaahacaaaaaaaaacaaaaaaaoaaaaoeabaaaaaa mul r0.xyz, r0.x, c14
bfaaaaaaacaaahacaaaaaakeacaaaaaaaaaaaaaaaaaaaaaa neg r2.xyz, r0.xyzz
abaaaaaaabaaahacacaaaakeacaaaaaaabaaaakeacaaaaaa add r1.xyz, r2.xyzz, r1.xyzz
adaaaaaaacaaahacaaaaaakeacaaaaaaapaaaaaaabaaaaaa mul r2.xyz, r0.xyzz, c15.x
abaaaaaaabaaahacacaaaakeacaaaaaaabaaaakeacaaaaaa add r1.xyz, r2.xyzz, r1.xyzz
aaaaaaaaabaaaiacbaaaaaffabaaaaaaaaaaaaaaaaaaaaaa mov r1.w, c16.y
bdaaaaaaaaaaaeacabaaaaoeacaaaaaaagaaaaoeabaaaaaa dp4 r0.z, r1, c6
bdaaaaaaaaaaabacabaaaaoeacaaaaaaaeaaaaoeabaaaaaa dp4 r0.x, r1, c4
bdaaaaaaaaaaacacabaaaaoeacaaaaaaafaaaaoeabaaaaaa dp4 r0.y, r1, c5
acaaaaaaaaaaahaeaaaaaakeacaaaaaaamaaaaoeabaaaaaa sub v0.xyz, r0.xyzz, c12
bdaaaaaaaaaaaiadabaaaaoeacaaaaaaadaaaaoeabaaaaaa dp4 o0.w, r1, c3
bdaaaaaaaaaaaeadabaaaaoeacaaaaaaacaaaaoeabaaaaaa dp4 o0.z, r1, c2
bdaaaaaaaaaaacadabaaaaoeacaaaaaaabaaaaoeabaaaaaa dp4 o0.y, r1, c1
bdaaaaaaaaaaabadabaaaaoeacaaaaaaaaaaaaoeabaaaaaa dp4 o0.x, r1, c0
aaaaaaaaaaaaaiaeaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov v0.w, c0
"
}
SubProgram "glesdesktop " {
Keywords { "SHADOWS_CUBE" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 _Scale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 pos_1;
  pos_1.w = _glesVertex.w;
  pos_1.xyz = (_glesVertex.xyz * _Scale.xyz);
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = pos_1.xyz;
  pos_1.xyz = mix (pos_1.xyz, (_TerrainEngineBendTree * tmpvar_2).xyz, _glesColor.www);
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = mix ((pos_1.xyz - ((dot (_SquashPlaneNormal.xyz, pos_1.xyz) + _SquashPlaneNormal.w) * _SquashPlaneNormal.xyz)), pos_1.xyz, vec3(_SquashAmount));
  pos_1 = tmpvar_3;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_Object2World * tmpvar_3).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _LightPositionRange;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = fract((vec4(1.0, 255.0, 65025.0, 1.65814e+07) * min ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) * _LightPositionRange.w), 0.999)));
  highp vec4 tmpvar_2;
  tmpvar_2 = (tmpvar_1 - (tmpvar_1.yzww * 0.00392157));
  gl_FragData[0] = tmpvar_2;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_CUBE" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 _Scale;
uniform highp mat4 _TerrainEngineBendTree;
uniform highp vec4 _SquashPlaneNormal;
uniform highp float _SquashAmount;
out highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 pos_1;
  pos_1.w = _glesVertex.w;
  pos_1.xyz = (_glesVertex.xyz * _Scale.xyz);
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = pos_1.xyz;
  pos_1.xyz = mix (pos_1.xyz, (_TerrainEngineBendTree * tmpvar_2).xyz, _glesColor.www);
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = mix ((pos_1.xyz - ((dot (_SquashPlaneNormal.xyz, pos_1.xyz) + _SquashPlaneNormal.w) * _SquashPlaneNormal.xyz)), pos_1.xyz, vec3(_SquashAmount));
  pos_1 = tmpvar_3;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_Object2World * tmpvar_3).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightPositionRange;
in highp vec3 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = fract((vec4(1.0, 255.0, 65025.0, 1.65814e+07) * min ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) * _LightPositionRange.w), 0.999)));
  highp vec4 tmpvar_2;
  tmpvar_2 = (tmpvar_1 - (tmpvar_1.yzww * 0.00392157));
  _glesFragData[0] = tmpvar_2;
}



#endif"
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
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
"ps_2_0
dcl t0.xyzw
rcp r0.x, t0.w
mul r0.x, t0.z, r0
mov r0, r0.x
mov oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
"ps_4_0
eefiecedcbejcgfjfchfioiockkbgpdagbgpkifoabaaaaaaneaaaaaaadaaaaaa
cmaaaaaagaaaaaaajeaaaaaaejfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcdiaaaaaaeaaaaaaa
aoaaaaaagfaaaaadpccabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" }
"ps_4_0_level_9_1
eefieceddmmdbnbnmjjfimooohgfckafkfbckdnkabaaaaaadmabaaaaaeaaaaaa
daaaaaaajeaaaaaaneaaaaaaaiabaaaaebgpgodjfmaaaaaafmaaaaaaaaacpppp
diaaaaaaceaaaaaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaacpppp
fbaaaaafaaaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaacaaaaapia
aaaaaakaabaaaaacaaaiapiaaaaaoeiappppaaaafdeieefcdiaaaaaaeaaaaaaa
aoaaaaaagfaaaaadpccabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabejfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaaepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "ps3 " {
Keywords { "SHADOWS_DEPTH" }
"sce_fp_rsx // 3 instructions using 2 registers
[Configuration]
24
ffffffff000000200000ffff000000000000844002000000
[Microcode]
48
1e7e7e00c8001c9dc8000001c80000011e01010000021c9cc8000001c8000001
00000000000000000000000000000000
"
}
SubProgram "xbox360 " {
Keywords { "SHADOWS_DEPTH" }
"ps_360
backbbaaaaaaaahiaaaaaaceaaaaaaaaaaaaaaceaaaaaaaaaaaaaafiaaaaaaaa
aaaaaaaaaaaaaadaaaaaaabmaaaaaacdppppadaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaabmhahdfpddfpdaaadccodacodcdadddfddcodaaaklaaaaaaaaaaaaaace
baaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaaaaabaabmeaa
ccaaaaaacabamaaaabaaaagmocaaaaiaaaaaaaaaaaaaaaaaaaaaaaaa"
}
SubProgram "gles " {
Keywords { "SHADOWS_DEPTH" }
"!!GLES"
}
SubProgram "flash " {
Keywords { "SHADOWS_DEPTH" }
"agal_ps
c0 1.0 255.0 65025.0 16581375.0
c1 0.003922 0.0 0.0 0.0
[bc]
afaaaaaaaaaaabacaaaaaappaeaaaaaaaaaaaaaaaaaaaaaa rcp r0.x, v0.w
adaaaaaaaaaaabacaaaaaakkaeaaaaaaaaaaaaaaacaaaaaa mul r0.x, v0.z, r0.x
adaaaaaaaaaaapacaaaaaaaaacaaaaaaaaaaaaoeabaaaaaa mul r0, r0.x, c0
aiaaaaaaabaaapacaaaaaaoeacaaaaaaaaaaaaaaaaaaaaaa frc r1, r0
bfaaaaaaaaaaaeacabaaaappacaaaaaaaaaaaaaaaaaaaaaa neg r0.z, r1.w
bfaaaaaaaaaaalacabaaaapjacaaaaaaaaaaaaaaaaaaaaaa neg r0.xyw, r1.yzww
adaaaaaaaaaaapacaaaaaaoeacaaaaaaabaaaaaaabaaaaaa mul r0, r0, c1.x
abaaaaaaaaaaapacaaaaaaoeacaaaaaaabaaaaoeacaaaaaa add r0, r0, r1
aaaaaaaaaaaaapadaaaaaaoeacaaaaaaaaaaaaaaaaaaaaaa mov o0, r0
"
}
SubProgram "glesdesktop " {
Keywords { "SHADOWS_DEPTH" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_DEPTH" }
"!!GLES3"
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
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
Vector 0 [_LightPositionRange]
"ps_2_0
def c1, 0.99900001, 0.00392157, 0, 0
def c2, 1.00000000, 255.00000000, 65025.00000000, 16581375.00000000
dcl t0.xyz
dp3 r0.x, t0, t0
rsq r0.x, r0.x
rcp r0.x, r0.x
mul r0.x, r0, c0.w
min r0.x, r0, c1
mul r0, r0.x, c2
frc r1, r0
mov r0.z, -r1.w
mov r0.xyw, -r1.yzxw
mad r0, r0, c1.y, r1
mov oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
BindCB  "UnityLighting" 0
"ps_4_0
eefiecedckbinngfcaabjchaofnjildpenmjogbcabaaaaaaniabaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbiabaaaa
eaaaaaaaegaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaagcbaaaadhcbabaaa
abaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaaelaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaaa
aaaaaaaaabaaaaaaddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
hhlohpdpdiaaaaakpcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaiadp
aaaahpedaaabhoehppachnelbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaanpccabaaaaaaaaaaajgapbaiaebaaaaaaaaaaaaaaaceaaaaaibiaiadl
ibiaiadlibiaiadlibiaiadlegaobaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" }
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
BindCB  "UnityLighting" 0
"ps_4_0_level_9_1
eefiecedjahamlkcbfklkfnkijafabokffnpgdpfabaaaaaacmadaaaaaeaaaaaa
daaaaaaaiaabaaaakaacaaaapiacaaaaebgpgodjeiabaaaaeiabaaaaaaacpppp
biabaaaadaaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaaaaadaaaaaaaabaa
abaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaibiaiadlaaaaaaaaaaaaaaaa
aaaaaaaafbaaaaafacaaapkahhlohplpaaljdolpaaaahklpaaaaaaiafbaaaaaf
adaaapkaaaaaiadpaaaahpedaaabhoehppachnelbpaaaaacaaaaaaiaaaaaahla
aiaaaaadaaaaaiiaaaaaoelaaaaaoelaahaaaaacaaaaabiaaaaappiaagaaaaac
aaaaabiaaaaaaaiaafaaaaadaaaaaciaaaaaaaiaaaaappkaabaaaaacabaaaiia
acaaaakaaeaaaaaeaaaaabiaaaaaaaiaaaaappkaabaappiaafaaaaadabaaapia
aaaaffiaadaaoekabdaaaaacabaaapiaabaaoeiafiaaaaaeaaaaapiaaaaaaaia
acaaoekbabaaoeiaaeaaaaaeabaaaliaaaaamjiaabaaaakbaaaaoeiaaeaaaaae
abaaaeiaaaaappiaabaaaakbaaaakkiaabaaaaacaaaiapiaabaaoeiappppaaaa
fdeieefcbiabaaaaeaaaaaaaegaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaa
gcbaaaadhcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaaelaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaadkiacaaaaaaaaaaaabaaaaaaddaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaahhlohpdpdiaaaaakpcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaaaaaaiadpaaaahpedaaabhoehppachnelbkaaaaafpcaabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaanpccabaaaaaaaaaaajgapbaiaebaaaaaaaaaaaaaa
aceaaaaaibiaiadlibiaiadlibiaiadlibiaiadlegaobaaaaaaaaaaadoaaaaab
ejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "ps3 " {
Keywords { "SHADOWS_CUBE" }
Vector -1 [_LightPositionRange]
"sce_fp_rsx // 13 instructions using 2 registers
[Configuration]
24
ffffffff000040200001fffe000000000000844002000000
[Offsets]
1
_LightPositionRange 1 0
00000040
[Microcode]
208
8e000100c8011c9dc8000001c8003fe102000500c8001c9dc8000001c8000001
02001b00c8001c9dc8000001c800000102003a00fe021c9dc8000001c8000001
0000000000000000000000000000000002000800c8001c9d00020000c8000001
be773f7f0000000000000000000000001e00020000001c9cc8020001c8000001
00003f800000437f0100477e02ff4b7d1e001000c8001c9dc8000001c8000001
1e7e7e00c8001c9dc8000001c80000011e010400f2001c9f00020000c8000001
80813b80000000000000000000000000
"
}
SubProgram "xbox360 " {
Keywords { "SHADOWS_CUBE" }
Vector 0 [_LightPositionRange]
"ps_360
backbbaaaaaaaanmaaaaaaliaaaaaaaaaaaaaaceaaaaaajaaaaaaaliaaaaaaaa
aaaaaaaaaaaaaagiaaaaaabmaaaaaaflppppadaaaaaaaaabaaaaaabmaaaaaaaa
aaaaaafeaaaaaadaaaacaaaaaaabaaaaaaaaaaeeaaaaaaaafpemgjghgihefagp
hdgjhegjgpgofcgbgoghgfaaaaabaaadaaabaaaeaaabaaaaaaaaaaaahahdfpdd
fpdaaadccodacodcdadddfddcodaaaklaaaaaaaaaaaaaaabaaaaaaaaaaaaaaaa
aaaaaabeabpmaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaeaaaaaaahi
baaaaaaaaaaaaaaeaaaaaaaaaaaaamcbaaabaaabaaaaaaabaaaahafaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadphplohh
dliaiaibaaaaaaaaaaaaaaaaedhpaaaadpiaaaaaehhoabaaelhnacppaaaaaaaa
gaacmeaabcaaaaaaaaaabaaiaaaaccaaaaaaaaaamiabaaaaaaloloaapaaaaaaa
kabaaaaaaaaaaagmocaaaaiakibaaaaaaaaaaaaamcaaaaaamiabaaaaaagmgmaa
kdaapoaamiapaaaaaagmaaaakbaappaamiapaaaaaaaaaaaaoiaaaaaamiapiaaa
aebelbanklaapoaaaaaaaaaaaaaaaaaaaaaaaaaa"
}
SubProgram "gles " {
Keywords { "SHADOWS_CUBE" }
"!!GLES"
}
SubProgram "flash " {
Keywords { "SHADOWS_CUBE" }
Vector 0 [_LightPositionRange]
"agal_ps
c1 0.999 0.003922 0.0 0.0
c2 1.0 255.0 65025.0 16581375.0
[bc]
bcaaaaaaaaaaabacaaaaaaoeaeaaaaaaaaaaaaoeaeaaaaaa dp3 r0.x, v0, v0
akaaaaaaaaaaabacaaaaaaaaacaaaaaaaaaaaaaaaaaaaaaa rsq r0.x, r0.x
afaaaaaaaaaaabacaaaaaaaaacaaaaaaaaaaaaaaaaaaaaaa rcp r0.x, r0.x
adaaaaaaaaaaabacaaaaaaaaacaaaaaaaaaaaappabaaaaaa mul r0.x, r0.x, c0.w
agaaaaaaaaaaabacaaaaaaaaacaaaaaaabaaaaoeabaaaaaa min r0.x, r0.x, c1
adaaaaaaaaaaapacaaaaaaaaacaaaaaaacaaaaoeabaaaaaa mul r0, r0.x, c2
aiaaaaaaabaaapacaaaaaaoeacaaaaaaaaaaaaaaaaaaaaaa frc r1, r0
bfaaaaaaaaaaaeacabaaaappacaaaaaaaaaaaaaaaaaaaaaa neg r0.z, r1.w
bfaaaaaaaaaaalacabaaaapjacaaaaaaaaaaaaaaaaaaaaaa neg r0.xyw, r1.yzww
adaaaaaaaaaaapacaaaaaaoeacaaaaaaabaaaaffabaaaaaa mul r0, r0, c1.y
abaaaaaaaaaaapacaaaaaaoeacaaaaaaabaaaaoeacaaaaaa add r0, r0, r1
aaaaaaaaaaaaapadaaaaaaoeacaaaaaaaaaaaaaaaaaaaaaa mov o0, r0
"
}
SubProgram "glesdesktop " {
Keywords { "SHADOWS_CUBE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_CUBE" }
"!!GLES3"
}
}
 }
}
Dependency "BillboardShader" = "Hidden/Nature/Tree Soft Occlusion Bark Rendertex"
Fallback Off
}