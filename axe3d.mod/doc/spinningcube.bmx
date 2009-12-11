' spinning cube

' change Flip -> bbFlip for sdk testing

'Import axe3d.b3dsdk
'Import axe3d.minib3d
Import axe3d.m3d
'Import sidesign.minib3d

'Import axe3d.drivers

Graphics3D 800,600

cube=CreateCube()
ScaleEntity cube,1,1,1

cam=CreateCamera()
MoveEntity cam,0,0,-2

CameraClsColor cam,185,0,40

light=CreateLight()
MoveEntity light,-25,25,-50

While Not KeyHit(KEY_ESCAPE)
	TurnEntity cube,1,2,3
'	TurnEntity cube2,0,1,0
	UpdateWorld
	RenderWorld
	Flip
'	bbFlip
'	Delay 20
Wend
