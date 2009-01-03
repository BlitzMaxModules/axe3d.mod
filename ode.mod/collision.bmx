
Strict

'Conversion of collision.h

Const dSphereClass=0
Const dBoxClass=1
Const dCapsuleClass=2
Const dCylinderClass=3
Const dPlaneClass=4
Const dRayClass=5
Const dConvexClass=6
Const dGeomTransformClass=7
Const dTriMeshClass=8
Const dSimpleSpaceClass=9
Const dHashSpaceClass=10
Const dQuadTreeSpaceClass=11

Extern

Function dGeomDestroy( geom )
Function dGeomSetData( geom,data:Byte Ptr )
Function dGeomGetData:Byte Ptr( geom )
Function dGeomSetBody( geom,body )
Function dGeomGetBody( geom )
Function dGeomSetPosition( geom,x#,y#,z# )
Function dGeomSetRotation( geom,R:Float Ptr )
Function dGeomSetQuaternion( geom,Q:Float Ptr )
Function dGeomGetPosition:Float Ptr( geom )
Function dGeomGetRotation:Float Ptr( geom )
Function dGeomGetQuaternion( geom,result:Float Ptr )
Function dGeomGetAABB( geom,aabb:Float Ptr )
Function dGeomIsSpace( geom )
Function dGeomGetSpace( geom )
Function dGeomGetClass( geom )
Function dGeomSetCategoryBits( geom,bits )
Function dGeomSetCollideBits( geom,bits )
Function dGeomGetCategoryBits( geom )
Function dGeomGetCollideBits( geom )
Function dGeomEnable( geom )
Function dGeomDisable( geom )
Function dGeomIsEnabled( geom )

Function dGeomSetOffsetPosition( geom,x#,y#,z# )
Function dGeomSetOffsetRotation( geom,R:Float Ptr )
Function dGeomSetOffsetQuaternion( geom,Q:Float Ptr )
Function dGeomSetOffsetWorldPosition( geom,x#,y#,z# )
Function dGeomSetOffsetWorldRotation( geom,R:Float Ptr )
Function dGeomSetOffsetWorldQuaternion( geom,Q:Float Ptr )
Function dGeomClearOffset( geom )
Function dGeomIsOffset( geom )
Function dGeomGetOffsetPosition:Float Ptr( geom )
Function dGeomGetOffsetRotation:Float Ptr( geom )
Function dGeomGetOffsetQuaternion( geom,result:Float Ptr )

'Function dCollide( o1,o2,flags,contact:Byte Ptr,skip )
Function dSpaceCollide( space,data:Byte Ptr,callback( data:Byte Ptr,o1,o2 ) )
Function dSpaceCollide2( o1,o2,data:Byte Ptr,callback( data:Byte Ptr,o1,o2 ) )

Function dCreateSphere( space,radius# )
Function dGeomSphereSetRadius( sphere,radius# )
Function dGeomSphereGetRadius#( sphere )
Function dGeomSpherePointDepth#( sphere,x#,y#,z# )

Function dCreateConvex( space,_planes:Float Ptr,_planecount,_points:Float Ptr,_pointcount,_polygons:Int Ptr )
Function dGeomSetConvex( g,_planes:Float Ptr,_planecount,_points:Float Ptr,_pointcount,_polygons:Int Ptr )

Function dCreateBox( space,lx#,ly#,lz# )
Function dGeomBoxSetLengths( box,lx#,ly#,lz# )
Function dGeomBoxGetLengths( box,result:Float Ptr )
Function dGeomBoxPointDepth#( box,x#,y#,z# )

Function dCreatePlane( space,a#,b#,c#,d# )
Function dGeomPlaneSetParams( plane,a#,b#,c#,d# )
Function dGeomPlaneGetParams( plane,result:Float Ptr )
Function dGeomPlanePointDepth#( plane,x#,y#,z# )

Function dCreateCapsule( space,radius#,length# )
Function dGeomCapsuleSetParams( capsule,radius#,length# )
Function dGeomCapsuleGetParams( capsule,radius# Var,length# Var )
Function dGeomCapsulePointDepth#( capsule,x#,y#,z# )

Function dCreateCylinder( space,radius#,length# )
Function dGeomCylinderSetParams( cylinder,radius#,length# )
Function dGeomCylinderGetParams( cylinder,radius# Var,length# Var )

Function dCreateRay( space,length# )
Function dGeomRaySetLength( ray,length# )
Function dGeomRayGetLength#( ray )
Function dGeomRaySet( ray,px#,py#,pz#,dx#,dy#,dz# )
Function dGeomRayGet( ray,start:Float Ptr,dir:Float Ptr )

Function dGeomRaySetParams( ray,FirstContact,BackfaceCull )
Function dGeomRayGetParams( ray,FirstContact Var,BackfaceCull Var )
Function dGeomRaySetClosestHit( ray,closestHit )
Function dGeomRayGetClosestHit( ray )

Function dCreateGeomTransform( space )
Function dGeomTransformSetGeom( g,obj )
Function dGeomTransformGetGeom( g )
Function dGeomTransformSetCleanup( g,mode )
Function dGeomTransformGetCleanup( g )
Function dGeomTransformSetInfo( g,mode )
Function dGeomTransformGetInfo( g )

End Extern
