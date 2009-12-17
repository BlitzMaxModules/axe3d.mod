Strict

Import "brush.bmx"

Type TSurface
	Method GetSurfaceBrush:TBrush() Abstract
	Method PaintSurface(brush:TBrush) Abstract
	Method ClearSurface(clear_verts=True,clear_tris=True) Abstract
	Method AddVertex(x#,y#,z#,u#=0.0,v#=0.0,w#=1.0) Abstract
	Method AddTriangle(v0,v1,v2) Abstract
	Method CountVertices() Abstract
	Method CountTriangles() Abstract
	Method VertexCoords(v,x#,y#,z#) Abstract
	Method VertexColor(v,r#,g#,b#,a#=1.0) Abstract
	Method VertexNormal(v,nx#,ny#,nz#) Abstract
	Method VertexTexCoords(vid,u#,v#,w#=0.0,coord_set=0) Abstract
	Method VertexX#(v) Abstract
	Method VertexY#(v) Abstract
	Method VertexZ#(v) Abstract
	Method VertexRed#(v) Abstract
	Method VertexGreen#(v) Abstract
	Method VertexBlue#(v) Abstract
	Method VertexAlpha#(v) Abstract
	Method VertexNX#(v) Abstract
	Method VertexNY#(v) Abstract
	Method VertexNZ#(v) Abstract
	Method VertexU#(v,coord_set=0) Abstract
	Method VertexV#(v,coord_set=0) Abstract
	Method VertexW#(v,coord_set=0) Abstract
	Method TriangleVertex(tri_no,corner) Abstract
	Method UpdateNormals() Abstract
	
End Type
