Strict

Import brl.linkedlist
Import "texture.bmx"

Type TBrush
	Method Copy:TBrush() Abstract
	Method FreeBrush() Abstract
	Method BrushColor(r#,g#,b#) Abstract
	Method BrushAlpha(a#) Abstract
	Method BrushShininess(s#) Abstract
	Method BrushTexture(texture:TTexture,frame=0,index=0) Abstract
	Method BrushBlend(blend_no) Abstract
	Method BrushFX(fx_no) Abstract
	Method GetBrushTexture:TTexture(index=0) Abstract
End Type

