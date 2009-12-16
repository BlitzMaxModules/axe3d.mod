Framework axe3d.osg3d

'Import brl.standardio
Import pub.opengl

Import "-lgcc"

Extern "C" 
Function osgGetVersion$z()
Function osgmain%()
End Extern


'DebugLog "OSGVersion="+osgGetVersion()

DebugStop

osgmain()

