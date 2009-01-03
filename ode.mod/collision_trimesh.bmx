
Strict

'Conversion of collision_trimesh.h

Const TRIMESH_FACE_NORMALS=0
Const TRIMESH_LAST_TRANSFORM=1

Extern

Function dGeomTriMeshDataCreate()
Function dGeomTriMeshDataDestroy( tridata )

Function dGeomTriMeshDataSet( tridata,data_id,in_data:Byte Ptr )
Function dGeomTriMeshDataGet:Byte Ptr( tridata,data_id )

Function dGeomTriMeshDataBuildSingle( tridata,Vertices:Byte Ptr,VertexStride,VertexCount,Indices:Byte Ptr,IndexCount,TriStride )
Function dGeomTriMeshDataBuildSingle1( tridata,Vertces:Byte Ptr,VertexStride,VertexCount,Indices:Byte Ptr,IndexCount,TriStride,Normals:Byte Ptr )
Function dGeomTriMeshDataBuildDouble( tridata,Vertices:Byte Ptr,VertexStride,VertexCount,Indices:Byte Ptr,IndexCount,TriStride )
Function dGeomTriMeshDataBuildDouble1( tridata,Vertces:Byte Ptr,VertexStride,VertexCount,Indices:Byte Ptr,IndexCount,TriStride,Normals:Byte Ptr )
Function dGeomTriMeshDataBuildSimple( tridata,Vertices:Byte Ptr,VertexCount,Indices:Byte Ptr,IndexCount )
Function dGeomTriMeshDataBuildSimple1( tridata,Vertices:Byte Ptr,VertexCount,Indices:Byte Ptr,IndexCount,Normals:Byte Ptr )

Function dGeomTriMeshDataPreprocess( tridata )
Function dGeomTriMeshDataGetBuffer( tridata,buf:Byte Ptr Ptr,buflen Var )
Function dGeomTriMeshDataSetBuffer( tridata,buf:Byte Ptr )

Function dGeomTriMeshSetCallback( trimesh,callback:Byte Ptr )
Function dGeomTriMeshGetCallback:Byte Ptr( trimesh )

Function dGeomTriMeshSetArrayCallback( trimesh,callback:Byte Ptr )
Function dGeomTriMeshGetArrayCallback:Byte Ptr( trimesh )

Function dGeomTriMeshSetRayCallback( trimesh,callback:Byte Ptr )
Function dGeomTriMeshGetRayCallback:Byte Ptr( trimesh )

Function dCreateTriMesh( space,tridata,tricallback:Byte Ptr,arraycallback:Byte Ptr,raycallback:Byte Ptr )
Function dGeomTriMeshSetData( trimesh,tridata )
Function dGeomTriMeshGetData( trimesh )

Function dGeomTriMeshEnableTC( trimesh,geomClass,enable )
Function dGeomTriMeshIsTCEnabled( trimesh,geomClass )
Function dGeomTriMeshClearTCCache( trimesh )

Function dGeomTriMeshGetTriMeshDataID( trimesh )
Function dGeomTriMeshGetTriangle( trimesh,Index,v0:Float Ptr,v1:Float Ptr,v2:Float Ptr )
Function dGeomTriMeshGetPoint( trimesh,Index,u#,v#,Out:Float Ptr )

Function dGeomTriMeshGetTriangleCount( trimesh )
Function dGeomTriMeshDataUpdate( g )

End Extern
