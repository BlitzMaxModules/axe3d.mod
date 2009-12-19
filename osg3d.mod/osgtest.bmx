Import axe3d.osg3d

Import pub.opengl

Extern "C" 
Function osgGetVersion$z()
Function osgmain%(imagepath$z)
End Extern

DebugLog osgGetVersion()

osgmain("test.png")
