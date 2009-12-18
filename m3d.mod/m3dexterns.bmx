
Strict

Import BRL.Pixmap
Import BRL.FileSystem
Import BRL.StandardIO
Import BRL.GLGraphics

Import "max3d/*.h"
Import "../ode.mod/opende/include/*.h"
Import "../assimp.mod/assimp/include/*.h"

Import "max3d/GLee.c"

Import "max3d/animator.cpp"
Import "max3d/bsptree.cpp"
Import "max3d/api.cpp"
Import "max3d/app.cpp"
Import "max3d/camera.cpp"
Import "max3d/entity.cpp"
Import "max3d/graphics.cpp"
Import "max3d/light.cpp"
Import "max3d/material.cpp"
Import "max3d/math3d.cpp"
Import "max3d/mirror.cpp"
Import "max3d/model.cpp"
Import "max3d/modelutil.cpp"
Import "max3d/object.cpp"
Import "max3d/odephysics.cpp"
Import "max3d/openglgraphics.cpp"
Import "max3d/physics.cpp"
Import "max3d/pivot.cpp"
Import "max3d/resource.cpp"
Import "max3d/renderpass.cpp"
Import "max3d/scene.cpp"
Import "max3d/shaderutil.cpp"
Import "max3d/sprite.cpp"
Import "max3d/std.cpp"
Import "max3d/stdparams.cpp"
Import "max3d/surface.cpp"
Import "max3d/terrain.cpp"
Import "max3d/textureutil.cpp"
Import "max3d/world.cpp"

Extern "C"

Function m3dInitMax3D(importer:Byte Ptr)="m3dInitMax3D"
Function m3dUseDegrees()="m3dUseDegrees"
Function m3dUseRadians()="m3dUseRadians"
Function m3dFlushResources()="m3dFlushResources"
Function m3dRetainResource(obj%)="m3dRetainResource"
Function m3dReleaseResource(obj%)="m3dReleaseResource"

