Import axe3d.osg3d

Import pub.opengl

Extern "C" 
Function osgGetVersion$z()
Function osgmain%()
'Function __do_global_ctors_aux()
Function graphicswindow_X11()
Function graphicswindow_Win32()
End Extern

?Win32
graphicswindow_Win32()
?
?Linux
graphicswindow_X11()
?

osgmain()
