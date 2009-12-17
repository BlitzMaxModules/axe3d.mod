' osg module import list

' file mapping changes from official distribution
' to avoid name clashes in osg.mod
'
' viewer/view.cp -> viewer/viewerview.cpp
' path/version.cpp -> path/pathversion.cpp

Strict

ModuleInfo "LD_OPTS: -Map test.map" 
ModuleInfo "CC_OPTS: -fexceptions" 
ModuleInfo "CC_OPTS: -DOT_LIBRARY_STATIC"
ModuleInfo "CC_OPTS: -DOSG_LIBRARY_STATIC"
?Win32
ModuleInfo "CC_OPTS: -D_GLIBCXX_USE_WCHAR_T"
?

Import "../osg.mod/include/*.h"

Import "../../pub.mod/freetype.mod/include/*.h"
Import "../../axe.mod/jasper.mod/*.h"
'Import "../../pub.mod/libjpeg.mod/*.h"
Import "../../pub.mod/libpng.mod/*.h"
Import "../../pub.mod/zlib.mod/*.h"

Import osg.openthreads
Import osg.osg
Import osg.osgdb
Import osg.osgfx
Import osg.osgga
Import osg.osgutil
Import osg.osgviewer

Import "osgtest.cpp"
