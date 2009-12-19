Strict

Import brl.Graphics
Import "entity.bmx"

Type TBlitz3DDriver

	Method CreateBrush:TBrush(red#,green#,blue#) Abstract	
	Method LoadBrush:TBrush(texture_path$,flags=1,u_scale#=1,v_scale#=1) Abstract	

	Method LoadTexture:TTexture(file$,flags=1) Abstract
	Method CreateTexture:TTexture(width,height,flags=1,frames=1) Abstract

	Method CreateMesh:TEntity(parent:TEntity=Null) Abstract	
	
	Method CreateSphere:TEntity(segments=8,parent:TEntity=Null) Abstract	
	Method CreatePivot:TEntity(parent:TEntity=Null) Abstract

	Method CreateCylinder:TEntity(segments=8,solid=True,parent:TEntity=Null) Abstract
	Method CreateCone:TEntity(segments=8,solid=True,parent:TEntity=Null) Abstract
	Method CreatePlane:TEntity(divisions=1,parent:TEntity=Null) Abstract
	Method CreateMirror:TEntity(parent:TEntity=Null) Abstract

	Method CreateCube:TEntity(parent:TEntity=Null) Abstract
	Method CreateLight:TEntity(light_type,parent:TEntity=Null) Abstract
	Method CreateCamera:TEntity(parent:TEntity=Null) Abstract

	Method Graphics3D:TGraphics(w,h,d=0,m=0,r=60) Abstract
	Method AntiAlias(samples) Abstract
	Method Wireframe(enable) Abstract

	Method Dither(enable)
	End Method
	Method WBuffer(enable)
	End Method
	Method HWMultiTex(enable)
	End Method

	Method TextureFilter(match_text$,flags)
	End Method

	Method ClearTextureFilters()
	End Method

	Method AmbientLight(r#,g#,b#) Abstract

	Method ClearWorld(entities=True,brushes=True,textures=True) Abstract
	Method RenderWorld(tween#=1.0) Abstract
	Method TrisRendered() Abstract

	Method ClearCollisions() Abstract
	Method Collisions(src_no,dest_no,method_no,response_no=0) Abstract
	Method CaptureWorld() Abstract
	Method UpdateWorld(anim_speed#=1.0) Abstract

	Method TFormPoint(x#,y#,z#,src:TEntity,dest:TEntity) Abstract
	Method TFormVector(x#,y#,z#,src:TEntity,dest:TEntity) Abstract
	Method TFormNormal(x#,y#,z#,src:TEntity,dest:TEntity) Abstract

	Method TFormedX#() Abstract
	Method TFormedY#() Abstract
	Method TFormedZ#() Abstract

	Method ProjectedX#() Abstract
	Method ProjectedY#() Abstract
	Method ProjectedZ#() Abstract
	
	Method LinePick:TEntity(x#,y#,z#,dx#,dy#,dz#,radius#) Abstract

	Method PickedX#() Abstract
	Method PickedY#() Abstract
	Method PickedZ#() Abstract
	Method PickedNX#() Abstract
	Method PickedNY#() Abstract
	Method PickedNZ#() Abstract
	Method PickedTime#() Abstract
	Method PickedEntity:TEntity() Abstract
	Method PickedSurface:TSurface() Abstract
	Method PickedTriangle() Abstract
		
End Type

Global blitz3d_driver:TBlitz3DDriver
