
Strict

Import BRL.GLMax2D
Import BRL.GLGraphics
Import PUB.Glew
Import BRL.BMPLoader
Import BRL.PNGLoader
Import BRL.JPGLoader
Import BRL.Retro
'Import BRLrl.standardio

Import axe3d.Blitz3D

Import "externs.bmx"

' entity
Include "inc/TEntity.bmx"
Include "inc/TPivot.bmx"
Include "inc/TCamera.bmx"
Include "inc/TLight.bmx"
Include "inc/TMesh.bmx"
Include "inc/TSprite.bmx"
Include "inc/TBone.bmx"

' mesh structure
Include "inc/TSurface.bmx"
Include "inc/TTexture.bmx"
Include "inc/TBrush.bmx"
Include "inc/TAnimation.bmx"
Include "inc/TModel.bmx"

' picking/collision
Include "inc/TColTree.bmx"
Include "inc/TPick.bmx"
Include "inc/TCollision.bmx"

' geom
Include "inc/TQuaternion.bmx"
Include "inc/BoxSphere.bmx"

' misc
Include "inc/THardwareInfo.bmx"
Include "inc/TBlitz2D.bmx"
Include "inc/TUtility.bmx"
'Include "inc/TDebug.bmx"

' data
Include "inc/data.bmx"

blitz3d_driver = New TMiniB3DDriver

