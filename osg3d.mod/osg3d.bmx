Strict

Rem
bbdoc: OSG axe3d driver
End Rem

Module axe3d.osg3d

ModuleInfo "Version: 1.00"
ModuleInfo "Author: Simon Armstrong"

ModuleInfo "History: 0.01 Release"

ModuleInfo "CC_OPTS: -fexceptions" 
ModuleInfo "CC_OPTS: -DOT_LIBRARY_STATIC"
ModuleInfo "CC_OPTS: -DOSG_LIBRARY_STATIC"
?Win32
ModuleInfo "CC_OPTS: -D_GLIBCXX_USE_WCHAR_T"
?

Import osg.openthreads
Import osg.osg
Import osg.osgdb
Import osg.osgfx
Import osg.osgga
Import osg.osgtext
Import osg.osgutil
Import osg.osgmanipulator
Import osg.osgwidget

Import osgplugins.png
Import osgplugins.bmp
Import osgplugins.tga

'Import osgplugins.freetype

Import osgplugins.autodesk3ds
Import osgplugins.lwo
Import osgplugins.lws
Import osgplugins.vrml

Import osg.osgviewer

Import "../../osg.mod/osg.mod/include/*.h"

Import "osgtest.cpp"

Extern "C" 
	Function osgGetVersion$z()
	Function osgmain%(argc%,argv:Byte Ptr Ptr)
End Extern
