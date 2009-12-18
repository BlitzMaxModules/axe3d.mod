
Strict

?win32

Import brl.map
Import blitz3d.blitz3dsdk
Import axe3d.axe3D

blitz3d_driver = New TB3DSDKDriver

Type TBBTextureLock Extends TTextureLock	
	Field _owner:TTexture
	Field _frame:Int 
	Field _buffer
	Field _locked

	Method Init:TBBTextureLock(owner:TBBTexture,frame)
		_owner=owner
		_frame=frame
		_buffer=bbTextureBuffer(owner._handle,frame)
		Assert _buffer
		Return Self
	End Method			
	
	Method Lock()
		bbLockBuffer _buffer
		_locked=True
	End Method

	Method Unlock()
		bbUnlockBuffer _buffer
		_locked=False
	End Method
	
	Method SetRGBA(x,y,rgba)
		Assert _locked
		bbWritePixelFast x,y,rgba,_buffer
	End Method

	Method GetRGBA(x,y)
		Assert _locked
		Return bbReadPixelFast(x,y,_buffer)
	End Method
End Type


Type TBBTexture Extends TTexture
	Global _all:TMap=New TMap	
	Field _handle
	Field _buffer:TBBTextureLock

	Method Init:TBBTexture(handle)
		Local key$=String(handle)
		_handle=handle
		MapInsert _all,key,Self
		_buffer=New TBBTextureLock.Init(Self,0)
		Return Self
	End Method

	Function h(a:TTexture)
		If TBBTexture(a) Return TBBTexture(a)._handle
	End Function
	
	Function t:TTexture(handle)
		Local key$=String(handle)
		If MapContains(_all,key)
			Return TTexture(MapValueForKey(_all,key))
		EndIf
		Return New TBBTexture.Init(handle)
	End Function

	Method FreeTexture()
		bbFreeTexture _handle
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
		Return bbTextureWidth(_handle)
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

	Method TextureBuffer:TTextureLock(frame)
		Return _buffer
	End Method
			
End Type