Type TMiniB3DDriver Extends TBlitz3DDriver

	Global width,height,mode,depth,rate
	Global ambient_red#=0.5,ambient_green#=0.5,ambient_blue#=0.5

	Global vbo_enabled=False ' this is set in GraphicsInit - will be set to true if USE_VBO is true and the hardware supports vbos

	' anti aliasing globs
	Global aa ' anti_alias true/false
	Global ACSIZE ' accum size
	Global jitter
	Global j#[16,2]


	Method CreateBrush:TBrush(red#,green#,blue#)	
	End Method

	Method LoadBrush:TBrush(texture_path$,flags=1,u_scale#=1,v_scale#=1)	
	End Method

	Method LoadTexture:TTexture(file$,flags=1)
	End Method
	
	Method CreateTexture:TTexture(width,height,flags=0,frames=1)
	End Method




	Method CreateMesh:TEntity(parent:TEntity=Null)	
		Local mesh:TMesh
		mesh=TMesh.CreateMesh()
		mesh.SetParent(parent)
		Return mesh
	End Method

	Method CreatePivot:TEntity(parent:TEntity=Null)
	End Method

	Method CreateSphere:TEntity(segments=8,parent:TEntity=Null)
		Local mesh:TMesh
		mesh=TMesh.CreateCube()
		mesh.SetParent(parent)
		Return mesh
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
		Local light:TLight
		light=TLight.CreateLight(light_type)
		light.SetParent(parent)
		Return light
	End Method

	Method CreateCube:TEntity(parent:TEntity=Null)
		Local mesh:TMesh
		mesh=TMesh.CreateCube()
		mesh.SetParent(parent)
		Return mesh
	End Method

	Method CreateCamera:TEntity(parent:TEntity=Null)
		Local cam:TCamera
		cam=TCamera.CreateCamera()
		cam.SetParent(parent)
		Return cam
	End Method
	
	Method TFormPoint(x#,y#,z#,src_ent:TEntity,dest_ent:TEntity)
		TMiniEntity.TFormPoint(x,y,z,src_ent,dest_ent)
	End Method
		
	Method TFormVector(x#,y#,z#,src_ent:TEntity,dest_ent:TEntity)
		TMiniEntity.TFormVector(x,y,z,src_ent,dest_ent)
	End Method

	Method TFormNormal(x#,y#,z#,src_ent:TEntity,dest_ent:TEntity)
		TMiniEntity.TFormNormal(x,y,z,src_ent,dest_ent)
	End Method

	Method TFormedX#()
		Return TMiniEntity.tformed_x
	End Method

	Method TFormedY#()
		Return TMiniEntity.tformed_y
	End Method

	Method TFormedZ#()
		Return TMiniEntity.tformed_z
	End Method
	
	Method ProjectedX#()
	End Method
	Method ProjectedY#()
	End Method
	Method ProjectedZ#()
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
	
	
	Method Graphics3D:TGraphics(w,h,d=0,m=0,r=60)

		'mode:
		'0: windowed in debug mode, fullscreen in non-debug mode 
		'1: full-screen always 
		'2: windowed always 

		' change depth values so that Graphics will behave in the same way as Blitz3D-style Graphics3D
		Select m
			Case 0
				?debug
					d=0
				?
				?Not debug
					If d=0 Then d=16
				?
			Case 1
				If d=0 Then d=16
			Case 2
				d=0		
			Default
				d=0		
		End Select
			
		width=w
		height=h
		depth=d
		mode=m
		rate=r
		
		SetGraphicsDriver(GLMax2DDriver()) 
		Local g:TGraphics
		
		g=Graphics(width,height,depth,rate,GRAPHICS_BACKBUFFER|GRAPHICS_DEPTHBUFFER|GRAPHICS_ACCUMBUFFER)

		GraphicsInit()
		
		Return g		
								
	End Method

	Method AntiAlias(samples)

		aa=True

		If samples=False Then aa=0;Return
		
		Select samples
			Case 1 RestoreData j2; ACSIZE=2
			Case 2 RestoreData j2; ACSIZE=2
			Case 3 RestoreData j3; ACSIZE=3
			Case 4 RestoreData j4; ACSIZE=4
			Case 5 RestoreData j5; ACSIZE=5
			Case 6 RestoreData j6; ACSIZE=6
			Case 8 RestoreData j8; ACSIZE=8
			Case 9 RestoreData j9; ACSIZE=9
			Case 12 RestoreData j12; ACSIZE=12
			Case 16 RestoreData j16; ACSIZE=16
			Default aa=False; ACSIZE=0; Return
		End Select

		For Local i=0 Until samples
		
			ReadData j[i,0],j[i,1]
		
		Next

	End Method
	
	Method Wireframe(enable)
	
		If enable
			glPolygonMode(GL_FRONT,GL_LINE)
		Else
			glPolygonMode(GL_FRONT,GL_FILL)
		EndIf

	End Method
	
	Method AmbientLight(r#,g#,b#)
	
		ambient_red#=r#/255.0
		ambient_green#=g#/255.0
		ambient_blue#=b#/255.0
	
	End Method
	
	Method ClearCollisions()
	
		For Local col:TCollisionPair=EachIn TCollisionPair.list
			col=Null
		Next

	End Method

	Method Collisions(src_no,dest_no,method_no,response_no=0)
	
		Local col:TCollisionPair=New TCollisionPair
		col.src_type=src_no
		col.des_type=dest_no
		col.col_method=method_no
		col.response=response_no
		
		' check to see if same collision pair already exists
		For Local col2:TCollisionPair=EachIn TCollisionPair.list
			If col2.src_type=col.src_type
				If col2.des_type=col.des_type
					
					' overwrite old method and response values
					col2.col_method=col.col_method
					col2.response=col.response

					Return

				EndIf
			EndIf
		Next
		
		ListAddLast(TCollisionPair.list,col)
	
	End Method
	
	Method ClearWorld(entities=True,brushes=True,textures=True)
	
		If entities
			
			For Local ent:TMiniEntity=EachIn TMiniEntity.entity_list
				ent.FreeEntity()
				ent=Null
			Next
			
			ClearCollisions
			
			ClearList(TPick.ent_list)
			TPick.picked_ent=Null
			TPick.picked_surface=Null
			
		EndIf
		
		If textures
		
			For Local tex:TMiniTexture=EachIn TMiniTexture.tex_list
				tex.FreeTexture()
			Next
		
		EndIf
	
	End Method

	Method TransformWorld()
		TMiniEntity.entity_root.TransformEntity()
	End Method
			
	Method UpdateWorld(anim_speed#=1.0)

		' flush transformations
		
		TransformWorld()
		
		' collision
		
		UpdateCollisions()
		
		' anim
	
		Local first
		Local last

		For Local mesh:TMiniEntity=EachIn TMiniEntity.entity_list
		
			If mesh.anim And mesh.anim_update=True
			
				first=mesh.anim_seqs_first[mesh.anim_seq]
				last=mesh.anim_seqs_last[mesh.anim_seq]
		
				Local anim_start=False

				If mesh.anim_trans>0
					mesh.anim_trans=mesh.anim_trans-1
					If mesh.anim_trans=1 Then anim_start=True
				EndIf
				
				If mesh.anim_trans>0
				
					Local r#=1.0-mesh.anim_time#
					r#=r#/mesh.anim_trans
					mesh.anim_time#=mesh.anim_time+r#
									
					TAnimation.AnimateMesh2(mesh,mesh.anim_time#,first,last)
					
					If anim_start=True Then mesh.anim_time#=first
			
				Else
				
					TAnimation.AnimateMesh(mesh,mesh.anim_time#,first,last)
					
					If mesh.anim_mode=0 Then mesh.anim_update=False ' after updating animation so that animation is in final 'stop' pose - don't update again
		
					If mesh.anim_mode=1
			
						mesh.anim_time#=mesh.anim_time#+(mesh.anim_speed#*anim_speed#)
						If mesh.anim_time#>last
							mesh.anim_time#=first+(mesh.anim_time#-last)
						EndIf
					
					EndIf
					
					If mesh.anim_mode=2
					
						If mesh.anim_dir=1
							mesh.anim_time#=mesh.anim_time#+(mesh.anim_speed#*anim_speed#)
							If mesh.anim_time#>last
								mesh.anim_time#=mesh.anim_time#-(mesh.anim_speed#*anim_speed#)
								mesh.anim_dir=-1
							EndIf
						EndIf
						
						If mesh.anim_dir=-1
							mesh.anim_time#=mesh.anim_time#-(mesh.anim_speed#*anim_speed#)
							If mesh.anim_time#<first
								mesh.anim_time#=mesh.anim_time#+(mesh.anim_speed#*anim_speed#)
								mesh.anim_dir=1
							EndIf
						EndIf
					
					EndIf
					
					If mesh.anim_mode=3
			
						mesh.anim_time#=mesh.anim_time#+(mesh.anim_speed#*anim_speed#)
						If mesh.anim_time#>last
							mesh.anim_time#=last
							mesh.anim_mode=0
						EndIf
					
					EndIf
					
				EndIf
							
			EndIf
		
		Next
	
	End Method

	Method CaptureWorld()
	End Method

	Method TrisRendered()
	End Method

	Method RenderWorld(tween#)

		TransformWorld()
	
		' if anti-aliasing enabled then call RenderWorldAA
		If aa Then RenderWorldAA();Return

		For Local cam:TCamera=EachIn TCamera.cam_list

			'If cam.parent_hidden=True Or cam.hidden=True Then Continue
			If cam.Hidden()=True Then Continue

			RenderCamera(cam)

		Next

	End Method
	
	' Same as RenderWorld but with anti-aliasing
	Method RenderWorldAA()
	
		glClear(GL_ACCUM_BUFFER_BIT)
	
		For jitter=0 Until ACSIZE
				
			For Local cam:TCamera=EachIn TCamera.cam_list
	
				'If cam.parent_hidden=True Or cam.hidden=True Then Continue
				If cam.Hidden()=True Then Continue
	
				RenderCamera(cam)
	
			Next
			
			glAccum(GL_ACCUM,1.0/ACSIZE)
	
		Next
		jitter=0
		
		glAccum(GL_RETURN,1.0)
		glFlush()
	
	End Method

	' Render camera - renders all meshes camera can see
	Method RenderCamera(cam:TCamera)

		cam.Update()
	
		For Local light:TLight=EachIn TLight.light_list
	
			light.Update() ' EntityHidden code inside Update
			
		Next

		Local render_list:TList=CreateList:TList()
		
		For Local mesh:TMesh=EachIn TMiniEntity.entity_list
		
			'If mesh.parent_hidden=True Or mesh.hidden=True Or mesh.brush.alpha=0.0 Then Continue
			If mesh.Hidden()=True Or mesh.brush.alpha=0.0 Then Continue
		
			' get new bounds
			mesh.GetBounds()
	
			' Perform frustum cull
			
			Local inview=cam.EntityInFrustum(mesh)

			If inview
			
				If mesh.auto_fade=True Then AutoFade(cam,mesh)
			
				If mesh.Alpha()
			
					mesh.alpha_order#=cam.EntityDistanceSquared#(mesh)
				
				Else
				
					mesh.alpha_order#=0.0
				
				EndIf
			
				RenderListAdd(mesh,render_list)
				
			EndIf
	
		Next

		UpdateSprites(cam,render_list) ' rotate sprites with respect to current cam

		' Draw everything in render list
		For Local mesh2:TMesh=EachIn render_list

			mesh2.Update()
	
		Next

	End Method
	
	Method AutoFade(cam:TCamera,mesh:TMesh)

		Local dist#=cam.EntityDistance#(mesh)
		
		If dist>mesh.fade_near And dist<mesh.fade_far
		
			' fade_alpha will be in the range 0 (near) to 1 (far)
			mesh.fade_alpha=(dist-mesh.fade_near)/(mesh.fade_far-mesh.fade_near)
	
		Else
		
			' if entity outside near, far range then set min/max values
			If dist<mesh.fade_near Then mesh.fade_alpha#=0.0 Else mesh.fade_alpha#=1.0
			
		EndIf

	End Method

	Method GraphicsInit()
	
		TMiniTexture.TextureFilter("",9)
	
		glewInit() ' required for ARB funcs

		' get hardware info and set vbo_enabled accordingly
		THardwareInfo.GetInfo()
		'THardwareInfo.DisplayInfo()
		If USE_VBO=True
			vbo_enabled=THardwareInfo.VBOSupport
		EndIf

		If USE_MAX2D=True

			' save the Max2D settings for later - by Oddball
			glPushAttrib GL_ALL_ATTRIB_BITS
			glPushClientAttrib GL_CLIENT_ALL_ATTRIB_BITS
			glMatrixMode GL_MODELVIEW
			glPushMatrix
			glMatrixMode GL_PROJECTION
			glPushMatrix
			glMatrixMode GL_TEXTURE
			glPushMatrix
			glMatrixMode GL_COLOR
			glPushMatrix
		
		EndIf
		
		EnableStates()
		
		glLightModeli(GL_LIGHT_MODEL_COLOR_CONTROL,GL_SEPARATE_SPECULAR_COLOR)
		glLightModeli(GL_LIGHT_MODEL_LOCAL_VIEWER,GL_TRUE)

		glClearDepth(1.0)						
		glDepthFunc(GL_LEQUAL)
		glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST)

		glAlphaFunc(GL_GEQUAL,0.5)
		
	End Method
	
	Function EnableStates()
	
		glEnable(GL_LIGHTING)
   		glEnable(GL_DEPTH_TEST)
		glEnable(GL_FOG)
		glEnable(GL_CULL_FACE)
		glEnable(GL_SCISSOR_TEST)
		
		glEnable(GL_NORMALIZE)
		
		glEnableClientState(GL_VERTEX_ARRAY)
		glEnableClientState(GL_COLOR_ARRAY)
		glEnableClientState(GL_NORMAL_ARRAY)
	
	End Function
	
	' Adds mesh to a render list, and inserts mesh into correct position within list depending on order and alpha values
	Method RenderListAdd(mesh:TMesh,List:TList)
	
		' if order>0, drawn first (will appear at back of scene)
		' if order<0, drawn last (will appear at front of scene)
	
		Local llink:TLink=list._head ' get start/end link (llink = local link, so as not to clash with entity's link var)
	
		If mesh.order>0

			' --- add first ---
		
			' add entity to start of list
			' entites with order>0 should be added to the start of the list
		
			' cycle fowards through list until we've passed all entities with order>0, or if entity itself has order>0,
			' it's own position within entities with order>0
			Repeat
				llink=llink._succ
			Until llink=list._head Or TMiniEntity(llink.Value()).order<=mesh.order
	
			list.InsertBeforeLink(mesh,llink)
			Return
	
		Else If mesh.order<0 ' put entities with order<0 at back of list

			' --- add last ---
	
			' add entity to end of list
			' only entites with order<=0 should be added to the end of the list
		
			' cycle backwards through list until we've passed all entities with order<0, or if entity itself has order<0,
			' it's own position within entities with order<0
			Repeat
				llink=llink._pred
			Until llink=list._head Or TMIniEntity(llink.Value()).order>=mesh.order
	
			list.InsertAfterLink(mesh,llink)
			Return

		EndIf
		
		' order=0
		
		If mesh.alpha_order#>0.0
		
			' add alpha entities to near end of list - before entities with order<0

			Repeat
				llink=llink._pred
				If llink=list._head Then Exit
			Until TMiniEntity(llink.Value()).order>=0 And (TMiniEntity(llink.Value()).alpha_order>=mesh.alpha_order Or TMiniEntity(llink.Value()).alpha_order=0.0)

			list.InsertAfterLink(mesh,llink)
			Return
		
		Else
			
			' normal entities - add to list at start - after entities with order>0
		
			Repeat
				llink=llink._succ
			Until llink=list._head Or TMiniEntity(llink.Value()).order<=0

			list.InsertBeforeLink(mesh,llink)
			Return
			
		EndIf
		
	End Method

	Method UpdateSprites(cam:TCamera,list:TList)

		For Local sprite:TSprite=EachIn list

			If sprite.view_mode<>2
			
				Local x#=sprite.global_mat.grid[3,0]
				Local y#=sprite.global_mat.grid[3,1]
				Local z#=sprite.global_mat.grid[3,2]
			
				sprite.mat_sp.Overwrite(cam)
				sprite.mat_sp.grid[3,0]=x
				sprite.mat_sp.grid[3,1]=y
				sprite.mat_sp.grid[3,2]=z
				
				If sprite.angle#<>0.0
					sprite.mat_sp.Roll(sprite.angle#)
				EndIf
				
				If sprite.scale_x#<>1.0 Or sprite.scale_y#<>1.0
					sprite.mat_sp.Scale(sprite.scale_x#,sprite.scale_y#,1.0)
				EndIf
				
				If sprite.handle_x#<>0.0 Or sprite.handle_y#<>0.0
					sprite.mat_sp.Translate(-sprite.handle_x#,-sprite.handle_y#,0.0)
				EndIf
				
			Else
			
				sprite.mat_sp.Overwrite(sprite.global_mat)
				
				If sprite.scale_x#<>1.0 Or sprite.scale_y#<>1.0
					sprite.mat_sp.Scale(sprite.scale_x#,sprite.scale_y#,1.0)
				EndIf
	
			EndIf
			
		Next
	
	End Method
				
End Type

