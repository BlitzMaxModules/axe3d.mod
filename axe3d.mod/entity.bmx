Strict

Import brl.linkedlist

Import "brush.bmx"
Import "texture.bmx"
Import "surface.bmx"
Import "matrix.bmx"

Type TEntity Extends TMatrix
	Field _id
	
	Method EntityID()
		Return _id
	End Method
	
	Method SetEntityID(id)
		_id=id
	End Method

	Method SetParent(parent:TEntity,glob=True) Abstract
	Method GetParent:TEntity() Abstract
	Method CopyEntity:TEntity(parent:TEntity=Null) Abstract
	Method FreeEntity() Abstract

	Method PositionEntity(x#,y#,z#,glob=False) Abstract
	Method MoveEntity(mx#,my#,mz#) Abstract
	Method TranslateEntity(tx#,ty#,tz#,glob=False) Abstract
	Method ScaleEntity(x#,y#,z#,glob=False) Abstract
	Method RotateEntity(x#,y#,z#,glob=False) Abstract	
	Method TurnEntity(x#,y#,z#,glob=False) Abstract
	Method PointEntity(target:TEntity,roll#=0) Abstract
	Method AlignToVector(vector_x#,vector_y#,vector_z#,axis,rate#=1.0) Abstract

	Method LoadAnimSeq(file:String) Abstract
	Method ExtractAnimSeq(first_frame,last_frame,seq=0) Abstract
	Method Animate(mode=1,speed#=1.0,seq=0,trans=0) Abstract
	Method SetAnimTime(time#,seq=0) Abstract
	Method AnimSeq() Abstract
	Method AnimLength() Abstract
	Method AnimTime#() Abstract
	Method Animating() Abstract
	Method EntityColor(r#,g#,b#) Abstract
	Method EntityShininess(s#) Abstract
	Method EntityTexture(texture:TTexture,frame=0,index=0) Abstract
	Method EntityBlend(blend_no) Abstract
	Method EntityFX(fx_no) Abstract
	Method EntityAutoFade(near#,far#) Abstract
	Method PaintEntity(brush:TBrush) Abstract
	Method ShowEntity() Abstract
	Method HideEntity() Abstract

	Method NameEntity(e_name$) Abstract
	Method EntityX#(glob=False) Abstract
	Method EntityY#(glob=False) Abstract	
	Method EntityZ#(glob=False) Abstract	
	Method EntityPitch#(glob=False) Abstract
	Method EntityYaw#(glob=False) Abstract
	Method EntityRoll#(glob=False) Abstract
	Method EntityClass$() Abstract
	Method EntityName$() Abstract
	Method CountChildren() Abstract
	Method GetChild:TEntity(child_no) Abstract
	Method FindChild:TEntity(child_name$) Abstract

	Method EntityPick:TEntity(range#) Abstract
'	Method LinePick:TEntity(x#,y#,z#,dx#,dy#,dz#,radius#=0.0) Abstract
	
	Method DeltaYaw#(ent:TEntity) Abstract
	Method DeltaPitch#(ent:TEntity) Abstract
	
	Method GetMatElement#(row,col) Abstract

	Method ResetEntity() Abstract
	Method EntityRadius(rx#,ry#=0.0) Abstract
	Method EntityBox(x#,y#,z#,w#,h#,d#) Abstract	
	Method EntityType(type_no,recursive=False) Abstract	
	Method EntityPickMode(no,obscure=True) Abstract	
	Method EntityCollided:TEntity(type_no) Abstract

	Method CountCollisions() Abstract
	Method CollisionX#(index) Abstract
	Method CollisionY#(index) Abstract
	Method CollisionZ#(index) Abstract
	Method CollisionNX#(index) Abstract
	Method CollisionNY#(index) Abstract
	Method CollisionNZ#(index) Abstract
	Method CollisionTime#(index) Abstract
	Method CollisionEntity:TEntity(index) Abstract
	Method CollisionSurface:TSurface(index) Abstract
	Method CollisionTriangle(index) Abstract

	Method GetEntityType() Abstract
	Method GetEntityBrush:TBrush() Abstract
	Method EntityOrder(order_no) Abstract
	
	Method CaptureEntity()
	End Method
	
	Method EntityVisible(dest:TEntity)
	End Method
	
	Method EntityDistance#(dest:TEntity)
	End Method
	
	Method LightRange(range#)
	End Method
	
	Method LightColor(red#,green#,blue#)
	End Method

	Method LightConeAngles(inner_angle#,outer_angle#)
	End Method

	Method CameraClsColor(r#,g#,b#)
	End Method

	Method CameraViewport(x,y,width,height)
	End Method

	Method CameraClsMode(cls_color,cls_zbuffer)
	End Method

	Method CameraRange(near#,far#)
	End Method
	
	Method CameraZoom(zoom#)
	End Method
	
	Method CameraProjMode(mode)
	End Method
	
	Method CameraFogMode(mode)
	End Method
	
	Method CameraFogColor(red#,green#,blue#)
	End Method
	
	Method CameraFogRange(near#,far#)
	End Method
	
	Method CameraProject(x#,y#,z#)
	End Method
		
	Method EntityInView(dest:TEntity)
	End Method

	Method CameraPick:TEntity(x#,y#)
	End Method
	
	Method MeshCullBox(x#,y#,z#,w#,h#,d#)
	End Method
	
	Method CountSurfaces()
	End Method

	Method GetSurface:TSurface(index)
	End Method

	Method CreateSurface:TSurface()
	End Method

	Method FindSurface:TSurface(brush:TBrush)
	End Method

	Method FlipMesh()
	End Method
	
	Method AddMesh(src:TEntity)
	End Method
	
	Method UpdateNormals()
	End Method

	Method LightMesh(red#,green#,blue#,range#=0,x#=0,y#=0,z#=0)
	End Method
	
	Method FitMesh(x#,y#,z#,width#,height#,depth#,uniform=0)
	End Method
	
	Method ScaleMesh(x_scale#,y_scale#,z_scale#)
	End Method
	
	Method RotateMesh(pitch#,yaw#,roll#)
	End Method

	Method PositionMesh(x#,y#,z#)
	End Method
	
	Method MeshesIntersect(mesh_b:TEntity)
	End Method

	Method MeshWidth#()
	End Method
	Method MeshHeight#()
	End Method
	Method MeshDepth#()
	End Method

End Type