Type TBBSurface Extends TSurface
	Global _all:TMap=New TMap
	Field _handle

	Method Init:TBBSurface(handle)
		Local key$=String(handle)
		_handle=handle
		MapInsert _all,key,Self
		Return Self
	End Method

	Function h(a:TSurface)
		If TBBSurface(a) Return TBBSurface(a)._handle
	End Function
	
	Function s:TBBSurface(handle)
		Local key$=String(handle)
		If MapContains(_all,key)
			Return TBBSurface(MapValueForKey(_all,key))
		EndIf
		Return New TBBSurface.Init(handle)
	End Function

	Method GetSurfaceBrush:TBrush()	
		Return TBBBrush.b(bbGetSurfaceBrush(_handle))
	End Method
	
	Method PaintSurface(brush:TBrush)
		bbPaintSurface(_handle,TBBBrush.h(brush))
	End Method
	
	Method ClearSurface(clear_verts,clear_tris)
		bbClearSurface _handle,clear_verts,clear_tris
	End Method
	
	Method AddVertex(x#,y#,z#,u#=0.0,v#=0.0,w#=1.0)
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
		bbVertexTexCoords _handle,vid,u,v,w,coord_set
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
		Return bbVertexNY(_handle,v)
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

	Method MeshCullBox(x#,y#,z#,w#,h#,d#)
		bbMeshCullBox _handle,x,y,z,w,h,d
	End Method

	Method FlipMesh(dest:TEntity)
		bbFlipMesh TBBEntity.h(dest)
	End Method
	
	Method AddMesh(src:TEntity)
		bbAddMesh _handle,TBBEntity.h(src)
	End Method
	
	Method LightMesh(red#,green#,blue#,range#=0,x#=0,y#=0,z#=0)
		bbLightMesh _handle,red,green,blue,range,x,y,z
	End Method
	
	Method FitMesh(x#,y#,z#,width#,height#,depth#,uniform=0)
		bbFitMesh x,y,z,width,height,depth,uniform
	End Method
	
	Method ScaleMesh(x_scale#,y_scale#,z_scale#)
		bbScaleMesh _handle,x_scale,y_scale,z_scale
	End Method
	
	Method RotateMesh(pitch#,yaw#,roll#)
		bbRotateMesh _handle,pitch,yaw,roll
	End Method

	Method PositionMesh(x#,y#,z#)
		bbPositionMesh _handle,x,y,z
	End Method

	Method MeshWidth#()
		Return bbMeshWidth(_handle)
	End Method
	
	Method MeshHeight#()
		Return bbMeshHeight(_handle)
	End Method
	
	Method MeshDepth#()
		Return bbMeshDepth(_handle)
	End Method

End Type


Type TBBEntityBrush Extends TBrush
	Field _owner:TBBEntity
	Field _handle

	Method Init:TBBEntityBrush(owner:TBBEntity)
		_owner=owner
		_handle=owner._handle
		Return Self
	End Method
	
	Method Copy:TBrush()
		DebugStop
	End Method

	Method GetBrushTexture:TTexture(index=0)
	End Method

	Method FreeBrush()
		bbFreeBrush _handle
		_handle=0
	End Method

	Method BrushColor(r#,g#,b#)
		bbEntityColor _handle,r,g,b
	End Method
	
	Method BrushAlpha(a#)
		bbEntityAlpha _handle,a
	End Method
	
	Method BrushShininess(s#)
		bbEntityShininess _handle,s
	End Method
	
	Method BrushTexture(texture:TTexture,frame=0,index=0)
		bbEntityTexture _handle,TBBTexture.h(texture),frame,index
	End Method
		
	Method BrushBlend(blend_no)
		bbEntityBlend _handle,blend_no
	End Method
	
	Method BrushFX(fx_no)
		bbEntityFX _handle,fx_no
	End Method
	
End Type


Type TBBBrush Extends TBrush
	Global _all:TMap=New TMap	
	Field _handle

	Method Init:TBBBrush(handle)
		Local key$=String(handle)
		_handle=handle
		MapInsert _all,key,Self
		Return Self
	End Method

	Function h(a:TBrush)
		If TBBBrush(a) Return TBBBrush(a)._handle
	End Function
	
	Function b:TBrush(handle)
		Local key$=String(handle)
		If MapContains(_all,key)
			Return TBrush(MapValueForKey(_all,key))
		EndIf
		Return New TBBBrush.Init(handle)
	End Function

	Method Copy:TBrush()
		DebugStop
		Return b(bbCreateBrush(_handle))
	End Method

	Method GetBrushTexture:TTexture(index=0)
		Return TBBTexture.t(bbGetBrushTexture(_handle,index))
	End Method

	Method FreeBrush()
		bbFreeBrush _handle
		_handle=0
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
		bbBrushTexture _handle,TBBTexture.h(texture),frame,index
	End Method
		
	Method BrushBlend(blend_no)
		bbBrushBlend _handle,blend_no
	End Method
	
	Method BrushFX(fx_no)
		bbBrushFX _handle,fx_no
	End Method
	
End Type

Type TBBEntity Extends TEntity
	Global _all:TMap=New TMap
	Field _handle
	Field _brush:TBBEntityBrush
	
	Method Init:TBBEntity(handle)
		Local key$=String(handle)
		_handle=handle
		MapInsert _all,key,Self		
		_brush=New TBBEntityBrush.Init(Self)
		Return Self
	End Method
		
	Function h(e:TEntity)
		If TBBEntity(e) Return TBBEntity(e)._handle
	End Function
	
	Function e:TEntity(handle)
		Local key$=String(handle)
		If MapContains(_all,key)
			Return TEntity(MapValueForKey(_all,key))
		EndIf
		Return New TBBEntity.Init(handle)
	End Function

	Method SetParent(parent:TEntity,glob=True) 
		bbEntityParent _handle,h(parent),glob
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
		bbMoveEntity _handle,mx#,my#,mz#
	End Method

	Method TranslateEntity(tx#,ty#,tz#,glob=False) 
		bbTranslateEntity _handle,tx#,ty#,tz#,glob
	End Method

	Method ScaleEntity(x#,y#,z#,glob=False) 
		bbScaleEntity _handle,x,y,z,glob
	End Method
	
	Method RotateEntity(x#,y#,z#,glob=False) 	
		bbRotateEntity _handle,x,y,z,glob
	End Method

	Method TurnEntity(x#,y#,z#,glob=False) 
		bbTurnEntity _handle,x,y,z,glob
	End Method

	Method PointEntity(target:TEntity,roll#=0) 
		bbPointEntity _handle,h(target),roll
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
		bbEntityTexture _handle,TBBTexture.h(texture),frame,index 
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
		bbPaintEntity _handle,TBBBrush.h(brush)
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
		Return TBBSurface.s(bbCollisionSurface(_handle,index))
	End Method

	Method CollisionTriangle(index) 
		Return bbCollisionTriangle(_handle,index)
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

	Method CaptureEntity()
		bbCaptureEntity _handle
	End Method

	Method EntityVisible(dest:TEntity)
		Return bbEntityVisible(_handle,TBBEntity.h(dest))
	End Method
	
	Method EntityDistance#(dest:TEntity)
		Return bbEntityDistance(_handle,TBBEntity.h(dest))
	End Method
	
	Method LightRange(range#)
		bbLightRange _handle,range
	End Method
	
	Method LightColor(red#,green#,blue#)
		bbLightColor _handle,red,green,blue
	End Method

	Method LightConeAngles(inner_angle#,outer_angle#)
		bbLightConeAngles _handle,inner_angle,outer_angle
	End Method

	Method CameraClsColor(r#,g#,b#)
		bbCameraClsColor _handle,r,g,b
	End Method
	
	Method CameraViewport(x,y,width,height)
		bbCameraViewport _handle,x,y,width,height
	End Method

	Method CameraClsMode(cls_color,cls_zbuffer)
		bbCameraClsMode _handle,cls_color,cls_zbuffer
	End Method

	Method CameraRange(near#,far#)
		bbCameraRange _handle,near,far
	End Method
	
	Method CameraZoom(zoom#)
		bbCameraZoom _handle,zoom
	End Method
	
	Method CameraProjMode(mode)
		bbCameraProjMode _handle,mode
	End Method
	
	Method CameraFogMode(mode)
		bbCameraFogMode _handle,mode
	End Method
	
	Method CameraFogColor(red#,green#,blue#)
		bbCameraFogColor _handle,red,green,blue
	End Method
	
	Method CameraFogRange(near#,far#)
		bbCameraFogRange _handle,near,far
	End Method
	
	Method CameraProject(x#,y#,z#)
		bbCameraProject _handle,x,y,z
	End Method
		
	Method CountSurfaces()
		Return bbCountSurfaces(_handle)
	End Method

	Method GetSurface:TSurface(index)
		Return TBBSurface.s(bbGetSurface(_handle,index))
	End Method

	Method CreateSurface:TSurface()
		Return New TBBSurface.init(bbCreateSurface(_handle))
	End Method 

	Method FindSurface:TSurface(brush:TBrush)
		Local handle
		handle=bbFindSurface(_handle,TBBBrush.h(brush))
		If handle Return TBBSurface.s(handle)
	End Method
	
End Type


Type TB3DSDKDriver Extends TBlitz3DDriver

	Function h(e:TBBEntity)
		If e Return e._handle
	End Function

	Method CreateBrush:TBrush(red#,green#,blue#)	
		Return New TBBBrush.init(bbCreateBrush(red,green,blue))
	End Method

	Method LoadBrush:TBrush(texture_path$,flags=1,u_scale#=1,v_scale#=1)	
		Return New TBBBrush.init(bbLoadBrush(texture_path,flags,u_scale,v_scale))
	End Method

	Method LoadTexture:TTexture(file$,flags=1)
		Return New TBBTexture.Init(bbLoadTexture(file,flags))
	End Method
	
	Method CreateTexture:TTexture(width,height,flags=1,frames=1)
		Return New TBBTexture.Init(bbCreateTexture(width,height,flags,frames))
	End Method

	Method CreateMesh:TEntity(parent:TEntity=Null)	
		Return New TBBEntity.init(bbCreateMesh(TBBEntity.h(parent)))
	End Method
	
	Method CreatePivot:TEntity(parent:TEntity=Null)
		Return New TBBEntity.init(bbCreatePivot(TBBEntity.h(parent)))
	End Method

	Method CreateSphere:TEntity(segments=8,parent:TEntity=Null)	
		Return New TBBEntity.init(bbCreateSphere(segments,TBBEntity.h(parent)))
	End Method

	Method CreateCylinder:TEntity(segments=8,solid=True,parent:TEntity=Null)
		Return New TBBEntity.init(bbCreateCylinder(segments,solid,TBBEntity.h(parent)))
	End Method

	Method CreateCone:TEntity(segments=8,solid=True,parent:TEntity=Null)
		Return New TBBEntity.init(bbCreateCone(segments,solid,TBBEntity.h(parent)))
	End Method
	
	Method CreatePlane:TEntity(divisions=1,parent:TEntity=Null)
		Return New TBBEntity.init(bbCreatePlane(divisions,TBBEntity.h(parent)))
	End Method

	Method CreateMirror:TEntity(parent:TEntity=Null)
		Return New TBBEntity.init(bbCreateMirror(TBBEntity.h(parent)))
	End Method

	Method CreateLight:TEntity(light_type,parent:TEntity=Null)
		Return New TBBEntity.init(bbCreateLight(light_type,TBBEntity.h(parent)))
	End Method

	Method CreateCube:TEntity(parent:TEntity=Null)
		Return New TBBEntity.init(bbCreateCube(TBBEntity.h(parent)))
	End Method

	Method CreateCamera:TEntity(parent:TEntity=Null)
		Return New TBBEntity.init(bbCreateCamera(TBBEntity.h(parent)))
	End Method
	
	Method Graphics3D:TGraphics(w,h,d=0,m=0,r=60)
		bbBeginBlitz3D
		bbGraphics3D(w,h,d,m)
	End Method

	Method AntiAlias(aatype)
		bbAntiAlias aatype
	End Method
	
	Method Wireframe(enable)
		bbWireFrame enable
	End Method

	Method WBuffer(enable)
		bbWBuffer enable
	End Method

	Method AmbientLight(r#,g#,b#)
		bbAmbientLight r#,g#,b#
	End Method

	Method ClearWorld(entities=True,brushes=True,textures=True) 
		bbClearWorld entities,brushes,textures
	End Method
	
	Method RenderWorld(tween#=1.0) 
		bbRenderWorld tween
	End Method
	
	Method TrisRendered() 
		Return bbTrisRendered()
	End Method

	Method ClearCollisions() 
		bbClearCollisions
	End Method

	Method Collisions(src_no,dest_no,method_no,response_no) 
		bbCollisions src_no,dest_no,method_no,response_no 
	End Method

	Method CaptureWorld() 
		bbCaptureWorld
	End Method

	Method UpdateWorld(anim_speed#=1.0) 
		bbUpdateWorld anim_speed
	End Method
		
	Method TFormPoint(x#,y#,z#,src_ent:TEntity,dest_ent:TEntity)
		bbTFormPoint(x,y,z,TBBEntity.h(src_ent),TBBEntity.h(dest_ent))
	End Method
		
	Method TFormVector(x#,y#,z#,src_ent:TEntity,dest_ent:TEntity)
		bbTFormVector(x,y,z,TBBEntity.h(src_ent),TBBEntity.h(dest_ent))
	End Method

	Method TFormNormal(x#,y#,z#,src_ent:TEntity,dest_ent:TEntity)
		bbTFormNormal(x,y,z,TBBEntity.h(src_ent),TBBEntity.h(dest_ent))
	End Method

	Method TFormedX#()
		Return bbTFormedX()		
	End Method
	
	Method TFormedY#()
		Return bbTFormedY()		
	End Method
	
	Method TFormedZ#()
		Return bbTFormedZ()		
	End Method
					
	Method ProjectedX#()
		Return bbProjectedX()		
	End Method

	Method ProjectedY#()
		Return bbProjectedY()		
	End Method

	Method ProjectedZ#()
		Return bbProjectedZ()		
	End Method

	Method LinePick:TEntity(x#,y#,z#,dx#,dy#,dz#,radius#)
		Return TBBEntity.e(bbLinePick(x,y,z,dx,dy,dz,radius))
	End Method

	Method PickedX#()
		Return bbPickedX()
	End Method

	Method PickedY#()
		Return bbPickedY()
	End Method

	Method PickedZ#()
		Return bbPickedZ()
	End Method

	Method PickedNX#()
		Return bbPickedNX()
	End Method

	Method PickedNY#()
		Return bbPickedNY()
	End Method

	Method PickedNZ#()
		Return bbPickedNZ()
	End Method

	Method PickedTime#()
		Return bbPickedTime()
	End Method

	Method PickedEntity:TEntity()
		Return TBBEntity.e(bbPickedEntity())
	End Method

	Method PickedSurface:TSurface()
		Return TBBSurface.s(bbPickedSurface())
	End Method

	Method PickedTriangle()
		Return bbPickedTriangle()
	End Method

End Type

?
