
Strict

Framework axe3d.m3d
'Framework bmx3d.max3d

Max3dGraphics 800,600

SetClearColor 0,.1,.4

Local camera=CreateCamera()
MoveEntity camera,0,2,-2

Local yellow=CreateMaterial()
SetMaterialColor yellow,"DiffuseColor",1,1,0

Local entity=CreateBox( yellow,1,1,1,2,0 )
MoveEntity entity,0,2,0

Local light=CreatePointLight()
MoveEntity light,6,10,-10

SetAmbientColor .5,.5,.5

Local green=CreateMaterial()
SetMaterialColor green,"DiffuseColor",0,1,0

Local ground=CreateBox( green,100,.1,100,2,0 )
 
While Not KeyHit( KEY_ESCAPE )	
	If entity
		TurnEntity entity,1,2,3 
	EndIf
	RenderWorld
	Flip
Wend
