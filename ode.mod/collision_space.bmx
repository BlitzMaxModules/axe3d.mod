
Strict

'Conversion of collision_space.h

Extern

Function dSimpleSpaceCreate( space )
Function dHashSpaceCreate( space )
Function dQuadTreeSpaceCreate( space,centre:Float Ptr,Extent:Float Ptr,depth )

Function dSpaceDestroy( space )

Function dHashSpaceSetLevels( space,minlevel,maxlevel )
Function dHashSpaceGetLevels( space,minlevel Var,maxlevel Var )

Function dSpaceSetCleanup( space,mode )
Function dSpaceGetCleanup( space )

Function dSpaceAdd( space,geom )
Function dSpaceRemove( space,geom )
Function dSpaceQuery( space,geom )
Function dSpaceClean( space )
Function dSpaceGetNumGeoms( space )
Function dSpaceGetGeom( space,index )

End Extern