Rem
API CTexture *m3dBlackTexture(){
API CTexture *m3dWhiteTexture(){
API CTexture *m3dCreateTexture( int width,int height,int format,int flags ){
API void m3dSetTextureData( CTexture *texture,const void *data ){
API CTexture *m3dCreate3dTexture( int width,int height,int depth,int format,int flags ){
API void m3dSet3dTextureData( CTexture *texture,const void *data ){
API CTexture *m3dCreateCubeTexture( int size,int format,int flags ){
API void m3dSetCubeTextureData( CTexture *texture,const void *data ){
EndRem

Function m3dBlackTexture%()="m3dBlackTexture"
Function m3dWhiteTexture%()="m3dWhiteTexture"
Function m3dCreateTexture%(width%,height%,format%,flags%)="m3dCreateTexture"
'Function m3dSetTexturePath(texture%,path$z)="m3dSetTexturePath"
Function m3dSetTextureData(texture%,data:Byte Ptr)="m3dSetTextureData"
Function m3dCreate3dTexture%(width%,height%,depth%,format%,flags%)="m3dCreate3dTexture"
Function m3dSet3dTextureData(texture%,data:Byte Ptr)="m3dSet3dTextureData"
Function m3dCreateCubeTexture%(size%,format%,flags%)="m3dCreateCubeTexture"
Function m3dSetCubeTextureData(texture%,data:Byte Ptr)="m3dSetCubeTextureData"

Function m3dCreateShader%(source$z)="m3dCreateShader"

Rem
API CMaterial *m3dCreateMaterial(){
API void m3dSetMaterialName( CMaterial *material,const char *name ){
API const char *m3dGetMaterialName( CMaterial *material ){
API void m3dSetMaterialFloat( CMaterial *material,const char *name,float value ){
API void m3dSetMaterialColor( CMaterial *material,const char *name,float red,float green,float blue ){
API void m3dSetMaterialTexture( CMaterial *material,const char *name,CTexture *texture ){
EndRem

Function m3dCreateMaterial%()="m3dCreateMaterial"
Function m3dSetMaterialFloat(material%,name$z,value#)="m3dSetMaterialFloat"
Function m3dSetMaterialColor(material%,name$z,red#,green#,blue#)="m3dSetMaterialColor"
Function m3dSetMaterialTexture(material%,name$z,texture%)="m3dSetMaterialTexture"

Rem
API CModelSurface *m3dCreateSurface( CMaterial *material,CModel *model ){
API void m3dSetSurfaceShader( CModelSurface *surface,CShader *shader ){
API CShader *m3dGetSurfaceShader( CModelSurface *surface ){
API void m3dSetSurfaceMaterial( CModelSurface *surface,CMaterial *material ){
API CMaterial *m3dGetSurfaceMaterial( CModelSurface *surface ){
API void m3dClearSurface( CModelSurface *surface ){
API void m3dAddSurfaceVertex( CModelSurface *surface,float x,float y,float z,float s0,float t0 ){
API void m3dAddSurfaceTriangle( CModelSurface *surface,int vertex0,int vertex1,int vertex2 ){
EndRem

Function m3dCreateSurface%(material%,model%)="m3dCreateSurface"
Function m3dSetSurfaceShader(surface%,shader%)="m3dSetSurfaceShader"
Function m3dSurfaceShader%(surface%)="m3dSurfaceShader"
Function m3dSetSurfaceMaterial(surface%,material%)="m3dSetSurfaceMaterial"
Function m3dSurfaceMaterial%(surface%)="m3dSurfaceMaterial"
Function m3dClearSurface(surface%)="m3dClearSurface"
Function m3dAddSurfaceVertex(surface%,x#,y#,z#,s0#,t0#)="m3dAddSurfaceVertex"
Function m3dAddSurfaceTriangle(surface%,vertex0%,vertex1%,vertex2%)="m3dAddSurfaceTriangle"

Rem
API void m3dDestroyEntity( CEntity *entity ){
API CEntity *m3dCopyEntity( CEntity *entity ){
API void m3dShowEntity( CEntity *entity ){
API void m3dHideEntity( CEntity *entity ){
API void m3dSetEntityParent( CEntity *entity,CEntity *parent ){
API CEntity *m3dEntityParent( CEntity *entity ){
API float m3dEntityMatrixElement( CEntity *entity,int row,int column ){
EndRem

Function m3dDestroyEntity(entity%)="m3dDestroyEntity"
Function m3dCopyEntity%(entity%)="m3dCopyEntity"
Function m3dShowEntity(entity%)="m3dShowEntity"
Function m3dHideEntity(entity%)="m3dHideEntity"
Function m3dSetEntityParent(entity%,parent%)="m3dSetEntityParent"
Function m3dEntityParent%(entity%)="m3dEntityParent"
Function m3dEntityMatrixElement#(entity%,row,column)="m3dEntityMatrixElement"

Function m3dSetEntityTranslation(entity%,x#,y#,z#)="m3dSetEntityTranslation"
Function m3dSetEntityRotation(entity%,yaw#,pitch#,roll#)="m3dSetEntityRotation"
Function m3dSetEntityScale(entity%,x#,y#,z#)="m3dSetEntityScale"
Function m3dMoveEntity(entity%,x#,y#,z#)="m3dMoveEntity"
Function m3dTurnEntity(entity%,yaw#,pitch#,roll#)="m3dTurnEntity"
Function m3dEntityX#(entity%)="m3dEntityX"
Function m3dEntityY#(entity%)="m3dEntityY"
Function m3dEntityZ#(entity%)="m3dEntityZ"
'Function m3dLoadModel%(path$z,collType%,mass#)="m3dLoadModel"
Function m3dCreateModel%()="m3dCreateModel"
Function m3dCreateSphere%(material%,radius#,collType%,mass#)="m3dCreateSphere"
Function m3dCreateCapsule%(material%,radius#,length#,collType%,mass#)="m3dCreateCapsule"
Function m3dCreateCylinder%(material%,radius#,length#,collType%,mass#)="m3dCreateCylinder"
Function m3dCreateBox%(material%,width#,height#,depth#,collType%,mass#)="m3dCreateBox"
Function m3dAddModelSurface(model%,surface%)="m3dAddModelSurface"

Function m3dUpdateModelNormals(model%)="m3dUpdateModelNormals"
Function m3dUpdateModelTangents(model%)="m3dUpdateModelTangents"

Function m3dScaleModelTexCoords(model%,s_scale#,t_scale#)="m3dScaleModelTexCoords"
Function m3dResetModelTransform(model%)="m3dResetModelTransform"
Function m3dFlipModel(model%)="m3dFlipModel"
Function m3dCreatePivot%()="m3dCreatePivot"
Function m3dCreateCamera%()="m3dCreateCamera"
Function m3dSetCameraViewport(camera%,x%,y%,width%,height%)="m3dSetCameraViewport"
Function m3dSetCameraOrtho(camera%,Left#,Right#,bottom#,top#,zNear#,zFar#)="m3dSetCameraOrtho"
Function m3dSetCameraFrustum(camera%,Left#,Right#,bottom#,top#,zNear#,zFar#)="m3dSetCameraFrustum"
Function m3dSetCameraPerspective(camera%,fovy#,aspect#,zNear#,zFar#)="m3dSetCameraPerspective"
Function m3dCreateSpotLight%()="m3dCreateSpotLight"
Function m3dCreatePointLight%()="m3dCreatePointLight"
Function m3dCreateDistantLight%()="m3dCreateDistantLight"
Function m3dSetLightAngle(light%,angle#)="m3dSetLightAngle"
Function m3dSetLightRange(light%,range#)="m3dSetLightRange"
Function m3dSetLightColor(light%,red#,green#,blue#)="m3dSetLightColor"
Function m3dSetLightTexture(light%,texture%)="m3dSetLightTexture"
Function m3dSetLightShadowSize(light%,size%)="m3dSetLightShadowSize"
Function m3dSetLightShadowSplits(light%,splitCount%,znear#,zfar#,blend#)="m3dSetLightShadowSplits"
Function m3dSetLightShadowSplitsTable(light%,floatCount%,floats:Byte Ptr)="m3dSetLightShadowSplitsTable"
Function m3dCreateSprite%(material%)="m3dCreateSprite"
Function m3dCreateTerrain%(material%,xsize%,zsize%,width#,height#,depth#)="m3dCreateTerrain"
Function m3dSetTerrainHeight(terrain%,height#,x%,z%)="m3dSetTerrainHeight"
Function m3dCreateMirror%()="m3dCreateMirror"
Function m3dSetMirrorSize(mirror%,width#,height#)="m3dSetMirrorSize"
Function m3dSetMirrorResolution(mirror%,width%,height%)="m3dSetMirrorResolution"
Function m3dCreateSphereBody(entity%,radius#,collType%,mass#)="m3dCreateSphereBody"
Function m3dCreateCapsuleBody(entity%,radius#,length#,collType%,mass#)="m3dCreateCapsuleBody"
Function m3dCreateCylinderBody(entity%,radius#,length#,collType%,mass#)="m3dCreateCylinderBody"
Function m3dCreateBoxBody(entity%,width#,height#,depth#,collType%,mass#)="m3dCreateBoxBody"
Function m3dCreateSurfaceBody(entity%,surface%,collType%,mass#)="m3dCreateSurfaceBody"
Function m3dCreateModelBody(entity%,model%,collType%,mass#)="m3dCreateModelBody"
Function m3dCreateTerrainBody(entity%,terrain%,collType%,mass#)="m3dCreateTerrainBody"
Function m3dCreateBallJoint(entity%,body1%,body2%)="m3dCreateBallJoint"
Function m3dCreateAnimator(entity%)="m3dCreateAnimator"
Function m3dSetAnimationKey(entity%,seq%,time#,keyEntity%,flags%)="m3dSetAnimationKey"
Function m3dSetAnimatorTime(entity%,seq%,time#)="m3dSetAnimatorTime"
Function m3dEnableShadows()="m3dEnableShadows"
Function m3dDisableShadows()="m3dDisableShadows"
Function m3dEnableCollisions(collType1%,collType2%,friction#,bounciness#,stiffness#)="m3dEnableCollisions"
Function m3dSetGravity(x#,y#,z#)="m3dSetGravity"
Function m3dSetClearColor(r#,g#,b#)="m3dSetClearColor"
Function m3dSetAmbientColor(r#,g#,b#)="m3dSetAmbientColor"
Function m3dUpdateWorld()="m3dUpdateWorld"
Function m3dRenderWorld()="m3dRenderWorld"

End Extern


Rem

//***** App API *****
//

/// Initalize Max3d - must be called before any other commands

API void m3dInitMax3D( void *importer,int flags ){
API void m3dUseDegrees(){
API void m3dUseRadians(){
API void m3dSetObjectImportPath( CObject *obj,const char *path ){
API const char *m3dGetObjectImportPath( CObject *obj ){

//***** Object API *****

_API const char *m3dMax3dObjectType( CObject *obj ){
_API void m3dSaveMax3dObject( CObject *obj,const char *path ){
_API CObject *m3dLoadMax3dObject( const char *path ){

//***** Resource API ******

API void m3dFlushResources(){
API void m3dRetainResource( CResource *obj ){
API void m3dReleaseResource( CResource *obj ){

//***** Texture API *****

API CTexture *m3dBlackTexture(){
API CTexture *m3dWhiteTexture(){
API CTexture *m3dCreateTexture( int width,int height,int format,int flags ){
API void m3dSetTextureData( CTexture *texture,const void *data ){
API CTexture *m3dCreate3dTexture( int width,int height,int depth,int format,int flags ){
API void m3dSet3dTextureData( CTexture *texture,const void *data ){
API CTexture *m3dCreateCubeTexture( int size,int format,int flags ){
API void m3dSetCubeTextureData( CTexture *texture,const void *data ){

//***** Shader API *****

API CShader *m3dCreateShader( const char *source ){

//***** Material API *****

API CMaterial *m3dCreateMaterial(){
API void m3dSetMaterialName( CMaterial *material,const char *name ){
API const char *m3dGetMaterialName( CMaterial *material ){
API void m3dSetMaterialFloat( CMaterial *material,const char *name,float value ){
API void m3dSetMaterialColor( CMaterial *material,const char *name,float red,float green,float blue ){
API void m3dSetMaterialTexture( CMaterial *material,const char *name,CTexture *texture ){

//***** Surface API *****

API CModelSurface *m3dCreateSurface( CMaterial *material,CModel *model ){
API void m3dSetSurfaceShader( CModelSurface *surface,CShader *shader ){
API CShader *m3dGetSurfaceShader( CModelSurface *surface ){
API void m3dSetSurfaceMaterial( CModelSurface *surface,CMaterial *material ){
API CMaterial *m3dGetSurfaceMaterial( CModelSurface *surface ){
API void m3dClearSurface( CModelSurface *surface ){
API void m3dAddSurfaceVertex( CModelSurface *surface,float x,float y,float z,float s0,float t0 ){
API void m3dAddSurfaceTriangle( CModelSurface *surface,int vertex0,int vertex1,int vertex2 ){

//***** Entity API *****

API void m3dDestroyEntity( CEntity *entity ){
API CEntity *m3dCopyEntity( CEntity *entity ){
API void m3dShowEntity( CEntity *entity ){
API void m3dHideEntity( CEntity *entity ){
API void m3dSetEntityParent( CEntity *entity,CEntity *parent ){
API CEntity *m3dEntityParent( CEntity *entity ){
API float m3dEntityMatrixElement( CEntity *entity,int row,int column ){

// Translation stuff...

API void m3dSetEntityTranslation( CEntity *entity,float x,float y,float z ){
API void m3dMoveEntity( CEntity *entity,float x,float y,float z ){
API float m3dEntityX( CEntity *entity ){
API float m3dEntityY( CEntity *entity ){
API float m3dEntityZ( CEntity *entity ){

// Rotation stuff...

API void m3dSetEntityRotation( CEntity *entity,float yaw,float pitch,float roll ){
API void m3dTurnEntity( CEntity *entity,float yaw,float pitch,float roll ){
API float m3dEntityYaw( CEntity *entity ){
API float m3dEntityPitch( CEntity *entity ){
API float m3dEntityRoll( CEntity *entity ){

// Scale stuff

API void m3dSetEntityScale( CEntity *entity,float x,float y,float z ){

//***** Model API *****

API CModel *m3dLoadModel( const char *path,int collType,float mass ){
API CModel *m3dCreateModel(){
API CModel *m3dCreateSphere( CMaterial *material,float radius,int collType,float mass ){
API CModel *m3dCreateCapsule( CMaterial *material,float radius,float length,int collType,float mass ){
API CModel *m3dCreateCylinder( CMaterial *material,float radius,float length,int collType,float mass ){
API CModel *m3dCreateBox( CMaterial *material,float width,float height,float depth,int collType,float mass ){

API int m3dCountModelSurfaces( CModel *model ){
API CModelSurface *m3dGetModelSurface( CModel *model,int index ){

API void m3dUpdateModelNormals( CModel *model ){
API void m3dUpdateModelTangents( CModel *model ){
API void m3dScaleModel( CModel *model,float x,float y,float z ){
API void m3dScaleModelSurfaces( CModel *model,float x,float y,float z ){
API void m3dScaleModelTexCoords( CModel *model,float s_scale,float t_scale ){
API void m3dResetModelTransform( CModel *model ){
API void m3dFlipModel( CModel *model ){
API void m3dSplitModelEdges( CModel *model,float maxlength ){

//***** Pivot API *****

API CEntity *m3dCreatePivot(){

//***** Camera API *****

API CCamera *m3dCreateCamera(){
API void m3dSetCameraViewport( CCamera *camera,int x,int y,int width,int height ){
API void m3dSetCameraOrtho( CCamera *camera,float left,float right,float bottom,float top,float zNear,float zFar ){
API void m3dSetCameraFrustum( CCamera *camera,float left,float right,float bottom,float top,float zNear,float zFar ){
API void m3dSetCameraPerspective( CCamera *camera,float fovy,float aspect,float zNear,float zFar ){

static CVec3 projectedPoint;
API int m3dCameraProject( CCamera *camera,float x,float y,float z ){
API float m3dProjectedPoint( int coord ){

static float pickedTime;
static CVec3 pickedPoint;
static CVec3 pickedNormal;
static CEntity *pickedEntity;

API CEntity *m3dCameraPick( CCamera *camera,float viewport_x,float viewport_y,int collType ){
API float m3dPickedPoint( int coord ){
API float m3dPickedNormal( int coord ){
API CEntity *m3dPickedEntity(){
API float m3dPickedTime(){

//***** Light API *****

API CLight *m3dCreateSpotLight(){
API CLight *m3dCreatePointLight(){
API CLight *m3dCreateDistantLight(){
API void m3dSetLightAngle( CLight *light,float angle ){
API void m3dSetLightRange( CLight *light,float range ){
API void m3dSetLightColor( CLight *light,float red,float green,float blue ){
API void m3dSetLightTexture( CLight *light,CTexture *texture ){
API void m3dSetLightShadowSize( CLight *light,int size ){
API void m3dSetLightShadowSplits( CLight *light,int splitCount,float znear,float zfar,float blend ){
API void m3dSetLightShadowSplitsTable( CLight *light,int floatCount,const void *floats ){

//***** Sprite API *****

API CSprite *m3dCreateSprite( CMaterial *material ){

//***** Terrain API *****

API CTerrain *m3dCreateTerrain( CMaterial *material,int xsize,int zsize,float width,float height,float depth ){
API void m3dSetTerrainHeight( CTerrain *terrain,float height,int x,int z ){

//***** Mirror *****

API CMirror *m3dCreateMirror(){
API void m3dSetMirrorSize( CMirror *mirror,float width,float height ){
API void m3dSetMirrorResolution( CMirror *mirror,int width,int height ){

//***** Physics *****

API void m3dCreateSphereBody( CEntity *entity,float radius,int collType,float mass ){
API void m3dCreateCapsuleBody( CEntity *entity,float radius,float length,int collType,float mass ){
API void m3dCreateCylinderBody( CEntity *entity,float radius,float length,int collType,float mass ){
API void m3dCreateBoxBody( CEntity *entity,float width,float height,float depth,int collType,float mass ){
API void m3dCreateSurfaceBody( CEntity *entity,CModelSurface *surface,int collType,float mass ){
API void m3dCreateModelBody( CEntity *entity,CModel *model,int collType,float mass ){
API void m3dCreateTerrainBody( CEntity *entity,CTerrain *terrain,int collType,float mass ){
API void m3dCreateBallJoint( CEntity *entity,CEntity *body1,CEntity *body2 ){

//***** Animator ******

API void m3dCreateAnimator( CEntity *entity ){
API void m3dSetAnimationKey( CEntity *entity,int seq,float time,CEntity *keyEntity,int flags ){
API void m3dSetAnimatorTime( CEntity *entity,int seq,float time ){

//***** World API *****//

API void m3dEnableShadows(){
API void m3dDisableShadows(){
API void m3dEnableCollisions( int collType1,int collType2,float friction,float bounciness,float stiffness ){
API void m3dSetGravity( float x,float y,float z ){
API void m3dSetClearColor( float r,float g,float b ){
API void m3dSetAmbientColor( float r,float g,float b ){
API void m3dUpdateWorld(){
API void m3dRenderWorld(){

//***** RenderPass API *****
API void m3dAddRenderPass( CShader *shader,CMaterial *material ){
API void m3dClearRenderPasses(){

//***** BSPTree API *****//

_API CBSPTree *CreateModelBSP( CModel *model ){
_API int m3dCountBSPNodes( CBSPTree *tree ){
_API int m3dCountBSPLeaves( CBSPTree *tree ){
_API CModel *CreateBSPModel( CBSPTree *tree ){
EndRem
