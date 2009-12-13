Strict

Import brl.linkedlist
Import brl.pixmap

Import "graphicsbuffer.bmx"

Type TTexture
	Method FreeTexture() Abstract
	Method TextureBlend(blend_no) Abstract
	Method TextureCoords(coords_no) Abstract
	Method ScaleTexture(u_s#,v_s#) Abstract
	Method PositionTexture(u_p#,v_p#) Abstract
	Method RotateTexture(ang#) Abstract
	Method TextureWidth() Abstract
	Method TextureHeight() Abstract
	Method TextureName$() Abstract
	Method SetCubeFace(face) Abstract
	Method SetCubeMode(mode) Abstract
	Method TextureBuffer:TBuffer(frame) Abstract
End Type
