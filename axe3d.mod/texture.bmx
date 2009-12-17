Strict

Import brl.linkedlist
Import brl.pixmap

Type TTextureLock
	Method Lock() Abstract
	Method Unlock() Abstract
	Method SetRGBA(x,y,rgba) Abstract
	Method GetRGBA(x,y) Abstract
End Type

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
	Method TextureBuffer:TTextureLock(frame=0) Abstract
End Type
