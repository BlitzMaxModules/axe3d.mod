
Strict

Import brl.map
Import axe3d.axe3d
Import axe3d.model

Import "m3dutil.bmx"

blitz3d_driver = New TM3DDriver

Rem

Function m3dCreateTexture%(width%,height%,format%,flags%)="m3dCreateTexture"
Function m3dSetTexturePath(texture%,path$z)="m3dSetTexturePath"
Function m3dSetTextureData(texture%,data:Byte Ptr)="m3dSetTextureData"
Function m3dCreate3dTexture%(width%,height%,depth%,format%,flags%)="m3dCreate3dTexture"
Function m3dSet3dTextureData(texture%,data:Byte Ptr)="m3dSet3dTextureData"
Function m3dCreateCubeTexture%(size%,format%,flags%)="m3dCreateCubeTexture"
Function m3dSetCubeTextureData(texture%,data:Byte Ptr)="m3dSetCubeTextureData"

EndRem

Type TM3DTextureLock Extends TTextureLock

	Field _owner:TM3DTexture
	Field _frame:Int 
	Field _pixmap:TPixmap
	
	Method Init:TM3DTextureLock(owner:TM3DTexture,frame:Int)
		_owner=owner
		_frame=frame
		Return Self
	End Method
	
	Method Lock()
		_pixmap=_owner._pixmap
	End Method

	Method Unlock()
		 m3dSetTextureData _owner._texture,_pixmap.PixelPtr(0,0)
	End Method
	
	Method SetRGBA(x,y,rgba)
		_pixmap.WritePixel x,y,rgba
	End Method

	Method GetRGBA(x,y)
		Return _pixmap.ReadPixel(x,y)
	End Method
	
End Type

Type TM3DTexture Extends TModelTexture

	Global _map:TMap=New TMap	
	Field _texture%

	Method InitM3DTexture:TM3DTexture(pix:TPixmap,flags)
		Local format%
		format=m3dPixelFormat(pix)
		_texture=m3dCreateTexture(pix.width,pix.height,format,TEXTURE_STATIC)
		m3dSetTextureData _texture,pix.PixelPtr(0,0)
		Local key$=String(_texture)
		MapInsert _map,key,Self
		Super.Init(pix,flags)
		Return Self
	End Method

	Function mh(a:TTexture)
		If TM3DTexture(a) Return TM3DTexture(a)._texture
	End Function
	
	Function mt:TTexture(texture)
		Local key$=String(texture)
		If MapContains(_map,key)
			Return TTexture(MapValueForKey(_map,key))
		EndIf
		Assert False	'skid
	End Function

	Method FreeTexture()
		Assert _texture
		m3dReleaseResource(_texture)
		_texture=0
	End Method
	
	Method TextureBuffer:TTextureLock(frame)
		If Not _buffer[frame]
			_buffer[frame]=New TM3DTextureLock.Init(Self,frame)
		EndIf
		Return _buffer[frame]
	End Method
			
End Type


