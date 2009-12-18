' spinning cube

' change Flip -> bbFlip for sdk testing

Strict

Import axe3d.m3d

'Import axe3d.minib3d
'Import axe3d.b3dsdk
'Import sidesign.minib3d

'Import axe3d.drivers - not yet implemented


Global brush:TBrush
Global cube:TEntity
Global cam:TEntity
Global light:TEntity

Graphics3D 800,600

brush=CreateBrush(255,0,0)

cube=BuildCube()'CreateCube()
ScaleEntity cube,1,1,1
PaintEntity cube,brush

cam=CreateCamera()
MoveEntity cam,0,0,-20

CameraClsColor cam,185,0,40

light=CreateLight()
MoveEntity light,-25,25,-50

While Not KeyHit(KEY_ESCAPE)
	TurnEntity cube,1,2,3
	UpdateWorld
	RenderWorld
	Flip
'	bbFlip
Wend

Function BuildCube:TEntity(parent:TEntity=Null)
	Local brush:TBrush
	Local cube:TEntity
	Local surf:TSurface
	Local x#,y#,z#
	
	cube=CreateMesh(parent)
	surf=cube.CreateSurface()
	
	x=1
	y=1
	z=1
	'top
	surf.AddVertex -x,y,-z 
	surf.AddVertex x,y,-z 
	surf.AddVertex x,y,z 
	surf.AddVertex -x,y,z 
	'bot
	surf.AddVertex -x,-y,-z 
	surf.AddVertex x,-y,-z 
	surf.AddVertex x,-y,z 
	surf.AddVertex -x,-y,z 
	'top
	surf.AddTriangle 0,3,2
	surf.AddTriangle 0,2,1
	'sides
	surf.AddTriangle 3,0,7
	surf.AddTriangle 0,4,7
	surf.AddTriangle 2,3,7 
	surf.AddTriangle 2,7,6
	surf.AddTriangle 1,2,6
	surf.AddTriangle 1,6,5
	surf.AddTriangle 0,1,5
	surf.AddTriangle 0,5,4
	'bot
	surf.AddTriangle 4,5,6
	surf.AddTriangle 4,6,7
	
	cube.UpdateNormals
			
	Return cube
End Function
