'import "osgplugins.bmx"

Import axe3d.osg

Import "include/*.h"

Import "osgtest.cpp"

Extern "C" 

Function osgmain%(argc%,argv:Byte Ptr Ptr)

End Extern

osgmain(0,Null)

Rem
Building osgtest
Compiling:osgtest.cpp
Compiling:osgtest.bmx
flat assembler  version 1.68  (1070065 kilobytes memory)
3 passes, 2371 bytes.
Linking:osgtest.debug.exe
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x11e): undefined reference to `_imp___ZN3osg14ArgumentParserC1EPiPPc'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x136): undefined reference to `_imp___ZN9osgViewer6ViewerC1ERN3osg14ArgumentParserE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x187): undefined reference to `_imp___ZN5osgGA20TrackballManipulatorC1Ev'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x1da): undefined reference to `_imp___ZN5osgGA26KeySwitchMatrixManipulator20addMatrixManipulatorEiSsPNS_17MatrixManipulatorE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x21e): undefined reference to `_imp___ZN5osgGA17FlightManipulatorC1Ev'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x271): undefined reference to `_imp___ZN5osgGA26KeySwitchMatrixManipulator20addMatrixManipulatorEiSsPNS_17MatrixManipulatorE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x2b5): undefined reference to `_imp___ZN5osgGA16DriveManipulatorC1Ev'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x308): undefined reference to `_imp___ZN5osgGA26KeySwitchMatrixManipulator20addMatrixManipulatorEiSsPNS_17MatrixManipulatorE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x34c): undefined reference to `_imp___ZN5osgGA18TerrainManipulatorC1Ev'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x39f): undefined reference to `_imp___ZN5osgGA26KeySwitchMatrixManipulator20addMatrixManipulatorEiSsPNS_17MatrixManipulatorE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x406): undefined reference to `_imp___ZN9osgViewer4View20setCameraManipulatorEPN5osgGA17MatrixManipulatorE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x44d): undefined reference to `_imp___ZN3osg4Node19getOrCreateStateSetEv'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x46a): undefined reference to `_imp___ZN5osgGA19StateSetManipulatorC1EPN3osg8StateSetE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x481): undefined reference to `_imp___ZN9osgViewer4View15addEventHandlerEPN5osgGA15GUIEventHandlerE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x4a1): undefined reference to `_imp___ZN9osgViewer16ThreadingHandlerC1Ev'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x4b8): undefined reference to `_imp___ZN9osgViewer4View15addEventHandlerEPN5osgGA15GUIEventHandlerE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x4d8): undefined reference to `_imp___ZN9osgViewer17WindowSizeHandlerC1Ev'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x4ef): undefined reference to `_imp___ZN9osgViewer4View15addEventHandlerEPN5osgGA15GUIEventHandlerE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x50f): undefined reference to `_imp___ZN9osgViewer12StatsHandlerC1Ev'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x526): undefined reference to `_imp___ZN9osgViewer4View15addEventHandlerEPN5osgGA15GUIEventHandlerE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x588): undefined reference to `_imp___ZN9osgViewer23RecordCameraPathHandlerC1ERKSsf'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x59f): undefined reference to `_imp___ZN9osgViewer4View15addEventHandlerEPN5osgGA15GUIEventHandlerE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x5e3): undefined reference to `_imp___ZN9osgViewer15LODScaleHandlerC1Ev'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x5fa): undefined reference to `_imp___ZN9osgViewer4View15addEventHandlerEPN5osgGA15GUIEventHandlerE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x619): undefined reference to `_imp___ZN9osgViewer20ScreenCaptureHandlerC1EPNS0_16CaptureOperationE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text+0x630): undefined reference to `_imp___ZN9osgViewer4View15addEventHandlerEPN5osgGA15GUIEventHandlerE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text$_ZN5osgGA26KeySwitchMatrixManipulatorC1Ev[__ZN5osgGA26KeySwitchMatrixManipulatorC1Ev]+0x1e): undefined reference to `_imp___ZTTN5osgGA26KeySwitchMatrixManipulatorE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text$_ZN5osgGA26KeySwitchMatrixManipulatorC1Ev[__ZN5osgGA26KeySwitchMatrixManipulatorC1Ev]+0x2a): undefined reference to `_imp___ZN5osgGA17MatrixManipulatorC2Ev'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text$_ZN5osgGA26KeySwitchMatrixManipulatorC1Ev[__ZN5osgGA26KeySwitchMatrixManipulatorC1Ev]+0x37): undefined reference to `_imp___ZTVN5osgGA26KeySwitchMatrixManipulatorE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text$_ZN5osgGA26KeySwitchMatrixManipulatorC1Ev[__ZN5osgGA26KeySwitchMatrixManipulatorC1Ev]+0x49): undefined reference to `_imp___ZTVN5osgGA26KeySwitchMatrixManipulatorE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text$_ZN5osgGA26KeySwitchMatrixManipulatorC1Ev[__ZN5osgGA26KeySwitchMatrixManipulatorC1Ev]+0x5c): undefined reference to `_imp___ZTVN5osgGA26KeySwitchMatrixManipulatorE'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text$_ZN3osg6ObjectC2Ev[__ZN3osg6ObjectC2Ev]+0xd): undefined reference to `_imp___ZN3osg10ReferencedC2Ev'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text$_ZNK3osg10Referenced5unrefEv[__ZNK3osg10Referenced5unrefEv]+0x66): undefined reference to `_imp___ZN3osg10Referenced16getDeleteHandlerEv'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text$_ZNK3osg10Referenced5unrefEv[__ZNK3osg10Referenced5unrefEv]+0x77): undefined reference to `_imp___ZNK3osg10Referenced24deleteUsingDeleteHandlerEv'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text$_ZN3osg6ObjectD0Ev[__ZN3osg6ObjectD0Ev]+0x3a): undefined reference to `_imp___ZN3osg10ReferencedD2Ev'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/.bmx/osgtest.cpp.debug.win32.x86.o:osgtest.cpp:(.text$_ZN3osg6ObjectD1Ev[__ZN3osg6ObjectD1Ev]+0x3a): undefined reference to `_imp___ZN3osg10ReferencedD2Ev'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x172): undefined reference to `osgViewer::View::View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x268): undefined reference to `osgViewer::View::~View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x359): undefined reference to `osgViewer::View::View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x446): undefined reference to `osgViewer::View::~View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x551): undefined reference to `osgViewer::View::View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x2dd8): undefined reference to `osgViewer::View::setUpViewForWoWVxDisplay(unsigned int, unsigned char, unsigned char, unsigned char, float, float, float, float)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x34e3): undefined reference to `osgViewer::View::setUpViewFor3DSphericalDisplay(double, double, unsigned int, osg::Image*, osg::Matrixd const&)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x35a8): undefined reference to `osgViewer::View::setUpViewForPanoramicSphericalDisplay(double, double, unsigned int, osg::Image*, osg::Matrixd const&)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x3b23): undefined reference to `osgViewer::View::setUpViewInWindow(int, int, int, int, unsigned int)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x3b5e): undefined reference to `osgViewer::View::setUpViewInWindow(int, int, int, int, unsigned int)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x3b8b): undefined reference to `osgViewer::View::setUpViewOnSingleScreen(unsigned int)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x3c97): undefined reference to `osgViewer::View::~View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x3dc5): undefined reference to `osgViewer::View::View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x6641): undefined reference to `osgViewer::View::setUpViewForWoWVxDisplay(unsigned int, unsigned char, unsigned char, unsigned char, float, float, float, float)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x6d4c): undefined reference to `osgViewer::View::setUpViewFor3DSphericalDisplay(double, double, unsigned int, osg::Image*, osg::Matrixd const&)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x6e11): undefined reference to `osgViewer::View::setUpViewForPanoramicSphericalDisplay(double, double, unsigned int, osg::Image*, osg::Matrixd const&)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x738c): undefined reference to `osgViewer::View::setUpViewInWindow(int, int, int, int, unsigned int)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x73c7): undefined reference to `osgViewer::View::setUpViewInWindow(int, int, int, int, unsigned int)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x73f4): undefined reference to `osgViewer::View::setUpViewOnSingleScreen(unsigned int)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x7502): undefined reference to `osgViewer::View::~View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x762b): undefined reference to `osgViewer::View::View(osgViewer::View const&, osg::CopyOp const&)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x7713): undefined reference to `osgViewer::View::~View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x780c): undefined reference to `osgViewer::View::View(osgViewer::View const&, osg::CopyOp const&)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x78eb): undefined reference to `osgViewer::View::~View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x814b): undefined reference to `osgViewer::View::~View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x8179): undefined reference to `osgViewer::View::~View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x871e): undefined reference to `osgViewer::View::~View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x874e): undefined reference to `osgViewer::View::~View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x8cf6): more undefined references to `osgViewer::View::~View()' follow
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x8e4e): undefined reference to `osgViewer::View::take(osg::View&)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x9668): undefined reference to `osgViewer::View::setCameraManipulator(osgGA::MatrixManipulator*)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x9706): undefined reference to `osgViewer::View::setStartTick(unsigned long long)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0x9a34): undefined reference to `osgViewer::View::setSceneData(osg::Node*)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0xa141): undefined reference to `osgViewer::View::setUpViewInWindow(int, int, int, int, unsigned int)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0xa16d): undefined reference to `osgViewer::View::setUpViewInWindow(int, int, int, int, unsigned int)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0xa194): undefined reference to `osgViewer::View::setUpViewOnSingleScreen(unsigned int)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text+0xa1b2): undefined reference to `osgViewer::View::setUpViewAcrossAllScreens()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTVN9osgViewer6ViewerE[__ZTVN9osgViewer6ViewerE]+0xc8): undefined reference to `osgViewer::View::take(osg::View&)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTVN9osgViewer6ViewerE[__ZTVN9osgViewer6ViewerE]+0xd4): undefined reference to `osgViewer::View::createRenderer(osg::Camera*)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTVN9osgViewer6ViewerE[__ZTVN9osgViewer6ViewerE]+0xe4): undefined reference to `osgViewer::View::requestRedraw()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTVN9osgViewer6ViewerE[__ZTVN9osgViewer6ViewerE]+0xe8): undefined reference to `osgViewer::View::requestContinuousUpdate(bool)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTVN9osgViewer6ViewerE[__ZTVN9osgViewer6ViewerE]+0xec): undefined reference to `osgViewer::View::requestWarpPointer(float, float)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTVN9osgViewer6ViewerE[__ZTVN9osgViewer6ViewerE]+0x104): undefined reference to `non-virtual thunk to osgViewer::View::requestRedraw()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTVN9osgViewer6ViewerE[__ZTVN9osgViewer6ViewerE]+0x108): undefined reference to `non-virtual thunk to osgViewer::View::requestContinuousUpdate(bool)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTVN9osgViewer6ViewerE[__ZTVN9osgViewer6ViewerE]+0x10c): undefined reference to `non-virtual thunk to osgViewer::View::requestWarpPointer(float, float)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTCN9osgViewer6ViewerE64_NS_4ViewE[__ZTCN9osgViewer6ViewerE64_NS_4ViewE]+0x20): undefined reference to `osgViewer::View::take(osg::View&)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTCN9osgViewer6ViewerE64_NS_4ViewE[__ZTCN9osgViewer6ViewerE64_NS_4ViewE]+0x24): undefined reference to `osgViewer::View::~View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTCN9osgViewer6ViewerE64_NS_4ViewE[__ZTCN9osgViewer6ViewerE64_NS_4ViewE]+0x28): undefined reference to `osgViewer::View::~View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTCN9osgViewer6ViewerE64_NS_4ViewE[__ZTCN9osgViewer6ViewerE64_NS_4ViewE]+0x2c): undefined reference to `osgViewer::View::createRenderer(osg::Camera*)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTCN9osgViewer6ViewerE64_NS_4ViewE[__ZTCN9osgViewer6ViewerE64_NS_4ViewE]+0x34): undefined reference to `osgViewer::View::setStartTick(unsigned long long)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTCN9osgViewer6ViewerE64_NS_4ViewE[__ZTCN9osgViewer6ViewerE64_NS_4ViewE]+0x38): undefined reference to `osgViewer::View::setSceneData(osg::Node*)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTCN9osgViewer6ViewerE64_NS_4ViewE[__ZTCN9osgViewer6ViewerE64_NS_4ViewE]+0x3c): undefined reference to `osgViewer::View::requestRedraw()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTCN9osgViewer6ViewerE64_NS_4ViewE[__ZTCN9osgViewer6ViewerE64_NS_4ViewE]+0x40): undefined reference to `osgViewer::View::requestContinuousUpdate(bool)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTCN9osgViewer6ViewerE64_NS_4ViewE[__ZTCN9osgViewer6ViewerE64_NS_4ViewE]+0x44): undefined reference to `osgViewer::View::requestWarpPointer(float, float)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTCN9osgViewer6ViewerE64_NS_4ViewE[__ZTCN9osgViewer6ViewerE64_NS_4ViewE]+0x7c): undefined reference to `virtual thunk to osgViewer::View::~View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.rdata$_ZTCN9osgViewer6ViewerE64_NS_4ViewE[__ZTCN9osgViewer6ViewerE64_NS_4ViewE]+0x80): undefined reference to `virtual thunk to osgViewer::View::~View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text$_ZNK9osgViewer4View5cloneERKN3osg6CopyOpE[__ZNK9osgViewer4View5cloneERKN3osg6CopyOpE]+0x67): undefined reference to `osgViewer::View::View(osgViewer::View const&, osg::CopyOp const&)'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text$_ZNK9osgViewer4View9cloneTypeEv[__ZNK9osgViewer4View9cloneTypeEv]+0x61): undefined reference to `osgViewer::View::View()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Viewer.cpp.debug.win32.x86.o):Viewer.cpp:(.text$_ZN9osgViewer6Viewer10viewerInitEv[__ZN9osgViewer6Viewer10viewerInitEv]+0x11): undefined reference to `osgViewer::View::init()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Registry.cpp.debug.win32.x86.o):Registry.cpp:(.text+0xe8a1): undefined reference to `osgGetVersion'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Renderer.cpp.debug.win32.x86.o):Renderer.cpp:(.text+0x353d): undefined reference to `osgViewer::View::getDatabasePager()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Renderer.cpp.debug.win32.x86.o):Renderer.cpp:(.text+0x357d): undefined reference to `osgViewer::View::getImagePager()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Renderer.cpp.debug.win32.x86.o):Renderer.cpp:(.text+0x582e): undefined reference to `osgViewer::View::getDatabasePager()'
C:/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.win32.x86.a(Renderer.cpp.debug.win32.x86.o):Renderer.cpp:(.text+0x64f9): undefined reference to `osgViewer::View::getDatabasePager()'
Build Error: Failed to link C:/BlitzMax136/mod/axe3d.mod/osg.mod/osgtest.debug.exe
Process complete

EndRem

