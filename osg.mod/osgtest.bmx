Framework axe3d.osg3d

?MacOS
Import "-framework AGL"
Import "-framework OpenGL"
?Win32
Import "-lglu32"
Import "-lopengl32"
?Linux
Import "-lGL"
Import "-lGLU"
Import "-lpthread"
?


Extern "C" 

Function osgGetVersion$z()

Function osgmain%()

End Extern

<<<<<<< .mine
DebugLog "OSGVersion="+osgGetVersion()
=======
>>>>>>> .r101


'Print "OSGVersion="+osgGetVersion()

osgmain()
