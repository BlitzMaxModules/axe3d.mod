Import axe3d.osg

Extern "C" 

Function osgGetVersion$z()

Function osgmain%(argc%,argv:Byte Ptr Ptr)

End Extern

Print osgGetVersion()

'osgmain(0,Null)


Rem

Building osgtest
Compiling:osgtest.bmx
flat assembler  version 1.68  (32768 kilobytes memory)
3 passes, 2480 bytes.
Linking:osgtest.debug
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(osgtest.cpp.debug.linux.x86.o): In function `osgmain':
osgtest.cpp:(.text+0x349): undefined reference to `osgViewer::View::setCameraManipulator(osgGA::MatrixManipulator*)'
osgtest.cpp:(.text+0x3ab): undefined reference to `osgViewer::View::addEventHandler(osgGA::GUIEventHandler*)'
osgtest.cpp:(.text+0x3d8): undefined reference to `osgViewer::View::addEventHandler(osgGA::GUIEventHandler*)'
osgtest.cpp:(.text+0x405): undefined reference to `osgViewer::View::addEventHandler(osgGA::GUIEventHandler*)'
osgtest.cpp:(.text+0x432): undefined reference to `osgViewer::View::addEventHandler(osgGA::GUIEventHandler*)'
osgtest.cpp:(.text+0x494): undefined reference to `osgViewer::View::addEventHandler(osgGA::GUIEventHandler*)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(osgtest.cpp.debug.linux.x86.o):osgtest.cpp:(.text+0x4d7): more undefined references to `osgViewer::View::addEventHandler(osgGA::GUIEventHandler*)' follow
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(ViewerEventHandlers.cpp.debug.linux.x86.o): In function `osgViewer::InteractiveImageHandler::mousePosition(osgViewer::View*, osg::NodeVisitor*, osgGA::GUIEventAdapter const&, int&, int&) const':
ViewerEventHandlers.cpp:(.text+0x3a8): undefined reference to `osgViewer::View::computeIntersections(float, float, std::multiset<osgUtil::LineSegmentIntersector::Intersection, std::less<osgUtil::LineSegmentIntersector::Intersection>, std::allocator<osgUtil::LineSegmentIntersector::Intersection> >&, unsigned int)'
ViewerEventHandlers.cpp:(.text+0x408): undefined reference to `osgViewer::View::computeIntersections(float, float, std::vector<osg::Node*, std::allocator<osg::Node*> > const&, std::multiset<osgUtil::LineSegmentIntersector::Intersection, std::less<osgUtil::LineSegmentIntersector::Intersection>, std::allocator<osgUtil::LineSegmentIntersector::Intersection> >&, unsigned int)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(ViewerEventHandlers.cpp.debug.linux.x86.o): In function `osgViewer::InteractiveImageHandler::handle(osgGA::GUIEventAdapter const&, osgGA::GUIActionAdapter&, osg::Object*, osg::NodeVisitor*)':
ViewerEventHandlers.cpp:(.text+0xc83): undefined reference to `typeinfo for osgViewer::View'
ViewerEventHandlers.cpp:(.text+0xd3a): undefined reference to `typeinfo for osgViewer::View'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(ViewerEventHandlers.cpp.debug.linux.x86.o): In function `osgViewer::LODScaleHandler::handle(osgGA::GUIEventAdapter const&, osgGA::GUIActionAdapter&)':
ViewerEventHandlers.cpp:(.text+0x19e7): undefined reference to `typeinfo for osgViewer::View'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(ViewerEventHandlers.cpp.debug.linux.x86.o): In function `osgViewer::RecordCameraPathHandler::handle(osgGA::GUIEventAdapter const&, osgGA::GUIActionAdapter&)':
ViewerEventHandlers.cpp:(.text+0x1dc6): undefined reference to `typeinfo for osgViewer::View'
ViewerEventHandlers.cpp:(.text+0x2933): undefined reference to `osgViewer::View::setCameraManipulator(osgGA::MatrixManipulator*)'
ViewerEventHandlers.cpp:(.text+0x297e): undefined reference to `osgViewer::View::setCameraManipulator(osgGA::MatrixManipulator*)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(ViewerEventHandlers.cpp.debug.linux.x86.o): In function `osgViewer::ThreadingHandler::handle(osgGA::GUIEventAdapter const&, osgGA::GUIActionAdapter&)':
ViewerEventHandlers.cpp:(.text+0x2f35): undefined reference to `typeinfo for osgViewer::View'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(ViewerEventHandlers.cpp.debug.linux.x86.o): In function `osgViewer::WindowSizeHandler::handle(osgGA::GUIEventAdapter const&, osgGA::GUIActionAdapter&)':
ViewerEventHandlers.cpp:(.text+0x3b5d): undefined reference to `typeinfo for osgViewer::View'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::Viewer::setStartTick(unsigned long long)':
Viewer.cpp:(.text+0x19e): undefined reference to `osgViewer::View::setStartTick(unsigned long long)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::Viewer::setSceneData(osg::Node*)':
Viewer.cpp:(.text+0x5e4): undefined reference to `osgViewer::View::setSceneData(osg::Node*)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::Viewer::take(osgViewer::View&)':
Viewer.cpp:(.text+0x1ebb): undefined reference to `osgViewer::View::take(osg::View&)'
Viewer.cpp:(.text+0x1ee2): undefined reference to `typeinfo for osgViewer::View'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::Viewer::realize()':
Viewer.cpp:(.text+0x40f6): undefined reference to `osgViewer::View::setUpViewInWindow(int, int, int, int, unsigned int)'
Viewer.cpp:(.text+0x412a): undefined reference to `osgViewer::View::setUpViewInWindow(int, int, int, int, unsigned int)'
Viewer.cpp:(.text+0x4147): undefined reference to `osgViewer::View::setUpViewOnSingleScreen(unsigned int)'
Viewer.cpp:(.text+0x4157): undefined reference to `osgViewer::View::setUpViewAcrossAllScreens()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::Viewer::run()':
Viewer.cpp:(.text+0x46e4): undefined reference to `osgViewer::View::setCameraManipulator(osgGA::MatrixManipulator*)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::Viewer::readConfiguration(std::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)':
Viewer.cpp:(.text+0x4887): undefined reference to `typeinfo for osgViewer::View'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::Viewer::~Viewer()':
Viewer.cpp:(.text+0x4c53): undefined reference to `osgViewer::View::~View()'
Viewer.cpp:(.text+0x4c8c): undefined reference to `osgViewer::View::~View()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::Viewer::~Viewer()':
Viewer.cpp:(.text+0x5083): undefined reference to `osgViewer::View::~View()'
Viewer.cpp:(.text+0x50bc): undefined reference to `osgViewer::View::~View()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::Viewer::~Viewer()':
Viewer.cpp:(.text+0x54a3): undefined reference to `osgViewer::View::~View()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):Viewer.cpp:(.text+0x54db): more undefined references to `osgViewer::View::~View()' follow
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::Viewer::Viewer(osgViewer::Viewer const&, osg::CopyOp const&)':
Viewer.cpp:(.text+0x5856): undefined reference to `osgViewer::View::View(osgViewer::View const&, osg::CopyOp const&)'
Viewer.cpp:(.text+0x58f2): undefined reference to `osgViewer::View::~View()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::Viewer::Viewer(osgViewer::Viewer const&, osg::CopyOp const&)':
Viewer.cpp:(.text+0x59a0): undefined reference to `osgViewer::View::View(osgViewer::View const&, osg::CopyOp const&)'
Viewer.cpp:(.text+0x5a46): undefined reference to `osgViewer::View::~View()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::Viewer::Viewer()':
Viewer.cpp:(.text+0x5ad1): undefined reference to `osgViewer::View::View()'
Viewer.cpp:(.text+0x5b78): undefined reference to `osgViewer::View::~View()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::Viewer::Viewer()':
Viewer.cpp:(.text+0x5c15): undefined reference to `osgViewer::View::View()'
Viewer.cpp:(.text+0x5cc6): undefined reference to `osgViewer::View::~View()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::Viewer::Viewer(osg::ArgumentParser&)':
Viewer.cpp:(.text+0x5d55): undefined reference to `osgViewer::View::View()'
Viewer.cpp:(.text+0x8481): undefined reference to `osgViewer::View::setUpViewForWoWVxDisplay(unsigned int, unsigned char, unsigned char, unsigned char, float, float, float, float)'
Viewer.cpp:(.text+0x8b68): undefined reference to `osgViewer::View::setUpViewFor3DSphericalDisplay(double, double, unsigned int, osg::Image*, osg::Matrixd const&)'
Viewer.cpp:(.text+0x8c21): undefined reference to `osgViewer::View::setUpViewForPanoramicSphericalDisplay(double, double, unsigned int, osg::Image*, osg::Matrixd const&)'
Viewer.cpp:(.text+0x8d5b): undefined reference to `osgViewer::View::setUpViewInWindow(int, int, int, int, unsigned int)'
Viewer.cpp:(.text+0x8d9b): undefined reference to `osgViewer::View::setUpViewInWindow(int, int, int, int, unsigned int)'
Viewer.cpp:(.text+0x8dc1): undefined reference to `osgViewer::View::setUpViewOnSingleScreen(unsigned int)'
Viewer.cpp:(.text+0x8ea6): undefined reference to `osgViewer::View::~View()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::Viewer::Viewer(osg::ArgumentParser&)':
Viewer.cpp:(.text+0x8f77): undefined reference to `osgViewer::View::View()'
Viewer.cpp:(.text+0xb6b2): undefined reference to `osgViewer::View::setUpViewForWoWVxDisplay(unsigned int, unsigned char, unsigned char, unsigned char, float, float, float, float)'
Viewer.cpp:(.text+0xbd99): undefined reference to `osgViewer::View::setUpViewFor3DSphericalDisplay(double, double, unsigned int, osg::Image*, osg::Matrixd const&)'
Viewer.cpp:(.text+0xbe52): undefined reference to `osgViewer::View::setUpViewForPanoramicSphericalDisplay(double, double, unsigned int, osg::Image*, osg::Matrixd const&)'
Viewer.cpp:(.text+0xbf8c): undefined reference to `osgViewer::View::setUpViewInWindow(int, int, int, int, unsigned int)'
Viewer.cpp:(.text+0xbfcc): undefined reference to `osgViewer::View::setUpViewInWindow(int, int, int, int, unsigned int)'
Viewer.cpp:(.text+0xbff2): undefined reference to `osgViewer::View::setUpViewOnSingleScreen(unsigned int)'
Viewer.cpp:(.text+0xc0d5): undefined reference to `osgViewer::View::~View()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::View::isSameKindAs(osg::Object const*) const':
Viewer.cpp:(.text._ZNK9osgViewer4View12isSameKindAsEPKN3osg6ObjectE[osgViewer::View::isSameKindAs(osg::Object const*) const]+0x2e): undefined reference to `typeinfo for osgViewer::View'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::View::clone(osg::CopyOp const&) const':
Viewer.cpp:(.text._ZNK9osgViewer4View5cloneERKN3osg6CopyOpE[osgViewer::View::clone(osg::CopyOp const&) const]+0x3c): undefined reference to `osgViewer::View::View(osgViewer::View const&, osg::CopyOp const&)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::View::cloneType() const':
Viewer.cpp:(.text._ZNK9osgViewer4View9cloneTypeEv[osgViewer::View::cloneType() const]+0x2e): undefined reference to `osgViewer::View::View()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o): In function `osgViewer::Viewer::viewerInit()':
Viewer.cpp:(.text._ZN9osgViewer6Viewer10viewerInitEv[osgViewer::Viewer::viewerInit()]+0x10): undefined reference to `osgViewer::View::init()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTVN9osgViewer6ViewerE[vtable for osgViewer::Viewer]+0xc8): undefined reference to `osgViewer::View::take(osg::View&)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTVN9osgViewer6ViewerE[vtable for osgViewer::Viewer]+0xd4): undefined reference to `osgViewer::View::createRenderer(osg::Camera*)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTVN9osgViewer6ViewerE[vtable for osgViewer::Viewer]+0xe4): undefined reference to `osgViewer::View::requestRedraw()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTVN9osgViewer6ViewerE[vtable for osgViewer::Viewer]+0xe8): undefined reference to `osgViewer::View::requestContinuousUpdate(bool)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTVN9osgViewer6ViewerE[vtable for osgViewer::Viewer]+0xec): undefined reference to `osgViewer::View::requestWarpPointer(float, float)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTVN9osgViewer6ViewerE[vtable for osgViewer::Viewer]+0x104): undefined reference to `non-virtual thunk to osgViewer::View::requestRedraw()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTVN9osgViewer6ViewerE[vtable for osgViewer::Viewer]+0x108): undefined reference to `non-virtual thunk to osgViewer::View::requestContinuousUpdate(bool)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTVN9osgViewer6ViewerE[vtable for osgViewer::Viewer]+0x10c): undefined reference to `non-virtual thunk to osgViewer::View::requestWarpPointer(float, float)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTCN9osgViewer6ViewerE64_NS_4ViewE[vtable for osgViewer::Viewer]+0x8): undefined reference to `typeinfo for osgViewer::View'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTCN9osgViewer6ViewerE64_NS_4ViewE[vtable for osgViewer::Viewer]+0x20): undefined reference to `osgViewer::View::take(osg::View&)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTCN9osgViewer6ViewerE64_NS_4ViewE[vtable for osgViewer::Viewer]+0x24): undefined reference to `osgViewer::View::~View()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTCN9osgViewer6ViewerE64_NS_4ViewE[vtable for osgViewer::Viewer]+0x28): undefined reference to `osgViewer::View::~View()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTCN9osgViewer6ViewerE64_NS_4ViewE[vtable for osgViewer::Viewer]+0x2c): undefined reference to `osgViewer::View::createRenderer(osg::Camera*)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTCN9osgViewer6ViewerE64_NS_4ViewE[vtable for osgViewer::Viewer]+0x34): undefined reference to `osgViewer::View::setStartTick(unsigned long long)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTCN9osgViewer6ViewerE64_NS_4ViewE[vtable for osgViewer::Viewer]+0x38): undefined reference to `osgViewer::View::setSceneData(osg::Node*)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTCN9osgViewer6ViewerE64_NS_4ViewE[vtable for osgViewer::Viewer]+0x3c): undefined reference to `osgViewer::View::requestRedraw()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTCN9osgViewer6ViewerE64_NS_4ViewE[vtable for osgViewer::Viewer]+0x40): undefined reference to `osgViewer::View::requestContinuousUpdate(bool)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTCN9osgViewer6ViewerE64_NS_4ViewE[vtable for osgViewer::Viewer]+0x44): undefined reference to `osgViewer::View::requestWarpPointer(float, float)'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTCN9osgViewer6ViewerE64_NS_4ViewE[vtable for osgViewer::Viewer]+0x74): undefined reference to `typeinfo for osgViewer::View'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTCN9osgViewer6ViewerE64_NS_4ViewE[vtable for osgViewer::Viewer]+0x7c): undefined reference to `virtual thunk to osgViewer::View::~View()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTCN9osgViewer6ViewerE64_NS_4ViewE[vtable for osgViewer::Viewer]+0x80): undefined reference to `virtual thunk to osgViewer::View::~View()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Viewer.cpp.debug.linux.x86.o):(.rodata._ZTIN9osgViewer6ViewerE[typeinfo for osgViewer::Viewer]+0x18): undefined reference to `typeinfo for osgViewer::View'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(StatsHandler.cpp.debug.linux.x86.o): In function `osgViewer::StatsHandler::handle(osgGA::GUIEventAdapter const&, osgGA::GUIActionAdapter&)':
StatsHandler.cpp:(.text+0xa67d): undefined reference to `typeinfo for osgViewer::View'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(ScreenCaptureHandler.cpp.debug.linux.x86.o): In function `osgViewer::ScreenCaptureHandler::handle(osgGA::GUIEventAdapter const&, osgGA::GUIActionAdapter&)':
ScreenCaptureHandler.cpp:(.text+0x87b): undefined reference to `typeinfo for osgViewer::View'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Renderer.cpp.debug.linux.x86.o): In function `osgViewer::Renderer::updateSceneView(osgUtil::SceneView*)':
Renderer.cpp:(.text+0x6dd): undefined reference to `typeinfo for osgViewer::View'
Renderer.cpp:(.text+0x70a): undefined reference to `osgViewer::View::getDatabasePager()'
Renderer.cpp:(.text+0x747): undefined reference to `osgViewer::View::getImagePager()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Renderer.cpp.debug.linux.x86.o): In function `osgViewer::Renderer::cull()':
Renderer.cpp:(.text+0xace): undefined reference to `typeinfo for osgViewer::View'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Renderer.cpp.debug.linux.x86.o): In function `osgViewer::Renderer::Renderer(osg::Camera*)':
Renderer.cpp:(.text+0x3345): undefined reference to `typeinfo for osgViewer::View'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Renderer.cpp.debug.linux.x86.o): In function `osgViewer::Renderer::Renderer(osg::Camera*)':
Renderer.cpp:(.text+0x3a93): undefined reference to `typeinfo for osgViewer::View'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Renderer.cpp.debug.linux.x86.o): In function `osgViewer::Renderer::cull_draw()':
Renderer.cpp:(.text+0x46d9): undefined reference to `typeinfo for osgViewer::View'
Renderer.cpp:(.text+0x470f): undefined reference to `osgViewer::View::getDatabasePager()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(Renderer.cpp.debug.linux.x86.o): In function `osgViewer::Renderer::draw()':
Renderer.cpp:(.text+0x5eda): undefined reference to `typeinfo for osgViewer::View'
Renderer.cpp:(.text+0x5f10): undefined reference to `osgViewer::View::getDatabasePager()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(CompositeViewer.cpp.debug.linux.x86.o): In function `osgViewer::CompositeViewer::setCameraWithFocus(osg::Camera*)':
CompositeViewer.cpp:(.text+0x1863): undefined reference to `osgViewer::View::containsCamera(osg::Camera const*) const'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(CompositeViewer.cpp.debug.linux.x86.o): In function `osgViewer::CompositeViewer::realize()':
CompositeViewer.cpp:(.text+0x3b78): undefined reference to `osgViewer::View::setUpViewAcrossAllScreens()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(CompositeViewer.cpp.debug.linux.x86.o): In function `osgViewer::CompositeViewer::viewerInit()':
CompositeViewer.cpp:(.text+0x4aab): undefined reference to `osgViewer::View::init()'
/home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osg.debug.linux.x86.a(CompositeViewer.cpp.debug.linux.x86.o): In function `osgViewer::CompositeViewer::run()':
CompositeViewer.cpp:(.text+0x4b88): undefined reference to `osgViewer::View::setCameraManipulator(osgGA::MatrixManipulator*)'
collect2: ld returned 1 exit status
Build Error: Failed to link /home/simon/BlitzMax136/mod/axe3d.mod/osg.mod/osgtest.debug
Process complete

EndRem
