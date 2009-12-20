Framework axe3d.osg3d

Import pub.opengl


Local args:Byte Ptr[3]

args[0]=AppTitle.ToCString()
args[1]="--image".ToCString()
args[2]="test.png".ToCString()
'args[2]="SF-04.jpg".ToCString()
osgmain(3,args)

args[1]="sf-04.3ds".ToCString()
osgmain(2,args)
