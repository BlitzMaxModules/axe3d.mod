
Strict

Rem
bbdoc: Max3D
End Rem
Module axe3d.m3d

ModuleInfo "Version: 0.01"
ModuleInfo "Author: Mark Sibly"
ModuleInfo "License: BSD License"

Import axe3d.ode
Import axe3d.assimp

Import "m3dexterns.bmx"

Incbin "clear.glsl"
Incbin "distantlight.glsl"
Incbin "mirror.glsl"
Incbin "model.glsl"
Incbin "pointlight.glsl"
Incbin "quad.glsl"
Incbin "shadowmap.glsl"
Incbin "spotlight.glsl"
Incbin "sprite.glsl"
Incbin "terrain.glsl"

Const FORMAT_A8=1
Const FORMAT_I8=2
Const FORMAT_L8=3
Const FORMAT_LA8=4
Const FORMAT_RGB8=5
Const FORMAT_RGBA8=6
Const FORMAT_RGB10A2=7
Const FORMAT_RGBA16F=16
Const FORMAT_DEPTH=32

Const TEXTURE_FILTER=1
Const TEXTURE_MIPMAP=2
Const TEXTURE_CLAMPS=4
Const TEXTURE_CLAMPT=8
Const TEXTURE_RENDER=16
Const TEXTURE_STATIC=32
Const TEXTURE_CLAMPST=TEXTURE_CLAMPS|TEXTURE_CLAMPT

Const WRITEMASK_RED=1
Const WRITEMASK_GREEN=2
Const WRITEMASK_BLUE=4
Const WRITEMASK_ALPHA=8
Const WRITEMASK_DEPTH=16

Const BLENDFUNC_ZERO=0
Const BLENDFUNC_ONE=1
Const BLENDFUNC_SRCALPHA=2
Const BLENDFUNC_DSTALPHA=3

Const DEPTHFUNC_F=0
Const DEPTHFUNC_LT=1
Const DEPTHFUNC_EQ=2
Const DEPTHFUNC_LE=3
Const DEPTHFUNC_GT=4
Const DEPTHFUNC_NE=5
Const DEPTHFUNC_GE=6
Const DEPTHFUNC_T=7

Const CULLMODE_NONE=0
Const CULLMODE_BACK=1
Const CULLMODE_FRONT=2

Rem
bbdoc: Max3dGraphics
End Rem
Function Max3dGraphics( w=0,h=0,d=0,r=60 )
	If w>0
		GLGraphics w,h,d,r,GRAPHICS_BACKBUFFER
	EndIf
	
	InitMax3D m3dImporter
End Function

Rem
bbdoc: LoadShader
End Rem
Function LoadShader( path$ )
	Local source$
	If source="" And FileType(path)=FILETYPE_FILE
		source=LoadString( path )
	EndIf
	If source=""
		source=String.FromBytes( IncbinPtr( path ),IncbinLen( path ) )
	EndIf
Rem
	If path.StartsWith( "<" ) And path.EndsWith( ">" )
		Local name$=path[1..path.length-1]'+".glsl"
		source=String.FromBytes( IncbinPtr( name ),IncbinLen( name ) )
	Else
		source=LoadString( path )
	EndIf
EndRem	
	DebugLog "source:"+path+"("+source.length+" bytes)"
	Return CreateShader( source )
End Function	

Rem
bbdoc: LoadTexture
End Rem
Function LoadTexture( path$ )
	Local flags=TEXTURE_FILTER|TEXTURE_MIPMAP|TEXTURE_STATIC
'	Print "Loading texture:"+path
	Local t:TPixmap=LoadPixmap( path )
	If Not t t=LoadPixmap( "../samples/"+StripDir(path) )
	If Not t t=LoadPixmap( "../media/"+StripDir(path) )
	If Not t Return 0
	Local fmt=m3dPixelFormat( t )
	Local tex=CreateTexture( t.width,t.height,fmt,flags )
	If Not tex Return 0
	SetTexturePath tex,path
	SetTextureData tex,t.pixels
	Return tex
End Function

Rem
bbdoc: LoadCubeTexture
End Rem
Function LoadCubeTexture( path$ )
	Local flags=TEXTURE_FILTER|TEXTURE_MIPMAP|TEXTURE_STATIC
'	Print "Loading cube texture:"+path
	Local t:TPixmap=LoadPixmap( path )
	If Not t t=LoadPixmap( "../samples/"+StripDir(path) )
	If Not t t=LoadPixmap( "../media/"+StripDir(path) )
	If Not t 
		DebugStop
		Return 0
	EndIf
	Local size=t.width
	If size=t.height
		Local p:TPixmap=TPixmap.Create( size,size*6,t.format )
		For Local y=0 Until 6
			p.Paste t,0,y*size
		Next
		t=p
	Else If t.height<>size*6
		Return
	EndIf
	Local fmt=m3dPixelFormat( t )
	Local tex=CreateCubeTexture( size,fmt,flags )
	If Not tex Return 0
	SetTexturePath tex,path
	SetCubeTextureData tex,t.pixels
	Return tex
End Function

Rem
bbdoc: LoadTerrain
End Rem
Function LoadTerrain( path$,material,width#,height#,depth#,collType,mass# )
	Local hmap:TPixmap=LoadPixmap( "terrain_256.png" )
	If Not hmap Return
	Local xsize=hmap.width
	Local zsize=hmap.height
	Local terrain=CreateTerrain( material,xsize,zsize,width,height,depth )
	For Local z=0 Until zsize
		For Local x=0 Until xsize
			SetTerrainHeight terrain,(ReadPixel(hmap,x,z) & $ff)/255.0,x,z
		Next
	Next
	If collType Or mass CreateTerrainBody terrain,terrain,collType,mass
	Return terrain
End Function

Rem
bbdoc: LoadMaterial
End Rem
Function LoadMaterial( path$ )
	Local material=CreateMaterial()
	Local diffuse=LoadTexture( path )
	If diffuse SetMaterialTexture material,"DiffuseMap",diffuse
	Return material
End Function

Global Max3dImportDirs$[]=["media"]		'./{DEVDIR}/max3d"]

Function m3dImporter( classz:Byte Ptr,pathz:Byte Ptr )
	Local class$=String.FromCString( classz )
	Local path$=String.FromCString( pathz )
Rem	
	If FileType( path )=FILETYPE_NONE
		Local file$=StripDir( path ),tpath$
		For Local dir$=EachIn Max3dImportDirs
			tpath=dir+"/"+file
			If FileType( tpath )=FILETYPE_FILE Exit
			tpath=""
		Next
		If Not tpath
			DebugStop
			Print "Max3d Error: Unable to locate object of type '"+class+"' at:"+path
			Return
		EndIf
		path=tpath
	EndIf
EndRem	
	Select class
	Case "CShader"
		Return LoadShader( path )
	Case "CTexture"
		Return LoadTexture( path )
	Case "CMaterial"
		Return LoadMaterial( path )
	End Select

	Print "Max3d Error: Don't know how to import object of type '"+class+"'"
	End
End Function

Function m3dPixelFormat( t:TPixmap Var )
	Select t.format
	Case PF_ALPHA 
		Return FORMAT_I8
	Case PF_RGB
		Return FORMAT_RGB8
	Case PF_RGBA
		Return FORMAT_RGBA8
	Case PF_BGR
'		t=t.Convert( PF_RGB )
		Return FORMAT_RGB8
	End Select
	Print "Max3d Error: Unknown pixel format"
	End
End Function
