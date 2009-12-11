
Strict

Import brl.map
Import blitz3d.blitz3dsdk
Import axe3d.Blitz3D

Import "m3dutil.bmx"

blitz3d_driver = New TM3DDriver

Type TM3DTexture Extends TTexture
	Global _all:TMap=New TMap	
	Field _handle
	Field _pixmap:TPixmap

	Method Init:TM3DTexture(handle)
		Local key$=String(handle)
		_handle=handle
		MapInsert _all,key,Self
		Return Self
	End Method

	Function h(a:TTexture)
		If TM3DTexture(a) Return TM3DTexture(a)._handle
	End Function
	
	Function t:TTexture(handle)
		Local key$=String(handle)
		If MapContains(_all,key)
			Return TTexture(MapValueForKey(_all,key))
		EndIf
		Return New TM3DTexture.Init(handle)
	End Function

	Method FreeTexture()
		bbFreeTexture _handle
	End Method
	
	Method TextureBuffer:TPixmap(frame)
		Return _pixmap
	End Method

	Method TextureBlend(blend_no)
		bbTextureBlend _handle,blend_no
	End Method
	
	Method TextureCoords(coords_no)
		bbTextureCoords _handle,coords_no
	End Method
	
	Method ScaleTexture(u#,v#)
		bbScaleTexture _handle,u,v
	End Method
	
	Method PositionTexture(u#,v#)
		bbPositionTexture _handle,u,v
	End Method

	Method RotateTexture(angle#)
		bbRotateTexture _handle,angle
	End Method

	Method TextureWidth()
		Return _pixmap.width
	End Method

	Method TextureHeight()
		Return bbTextureHeight(_handle)
	End Method

	Method TextureName$()
		Return bbTextureName(_handle)
	End Method

	Method SetCubeFace(face)
		bbSetCubeFace _handle,face
	End Method

	Method SetCubeMode(mode)
		bbSetCubeMode _handle,mode
	End Method
		
End Type

Type TM3DSurface Extends TSurface
	Global _all:TMap=New TMap
	Field _handle
	Field _brush:TM3DBrush

	Method Init:TM3DSurface(handle)
		Local key$=String(handle)
		_handle=handle
		MapInsert _all,key,Self
		Return Self
	End Method

	Function h(a:TSurface)
		If TM3DSurface(a) Return TM3DSurface(a)._handle
	End Function
	
	Function s:TM3DSurface(handle)
		Local key$=String(handle)
		If MapContains(_all,key)
			Return TM3DSurface(MapValueForKey(_all,key))
		EndIf
		Return New TM3DSurface.Init(handle)
	End Function

	Method GetSurfaceBrush:TBrush()	
		Return _brush
	End Method
	
	Method PaintSurface(brush:TBrush)
		_brush=TM3DBrush(brush)
		bbPaintSurface(_handle,_brush._handle)
	End Method
	
	Method ClearSurface(clear_verts,clear_tris)
		bbClearSurface _handle,clear_verts,clear_tris
	End Method
	
	Method AddVertex(x#,y#,z#,u#=0.0,v#=0.0,w#=0.0)
		bbAddVertex _handle,x,y,z,u,v,w
	End Method
	
	Method AddTriangle(v0,v1,v2)
		bbAddTriangle _handle,v0,v1,v2
	End Method
	
	Method CountVertices()
		Return bbCountVertices(_handle)
	End Method
	
	Method CountTriangles()
		Return bbCountTriangles(_handle)
	End Method
	
	Method VertexCoords(v,x#,y#,z#)
		bbVertexCoords _handle,v,x,y,z
	End Method
	
	Method VertexColor(v,r#,g#,b#,a#=1.0)
		bbVertexColor _handle,v,r,g,b,a
	End Method

	Method VertexNormal(v,nx#,ny#,nz#)
		bbVertexNormal _handle,v,nx,ny,nz
	End Method

	Method VertexTexCoords(vid,u#,v#,w#,coord_set)
		bbVertexTexCoords _handle,u,v,w,coord_set
	End Method

	Method VertexX#(v)
		Return bbVertexX(_handle,v)
	End Method
	
	Method VertexY#(v)
		Return bbVertexY(_handle,v)
	End Method

	Method VertexZ#(v)
		Return bbVertexZ(_handle,v)
	End Method

	Method VertexRed#(v)
		Return bbVertexRed(_handle,v)
	End Method

	Method VertexGreen#(v)
		Return bbVertexGreen(_handle,v)
	End Method

	Method VertexBlue#(v)
		Return bbVertexBlue(_handle,v)
	End Method

	Method VertexAlpha#(v)
		Return bbVertexAlpha(_handle,v)
	End Method

	Method VertexNX#(v)
		Return bbVertexNX(_handle,v)
	End Method

	Method VertexNY#(v)
		Return bbVertexNX(_handle,v)
	End Method

	Method VertexNZ#(v)
		Return bbVertexNZ(_handle,v)
	End Method

	Method VertexU#(v,coord_set=0)
		Return bbVertexU(_handle,v)
	End Method

	Method VertexV#(v,coord_set=0)
		Return bbVertexV(_handle,v)
	End Method

	Method VertexW#(v,coord_set=0)
		Return bbVertexW(_handle,v)
	End Method

	Method TriangleVertex(tri_no,corner)
		Return bbTriangleVertex(_handle,tri_no,corner)
	End Method

	Method UpdateNormals()
		bbUpdateNormals _handle
	End Method
	
End Type

Type TM3DBrush Extends TBrush
	Global _all:TMap=New TMap	
	Field _handle

	Method Init:TM3DBrush(handle)
		Local key$=String(handle)
		_handle=handle
		MapInsert _all,key,Self
		Return Self
	End Method

	Function h(a:TBrush)
		If TM3DBrush(a) Return TM3DBrush(a)._handle
	End Function
	
	Function b:TBrush(handle)
		Local key$=String(handle)
		If MapContains(_all,key)
			Return TBrush(MapValueForKey(_all,key))
		EndIf
		Return New TM3DBrush.Init(handle)
	End Function
	
	Function LoadBrush:TBrush(texture_path$,flags=1,u_scale#=1,v_scale#=1) 
		Local mat
		mat=m3dcreatematerial()
		m3dSetMaterialColor mat,"DiffuseColor",1,1,1		
		Return New TM3dBrush.Init(mat)
	End Function
	
	Function CreateBrush:TBrush(red#,green#,blue#)
		Local mat
		mat=m3dcreatematerial()
		m3dSetMaterialColor mat,"DiffuseColor",red,green,blue		
		Return New TM3dBrush.Init(mat)
	End Function
	
	Method FreeBrush()
	End Method

	Method GetBrushTexture:TTexture(index=0)
		Return Null
	End Method

	Method Copy:TBrush()
		Return b(bbCreateBrush(_handle))
	End Method
			
	Method BrushColor(r#,g#,b#)
		bbBrushColor _handle,r,g,b
	End Method
	
	Method BrushAlpha(a#)
		bbBrushAlpha _handle,a
	End Method
	
	Method BrushShininess(s#)
		bbBrushShininess _handle,s
	End Method
	
	Method BrushTexture(texture:TTexture,frame=0,index=0)
		bbBrushTexture _handle,TM3DTexture.h(texture),frame,index
	End Method
	
	Method BrushBlend(blend_no)
		bbBrushBlend _handle,blend_no
	End Method
	
	Method BrushFX(fx_no)
		bbBrushFX _handle,fx_no
	End Method
	
End Type

Type TM3DEntity Extends TEntity
	Global _all:TMap=New TMap
	Field _handle
	Field _brush:TM3DBrush
	Field _parent:TM3DEntity
	Field _kids:TList=New TList
	
	Method Init:TM3DEntity(handle,parent:TM3DEntity)
		Local key$=String(handle)
		_handle=handle
		MapInsert _all,key,Self
		_parent=parent
		If parent	
			parent._kids.addlast Self
		EndIf
		Return Self
	End Method
		
	Function h(e:TEntity)
		If TM3DEntity(e) Return TM3DEntity(e)._handle
	End Function
	
	Function e:TEntity(handle)
		Local key$=String(handle)
		If MapContains(_all,key)
			Return TEntity(MapValueForKey(_all,key))
		EndIf
		Return New TM3DEntity.Init(handle,Null)
	End Function

	Method SetParent(parent:TEntity,glob=True) 
		bbEntityParent h(parent),glob
	End Method
	
	Method GetParent:TEntity() 
		Return e(bbGetParent(_handle))
	End Method

	Method EntityClass$() 
		Return bbEntityClass(_handle)
	End Method

	Method EntityName$() 
		Return bbEntityName(_handle)
	End Method

	Method CountChildren() 
		Return bbCountChildren(_handle)
	End Method

	Method GetChild:TEntity(child_no) 
		Return e(bbGetChild(_handle,child_no))
	End Method

	Method FindChild:TEntity(name$) 
		Return e(bbFindChild(_handle,name))
	End Method

	Method CopyEntity:TEntity(parent:TEntity=Null) 
		Return e(bbCopyEntity(_handle,h(parent)))
	End Method

	Method FreeEntity() 
		bbFreeEntity _handle
	End Method

	Method PositionEntity(x#,y#,z#,glob=False) 
		bbPositionEntity _handle,x,y,z,glob
	End Method
	
	Method MoveEntity(mx#,my#,mz#) 
		m3dMoveEntity _handle,mx#,my#,mz#
	End Method

	Method TranslateEntity(tx#,ty#,tz#,glob=False) 
	End Method

	Method ScaleEntity(x#,y#,z#,glob=False) 
'		m3dScaleEntity _handle,x,y,z,glob
	End Method
	
	Method RotateEntity(x#,y#,z#,glob=False) 	
'		m3dRotateEntity _handle,x,y,z,glob
	End Method

	Method TurnEntity(x#,y#,z#,glob=False) 
		m3dTurnEntity _handle,x,y,z
	End Method

	Method PointEntity(target:TEntity,roll#=0) 
'		bbPointEntity _handle,h(target),roll
	End Method

	Method AlignToVector(vector_x#,vector_y#,vector_z#,axis,rate#=1.0)
		bbAlignToVector _handle,vector_x#,vector_y#,vector_z#,axis,rate#
	End Method
	
	Method LoadAnimSeq(path$) 
		bbLoadAnimSeq _handle,path
	End Method

	Method ExtractAnimSeq(first_frame,last_frame,seq=0) 
		bbExtractAnimSeq _handle,first_frame,last_frame,seq
	End Method

	Method Animate(mode=1,speed#=1.0,seq=0,trans=0) 
		bbAnimate _handle,mode,speed,seq,trans
	End Method

	Method SetAnimTime(time#,seq=0) 
		bbSetAnimTime _handle,time,seq
	End Method

	Method AnimSeq() 
		Return bbAnimSeq(_handle)
	End Method
	
	Method AnimLength() 
		Return bbAnimLength(_handle)
	End Method
	
	Method AnimTime#() 
		Return bbAnimTime(_handle)
	End Method

	Method Animating() 
		Return bbAnimating(_handle)
	End Method

	Method EntityColor(r#,g#,b#) 
		bbEntityColor(_handle,r#,g#,b#)
	End Method

	Method EntityShininess(s#) 
		bbEntityShininess(_handle,s#)
	End Method

	Method EntityTexture(texture:TTexture,frame=0,index=0) 
		bbEntityTexture _handle,TM3DTexture.h(texture),frame,index 
	End Method

	Method EntityBlend(blend_no) 
		bbEntityBlend _handle,blend_no
	End Method

	Method EntityFX(fx_no) 
		bbEntityFX _handle,fx_no
	End Method

	Method EntityAutoFade(near#,far#) 
		bbEntityAutoFade _handle,near#,far#
	End Method

	Method PaintEntity(brush:TBrush) 
		_brush=TM3DBrush(brush)
		bbPaintEntity _handle,TM3DBrush.h(brush)
	End Method

	Method ShowEntity() 
		bbShowEntity _handle
	End Method

	Method HideEntity() 
		bbHideEntity _handle
	End Method

	Method NameEntity(name$) 
		bbNameEntity _handle,name
	End Method

	Method EntityX#(glob=False) 
		Return bbEntityX(_handle,glob)
	End Method

	Method EntityY#(glob=False) 	
		Return bbEntityY(_handle,glob)
	End Method

	Method EntityZ#(glob=False) 	
		Return bbEntityZ(_handle,glob)
	End Method

	Method EntityPitch#(glob=False) 
		Return bbEntityPitch(_handle,glob)
	End Method

	Method EntityYaw#(glob=False) 
		Return bbEntityYaw(_handle,glob)
	End Method

	Method EntityRoll#(glob=False) 
		Return bbEntityRoll(_handle,glob)
	End Method


	Method EntityPick:TEntity(range#) 
		Return e(bbEntityPick(_handle,range))
	End Method

	Method LinePick:TEntity(x#,y#,z#,dx#,dy#,dz#,radius#=0.0)
		Return e(bbLinePick(x,y,z,dx,dy,dz,radius))
	End Method
	
	Method DeltaYaw#(dest:TEntity) 
		Return bbDeltaYaw(_handle,h(dest))
	End Method

	Method DeltaPitch#(dest:TEntity) 
		Return bbDeltaPitch(_handle,h(dest))
	End Method
	
	Method GetMatElement#(row,col) 
		Return bbGetMatElement(_handle,row,col)
	End Method

	Method ResetEntity() 
		bbResetEntity _handle
	End Method

	Method EntityRadius(rx#,ry#=0.0) 
		bbEntityRadius _handle,rx,ry
	End Method

	Method EntityBox(x#,y#,z#,w#,h#,d#) 	
		bbEntityBox _handle,x,y,z,w,h,d
	End Method

	Method EntityType(type_no,recursive=False) 	
		bbEntityType _handle,type_no,recursive
	End Method

	Method EntityPickMode(no,obscure=True) 	
		bbEntityPickMode _handle,no,obscure
	End Method

	Method EntityCollided:TEntity(type_no) 
		Return e(bbEntityCollided(_handle,type_no))
	End Method

	Method CountCollisions() 
		Return bbCountCollisions(_handle)
	End Method

	Method CollisionX#(index) 
		Return bbCollisionX(_handle,index)
	End Method

	Method CollisionY#(index) 
		Return bbCollisionY(_handle,index)
	End Method

	Method CollisionZ#(index) 
		Return bbCollisionZ(_handle,index)
	End Method

	Method CollisionNX#(index) 
		Return bbCollisionNX(_handle,index)
	End Method

	Method CollisionNY#(index) 
		Return bbCollisionNY(_handle,index)
	End Method

	Method CollisionNZ#(index) 
		Return bbCollisionNZ(_handle,index)
	End Method

	Method CollisionTime#(index) 
		Return bbCollisionTime(_handle,index)
	End Method

	Method CollisionEntity:TEntity(index) 
		Return e(bbCollisionEntity(_handle,index))
	End Method

	Method CollisionSurface:TSurface(index) 
		Return TM3DSurface.s(bbCollisionSurface(_handle,index))
	End Method

	Method CollisionTriangle(index) 
		Return bbCollisionX(_handle,index)
	End Method

	Method MeshCullRadius(radius#) 
	End Method

	Method EntityScaleX#(glob=False) 
		Return 1
	End Method

	Method EntityScaleY#(glob=False) 
		Return 1
	End Method

	Method EntityScaleZ#(glob=False) 
		Return 1
	End Method

	Method GetEntityType() 
		Return bbGetEntityType(_handle)
	End Method

	Method GetEntityBrush:TBrush() 
		Return _brush
	End Method

	Method EntityOrder(order_no) 
		bbEntityOrder _handle,order_no
	End Method
	
	Method LightRange(range#)
	End Method
	
	Method LightColor(red#,green#,blue#)
	End Method

	Method LightConeAngles(inner_angle#,outer_angle#)
	End Method

	Method CameraClsColor(r#,g#,b#)
	End Method
	
End Type


Type TM3DDriver Extends TBlitz3DDriver

	Function h(e:TM3DEntity)
		If e Return e._handle
	End Function

	Method CreateBrush:TBrush(red#,green#,blue#) 
		Return TM3DBrush.CreateBrush(red,green,blue)
	End Method	

	Method LoadBrush:TBrush(texture_path$,flags=1,u_scale#=1,v_scale#=1) 
		Return TM3DBrush.LoadBrush(texture_path,flags,u_scale,v_scale)
	End Method	

	Method LoadTexture:TTexture(file$,flags=1)
	End Method
	
	Method CreateTexture:TTexture(width,height,flags=0,frames=1)
	End Method

	Method CreateMesh:TEntity(parent:TEntity=Null) 
		Local box
		Local mat
		
		mat=m3dCreateMaterial()
		m3dSetMaterialColor mat,"DiffuseColor",1,1,1		
		box=m3dCreateBox(mat,1,1,1,0,0)
		Return New TM3DEntity.init(box,TM3DEntity(parent))
	End Method	

	Method CreatePivot:TEntity(parent:TEntity=Null) 
	End Method

	Method CreateSphere:TEntity(segments=8,parent:TEntity=Null) 
	End Method	

	Method CreateCylinder:TEntity(segments=8,solid=True,parent:TEntity=Null) 
	End Method

	Method CreateCone:TEntity(segments=8,solid=True,parent:TEntity=Null) 
	End Method

	Method CreatePlane:TEntity(divisions=1,parent:TEntity=Null) 
	End Method

	Method CreateMirror:TEntity(parent:TEntity=Null) 
	End Method

	Method CreateLight:TEntity(light_type,parent:TEntity=Null)
		Local light
		light=m3dCreatePointLight()
		Return New TM3DEntity.init(light,TM3DEntity(parent))
	End Method

	Method CreateCube:TEntity(parent:TEntity=Null)
		Local box
		Local mat
		
		mat=m3dCreateMaterial()
		m3dSetMaterialColor mat,"DiffuseColor",1,1,1		
		box=m3dCreateBox(mat,1,1,1,0,0)
		Return New TM3DEntity.init(box,TM3DEntity(parent))
	End Method

	Method CreateCamera:TEntity(parent:TEntity=Null)
		Local cam
		cam=m3dCreateCamera()
		Return New TM3DEntity.init(cam,TM3DEntity(parent))
	End Method
	
	Method Graphics3D:TGraphics(w,h,d=0,m=0,r=60)
		m3dUseDegrees	
		m3dGraphics w,h,d
	End Method

	Method AntiAlias(aatype)
	End Method
	
	Method Wireframe(enable)
	End Method

	Method AmbientLight(r#,g#,b#)
		m3dSetAmbientColor r#,g#,b#
	End Method

	Method ClearWorld(entities=True,brushes=True,textures=True) 
	End Method
	
	Method RenderWorld(tween#=1.0) 
		m3dRenderWorld
	End Method
	
	Method TrisRendered() 
	End Method

	Method ClearCollisions() 
	End Method

	Method Collisions(src_no,dest_no,method_no,response_no) 
	End Method

	Method CaptureWorld() 
	End Method

	Method UpdateWorld(anim_speed#=1.0) 
		m3dUpdateWorld
	End Method

	Field tformx#	
	Field tformy#	
	Field tformz#	
	
	Field projx#	
	Field projy#	
	Field projz#	
	
	Method TFormPoint(x#,y#,z#,src_ent:TEntity,dest_ent:TEntity)
	End Method
		
	Method TFormVector(x#,y#,z#,src_ent:TEntity,dest_ent:TEntity)
	End Method

	Method TFormNormal(x#,y#,z#,src_ent:TEntity,dest_ent:TEntity)
	End Method

	Method TFormedX#()
		Return tformx		
	End Method
	
	Method TFormedY#()
		Return tformy		
	End Method
	
	Method TFormedZ#()
		Return tformz		
	End Method

	Method ProjectedX#()
		Return projx		
	End Method
	
	Method ProjectedY#()
		Return projy		
	End Method
	
	Method ProjectedZ#()
		Return projz		
	End Method

	Method LinePick:TEntity(x#,y#,z#,dx#,dy#,dz#,radius#)
	End Method
	Method PickedX#()
	End Method
	Method PickedY#()
	End Method
	Method PickedZ#()
	End Method
	Method PickedNX#()
	End Method
	Method PickedNY#()
	End Method
	Method PickedNZ#()
	End Method
	Method PickedTime#()
	End Method
	Method PickedEntity:TEntity()
	End Method
	Method PickedSurface:TSurface()
	End Method
	Method PickedTriangle()
	End Method
					
End Type




Rem

Function m3dInitMax3D(importer:Byte Ptr)="m3dInitMax3D"
Function m3dUseDegrees()="m3dUseDegrees"
Function m3dUseRadians()="m3dUseRadians"

Function m3dFlushResources()="m3dFlushResources"
Function m3dRetainResource(obj%)="m3dRetainResource"
Function m3dReleaseResource(obj%)="m3dReleaseResource"
Function m3dBlackTexture%()="m3dBlackTexture"
Function m3dWhiteTexture%()="m3dWhiteTexture"
Function m3dCreateTexture%(width%,height%,format%,flags%)="m3dCreateTexture"
Function m3dSetTexturePath(texture%,path$z)="m3dSetTexturePath"
Function m3dSetTextureData(texture%,data:Byte Ptr)="m3dSetTextureData"
Function m3dCreate3dTexture%(width%,height%,depth%,format%,flags%)="m3dCreate3dTexture"
Function m3dSet3dTextureData(texture%,data:Byte Ptr)="m3dSet3dTextureData"
Function m3dCreateCubeTexture%(size%,format%,flags%)="m3dCreateCubeTexture"
Function m3dSetCubeTextureData(texture%,data:Byte Ptr)="m3dSetCubeTextureData"
Function m3dCreateShader%(source$z)="m3dCreateShader"
Function m3dCreateMaterial%()="m3dCreateMaterial"
Function m3dSetMaterialFloat(material%,name$z,value#)="m3dSetMaterialFloat"
Function m3dSetMaterialColor(material%,name$z,red#,green#,blue#)="m3dSetMaterialColor"
Function m3dSetMaterialTexture(material%,name$z,texture%)="m3dSetMaterialTexture"
Function m3dCreateSurface%()="m3dCreateSurface"
Function m3dSetSurfaceShader(surface%,shader%)="m3dSetSurfaceShader"
Function m3dSurfaceShader%(surface%)="m3dSurfaceShader"
Function m3dSetSurfaceMaterial(surface%,material%)="m3dSetSurfaceMaterial"
Function m3dSurfaceMaterial%(surface%)="m3dSurfaceMaterial"
Function m3dAddSurfaceVertex(surface%,x#,y#,z#,s0#,t0#)="m3dAddSurfaceVertex"
Function m3dAddSurfaceTriangle(surface%,vertex0%,vertex1%,vertex2%)="m3dAddSurfaceTriangle"
Function m3dDestroyEntity(entity%)="m3dDestroyEntity"
Function m3dCopyEntity%(entity%)="m3dCopyEntity"
Function m3dShowEntity(entity%)="m3dShowEntity"
Function m3dHideEntity(entity%)="m3dHideEntity"
Function m3dSetEntityParent(entity%,parent%)="m3dSetEntityParent"
Function m3dSetEntityTranslation(entity%,x#,y#,z#)="m3dSetEntityTranslation"
Function m3dSetEntityRotation(entity%,yaw#,pitch#,roll#)="m3dSetEntityRotation"
Function m3dSetEntityScale(entity%,x#,y#,z#)="m3dSetEntityScale"
Function m3dMoveEntity(entity%,x#,y#,z#)="m3dMoveEntity"
Function m3dTurnEntity(entity%,yaw#,pitch#,roll#)="m3dTurnEntity"
Function m3dEntityX#(entity%)="m3dEntityX"
Function m3dEntityY#(entity%)="m3dEntityY"
Function m3dEntityZ#(entity%)="m3dEntityZ"
Function m3dLoadModel%(path$z,collType%,mass#)="m3dLoadModel"
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

EndRem