Type TM3DBrush Extends TModelBrush
	Global _map:TMap=New TMap	
	Field _material
		
	Method InitM3DBrush:TM3DBrush(material%,texture:TM3DTexture=Null)
		_material=material
		If texture
			m3dSetMaterialTexture material,"DiffuseTexture",texture._texture
		EndIf		
		Local key$=String(_material)
		MapInsert _map,key,Self
		Super.Init(texture)
		Return Self
	End Method

	Function h(a:TBrush)
		If TM3DBrush(a) Return TM3DBrush(a)._handle
	End Function
	
	Function b:TBrush(material%)
		Local key$=String(material)
		If MapContains(_map,key)
			Return TBrush(MapValueForKey(_map,key))
		EndIf
		Return New TM3DBrush.InitM3DBrush(material)
	End Function
	
	Function LoadBrush:TBrush(texture_path$,flags=1,u_scale#=1,v_scale#=1) 
		Local pixmap:TPixmap
		Local texture:TM3DTexture
		If texture_path
			pixmap=LoadPixmap(texture_path)
		EndIf
		texture=New TM3DTexture.InitM3DTexture(pixmap,flags)
		texture.ScaleTexture u_scale,v_scale		
		Local material
		material=m3dcreatematerial()
		m3dSetMaterialColor material,"DiffuseColor",1,1,1		
		Return New TM3DBrush.InitM3DBrush(material,texture)
	End Function
	
	Function CreateBrush:TBrush(red#,green#,blue#)
		Local mat
		mat=m3dCreateMaterial()
		m3dSetMaterialColor mat,"DiffuseColor",red/255,green/255,blue/255		
		Return New TM3DBrush.InitM3DBrush(mat)
	End Function
	
	Function CloneBrush:TM3DBrush(brush:TM3DBrush)
		Local mat
		mat=m3dcreatematerial()
		m3dSetMaterialColor mat,"DiffuseColor",brush._r/255,brush._g/255,brush._b/255		
		Return New TM3dBrush.InitM3DBrush(mat)
	End Function

	Method FreeBrush()
	End Method

	Method Copy:TBrush()
		Return CloneBrush(Self)
	End Method
			
	Method BrushColor(r#,g#,b#)
		m3dSetMaterialColor _material,"DiffuseColor",r,g,b
		_r=r
		_g=g
		_b=b
	End Method
	
	Method BrushAlpha(a#)
'		m3dSetMaterialColor mat,"DiffuseColor",_r,_g,_b
		_a=a
	End Method
	
	Method BrushShininess(s#)
		_shiny=s
	End Method
	
	Method BrushTexture(texture:TTexture,frame=0,index=0)
		_texture=TModelTexture(texture)
	End Method
	
	Method BrushBlend(blend)
		_blend=blend
	End Method
	
	Method BrushFX(fx)
		_fx=fx
	End Method
	
End Type

'Function m3dCreateSurface%(material%,model%)="m3dCreateSurface"
'Function m3dSetSurfaceShader(surface%,shader%)="m3dSetSurfaceShader"
'Function m3dSurfaceShader%(surface%)="m3dSurfaceShader"
'Function m3dSetSurfaceMaterial(surface%,material%)="m3dSetSurfaceMaterial"
'Function m3dSurfaceMaterial%(surface%)="m3dSurfaceMaterial"
'Function m3dAddSurfaceVertex(surface%,x#,y#,z#,s0#,t0#)="m3dAddSurfaceVertex"
'Function m3dAddSurfaceTriangle(surface%,vertex0%,vertex1%,vertex2%)="m3dAddSurfaceTriangle"

Type TM3DSurface Extends TModelSurface
	Global _map:TMap=New TMap
	Field _surface%
	Field _m3dbrush:TM3DBrush
	Field _m3downer:TM3DEntity

	Method InitM3DSurface:TM3DSurface(owner:TM3DEntity)
		Local surface%

		_m3downer=owner
		_m3dbrush=owner._m3dbrush

		surface=m3dCreateSurface(_m3dbrush._handle,_m3downer._handle)
		Local key$=String(surface)
		MapInsert _map,key,Self
		_surface=surface

		owner.AddSurface Self
		Return Self
	End Method
	
	Function h(a:TSurface)
		If TM3DSurface(a) Return TM3DSurface(a)._surface
	End Function
	
	Function s:TM3DSurface(surface)
		Local key$=String(surface)
		If MapContains(_map,key)
			Return TM3DSurface(MapValueForKey(_map,key))
		EndIf
		Assert 0
	End Function

	Method GetSurfaceBrush:TBrush()	
		Return _m3dbrush
	End Method
	
	Method PaintSurface(brush:TBrush)
		_m3dbrush=TM3DBrush(brush)
		m3dSetSurfaceMaterial _surface,_m3dbrush._material
	End Method
	
	Method RestoreSurface()
		Local i%
		Local v:Float Ptr
		Local t:Int Ptr
		Local surface%
		m3dClearSurface _surface
		v=_verts
		For i=0 Until _vertcount
			m3dAddSurfaceVertex _surface,v[0],v[1],v[2],v[10],v[11]
			v:+TModelSurface.VSPAN
		Next
		t=_tris
		For i=0 Until _tricount
			m3dAddSurfaceTriangle _surface,t[0],t[1],t[2]
			t:+3
		Next		
		m3dSetSurfaceMaterial _surface,_m3dbrush._material
	End Method
	
End Type


Type TM3DEntity Extends TModelEntity
	Global _map:TMap=New TMap
	Field _handle
	Field _m3dbrush:TM3DBrush
	
	Function CloneEntity:TM3DEntity(entity:TM3DEntity)
	End Function
	
	Method InitM3DEntity:TM3DEntity(handle,parent:TM3DEntity)
		Local class$="m3dentity"
		Local key$=String(handle)
		_handle=handle
		_m3dbrush=TM3DBrush(CreateBrush())
		MapInsert _map,key,Self
		Init(class,parent)
		Return Self
	End Method
		
	Function h(e:TEntity)
		If TM3DEntity(e) Return TM3DEntity(e)._handle
	End Function
	
	Function e:TEntity(handle)
		Local key$=String(handle)
		If MapContains(_map,key)
			Return TEntity(MapValueForKey(_map,key))
		EndIf
		Return New TM3DEntity.Init(handle,Null)
	End Function

	Method CopyEntity:TEntity(parent:TEntity=Null) 
		Return CloneEntity(Self)
	End Method

	Method FreeEntity() 
'		m3dFreeEntity _handle
	End Method

	Method CreateSurface:TSurface()
		Return New TM3DSurface.InitM3DSurface(Self)
	End Method

	Method PositionEntity(x#,y#,z#,glob=False) 
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
'		'bbPointEntity _handle,h(target),roll
	End Method

	Method AlignToVector(vector_x#,vector_y#,vector_z#,axis,rate#=1.0)
		'bbAlignToVector _handle,vector_x#,vector_y#,vector_z#,axis,rate#
	End Method
	
	Method UpdateNormals()
		Local surf:TM3DSurface
		For surf=EachIn _surfaces
			surf.RestoreSurface
		Next
		m3dUpdateModelNormals(_handle)
		m3dUpdateModelTangents(_handle)
	End Method
		
End Type


Type TM3DDriver Extends TModelDriver

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
		Local pix:TPixmap
		pix=LoadPixmap(file)
		Return New TM3DTexture.Init(pix,flags)
	End Method
	
	Method CreateTexture:TTexture(width,height,flags=0,frames=1)
		Local pix:TPixmap
		pix=CreatePixmap(width,height,PF_RGBA8888)
		Return New TM3DTexture.Init(pix,flags)
	End Method

	Method CreateMesh:TEntity(parent:TEntity=Null) 
		Local model
		model=m3dCreateModel()
		Return New TM3DEntity.InitM3DEntity(model,TM3DEntity(parent))
	End Method	

	Method CreatePivot:TEntity(parent:TEntity=Null) 
	End Method

	Method CreatePlane:TEntity(divisions=1,parent:TEntity=Null) 
	End Method

	Method CreateMirror:TEntity(parent:TEntity=Null) 
	End Method

	Method CreateLight:TEntity(light_type,parent:TEntity=Null)
		Local light
		light=m3dCreatePointLight()
		Return New TM3DEntity.InitM3DEntity(light,TM3DEntity(parent))
	End Method

	Method CreateCamera:TEntity(parent:TEntity=Null)
		Local cam
		cam=m3dCreateCamera()
		Return New TM3DEntity.InitM3DEntity(cam,TM3DEntity(parent))
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

Rem


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
EndRem
					
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
