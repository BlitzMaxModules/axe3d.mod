
Strict

Rem
bbdoc: Geom
End Rem
Module max3d.geom

ModuleInfo "Version: 1.01"
ModuleInfo "Author: Mark Sibly"
ModuleInfo "License: BSD License"

Import BRL.Math
Import BRL.Data
Import Pub.StdC

'Import "std.bmx"

Global EPSILON#=1.0/(1 Shl 23)
Global INFINITY#=1.0*(1 Shl 23)

Global PLANAR_EPSILON#=.001
Global TRIAREA_EPSILON#=.0001

Global VEC3COMPARE_EPSILON#=EPSILON

Type TBounds

	Method Intersects( bounds:TBounds ) Abstract

	Method IntersectsBox( t:TBox ) Abstract
	Method IntersectsHull( t:THull ) Abstract
	Method IntersectsPoint( t:TVec3 ) Abstract
	Method IntersectsPlane( t:TPlane ) Abstract
	Method IntersectsSphere( T:TSphere ) Abstract
	
End Type

Type TVec3 Extends TBounds

	Field x#,y#,z#
	
	Method Copy:TVec3()
		Return Create( x,y,z )
	End Method
	
	Method Compare( with:Object )
		Local q:TVec3=TVec3( with )
		If x-q.x>VEC3COMPARE_EPSILON Return 1
		If q.x-x>VEC3COMPARE_EPSILON Return -1
		If y-q.y>VEC3COMPARE_EPSILON Return 1
		If q.y-y>VEC3COMPARE_EPSILON Return -1
		If z-q.z>VEC3COMPARE_EPSILON Return 1
		If q.z-z>VEC3COMPARE_EPSILON Return -1
		Return 0
	End Method
	
	Method ToString$()
		Return "("+x+","+y+","+z+")"
	End Method
	
	Method Intersects( bounds:TBounds )
		Return bounds.IntersectsPoint( Self )
	End Method
	
	Method IntersectsBox( t:TBox )
		Return t.IntersectsPoint( Self )
	End Method
	
	Method IntersectsHull( t:THull )
		Return t.IntersectsPoint( Self )
	End Method
	
	Method IntersectsPoint( t:TVec3 )
		Return Compare( t )=0
	End Method
	
	Method IntersectsPlane( t:TPlane )
		Return t.IntersectsPoint( Self )
	End Method
	
	Method IntersectsSphere( t:TSphere )
		Return t.IntersectsPoint( Self )
	End Method
	
	Method IsColinear( v:TVec3 )
		Return Abs(Normalize().Dot(v.Normalize()))=1
	End Method
	
	Method Length#()
		Return Sqr( x*x+y*y+z*z )
	End Method
	
	Method Dot#( v:TVec3 )
		Return x*v.x+y*v.y+z*v.z
	End Method
	
	Method Inverse:TVec3()
		Return Create( -x,-y,-z )
	End Method
	
	Method Reciprocal:TVec3()
		Return Create( 1/x,1/y,1/z )
	End Method
	
	Method Normalize:TVec3()
		Local t#=1/Sqr( x*x+y*y+z*z )
		Return Create( x*t,y*t,z*t )
	End Method
	
	Method Scale:TVec3( scale# )
		Return Create( x*scale,y*scale,z*scale )
	End Method 
	
	Method DistanceTo#( v:TVec3 )
		Local dx#=x-v.x,dy#=y-v.y,dz#=z-v.z
		Return Sqr( dx*dx+dy*dy+dz*dz )
	End Method
	
	Method Plus:TVec3( v:TVec3 )
		Return Create( x+v.x,y+v.y,z+v.z )
	End Method
	
	Method Minus:TVec3( v:TVec3 )
		Return Create( x-v.x,y-v.y,z-v.z )
	End Method
	
	Method Times:TVec3( v:TVec3 )
		Return Create( x*v.x,y*v.y,z*v.z )
	End Method 
	
	Method Cross:TVec3( v:TVec3 )
		Return Create( y*v.z-z*v.y,z*v.x-x*v.z,x*v.y-y*v.x )
	End Method
	
	Method Blend:TVec3( v:TVec3,alpha# )
		Return Create( (v.x-x)*alpha+x,(v.y-y)*alpha+y,(v.z-z)*alpha+z )
	End Method
	
	Function Create:TVec3( x#,y#,z# )
		Local t:TVec3=New TVec3
		t.x=x
		t.y=y
		t.z=z
		Return t
	End Function
	
	Function Zero:TVec3()
		Return New TVec3
	End Function
End Type

Type TPlane Extends TBounds

	Field nx#,ny#,nz#,d#
	
	Method Copy:TPlane()
		Return Create( nx,ny,nz,d )
	End Method
	
	Method ToString$()
		Return "nx="+nx+" ny="+ny+" nz="+nz+" d="+d
	End Method
	
	Method Intersects( bounds:TBounds )
		Return bounds.IntersectsPlane( Self )
	End Method
	
	Method IntersectsBox( t:TBox )
		Throw "TODO"
	End Method
	
	Method IntersectsHull( t:THull )
		Throw "TODO"
	End Method
	
	Method IntersectsPoint( t:TVec3 )
		Return DistanceToPoint(t)=0
	End Method
	
	Method IntersectsPlane( t:TPlane )
		Return nx<>t.nx Or ny<>t.ny Or nz<>t.nz
	End Method
	
	Method IntersectsSphere( t:TSphere )
		Throw "TODO"
	End Method
	
	Method SolveX:TVec3( p:TVec3 )
		Return Vec3( (p.y*ny+p.z*nz+d)/-nx,p.y,p.z )
	End Method
	
	Method SolveY:TVec3( p:TVec3 )
		Return Vec3( p.x,(p.x*nx+p.z*nz+d)/-ny,p.z )
	End Method
	
	Method SolveZ:TVec3( p:TVec3 )
		Return Vec3( p.x,p.y,(p.x*nx+p.y*ny+d)/-nz )
	End Method
	
	Method Inverse:TPlane()
		Return Create( -nx,-ny,-nz,-d )
	End Method
	
	Method Normal:TVec3()
		Return Vec3(nx,ny,nz)
	End Method
	
	Method Normalize:TPlane()
		Local i#=1/Sqr(nx*nx+ny*ny+nz*nz)
		Return Create( nx*i,ny*i,nz*i,d*i )
	End Method
	
	Method DistanceToPoint#( p:TVec3 )
		Return nx*p.x+ny*p.y+nz*p.z+d
	End Method
	
	Function Create:TPlane( nx#,ny#,nz#,d# )
		Local t:TPlane=New TPlane
		t.nx=nx
		t.ny=ny
		t.nz=nz
		t.d=d
		Return t
	End Function
	
	Function FromPointNormal:TPlane( p:TVec3,n:TVec3 )
		Return Create( n.x,n.y,n.z,-p.Dot(n) )
	End Function
	
	Function FromTriangle:TPlane( v0:TVec3,v1:TVec3,v2:TVec3 )
		Local va:TVec3=v2.Minus(v1)
		Local vb:TVec3=v0.Minus(v1)
		Assert Not va.IsColinear(vb)
		Return FromPointNormal( v1,va.Cross(vb).Normalize() )
	End Function
	
End Type

Type TBox Extends TBounds

	Field ix#,iy#,iz#
	Field jx#,jy#,jz#
	
	Method Copy:TBox()
		Return Box( ix,iy,iz,jx,jy,jz )
	End Method
	
	Method ToString$()
		Return "ix="+ix+", iy="+iy+", iz="+iz+", jx="+jx+", jy="+jy+", jz="+jz
	End Method
	
	Method Intersects( bounds:TBounds )
		Return bounds.IntersectsBox( Self )
	End Method
	
	Method IntersectsBox( t:TBox )
		Return ix<=t.jx And jx>=t.ix And iy<=t.jy And jy>=t.iy And iz<=t.jz And iz>=t.iz
	End Method
	
	Method IntersectsHull( t:THull )
		Throw "TODO"
	End Method
	
	Method IntersectsPoint( t:TVec3 )
		Return t.x>=ix And t.x<=jx And t.y>=iy And t.y<=jy And t.z>=iz And t.z<=jz
	End Method
	
	Method IntersectsPlane( t:TPlane )
		Throw "TODO"
	End Method
	
	Method IntersectsSphere( t:TSphere )
		Throw "TODO"
	End Method
	
	Method AddPoint( v:TVec3 )
		If v.x<ix ix=v.x
		If v.x>jx jx=v.x
		If v.y<iy iy=v.y
		If v.y>jy jy=v.y
		If v.z<iz iz=v.z
		If v.z>jz jz=v.z
	End Method
	
	Method AddBox( b:TBox )
		If b.ix<ix ix=b.ix
		If b.jx>jx jx=b.jx
		If b.iy<iy iy=b.iy
		If b.jy>jy jy=b.jy
		If b.iz<iz iz=b.iz
		If b.iz>jz jz=b.jz
	End Method
	
	Method ToSphere:TSphere()
		Return TSphere.FromBox( Self )
	End Method
	
	Method Centre:TVec3()
		Return Vec3( (ix+jx)/2,(iy+jy)/2,(iz+jz)/2 )
	End Method
	
	Method Width#()
		Return jx-ix
	End Method
	
	Method Height#()
		Return jy-iy
	End Method
	
	Method Depth#()
		Return jz-iz
	End Method
	
	Method Volume#()
		Local w#=jx-ix,h#=jy-iy,d#=jz-iz
		Local t=Abs( w*h*d )
		If w<0 Or h<0 Or d<0 Return -t
		Return t
	End Method
	
	Method Extent#()
		Local dx#=jx-ix,dy#=jy-iy,dz#=jz-iz
		Return Sqr( dx*dx+dy*dy+dz*dz )
	End Method
	
	Method ContainsPoint( p:TVec3 )
		Return p.x>=ix And p.x<=jx And p.y>=iy And p.y<=jy And p.z>=iz And p.z<=jz
	End Method
	
	Function Create:TBox( ix#,iy#,iz#,jx#,jy#,jz# )
		Local t:TBox=New TBox
		t.ix=ix
		t.iy=iy
		t.iz=iz
		t.jx=jx
		t.jy=jy
		t.jz=jz
		Return t
	End Function
	
	Function Empty:TBox()
		Return Create( INFINITY,INFINITY,INFINITY,-INFINITY,-INFINITY,-INFINITY )
	End Function
	
	Function FromPoint:TBox( v:TVec3 )
		Return Create( v.x,v.y,v.z,v.x,v.y,v.z )
	End Function
	
	Function FromSphere:TBox( sphere:TSphere )
		Local x#=sphere.x,y#=sphere.y,z#=sphere.z,r#=sphere.r
		Return Create( x-r,y-r,z-r,x+r,y+r,z+r )
	End Function
	
End Type

Type TSphere Extends TBounds

	Field x#,y#,z#,r#
	
	Method Copy:TSphere()
		Return Sphere( x,y,z,r )
	End Method
	
	Method ToString$()
		Return "x="+x+", y="+y+", z="+z+", r="+r
	End Method
	
	Method Intersects( bounds:TBounds )
		Return bounds.IntersectsSphere( Self )
	End Method
	
	Method IntersectsBox( t:TBox )
		Throw "TODO"
	End Method
	
	Method IntersectsHull( t:THull )
		Throw "TODO"
	End Method
	
	Method IntersectsPoint( t:TVec3 )
		Local dx#=x-t.x,dy#=y-t.y,dz#=z-t.z
		Return dx*dx+dy*dy+dz*dz<=r*r
	End Method
	
	Method IntersectsPlane( t:TPlane )
		Throw "TODO"
	End Method
	
	Method IntersectsSphere( t:TSphere )
		Local dx#=x-t.x,dy#=y-t.y,dz#=z-t.z,d#=r+t.r
		Return (dx*dx+dy*dy+dz*dz)<=(d*d)
	End Method
	
	Method ToBox:TBox()
		Return TBox.FromSphere( Self )
	End Method
	
	Method Centre:TVec3()
		Return Vec3(x,y,z)
	End Method
	
	Method Radius#()
		Return r
	End Method
	
	Method DistanceTo#( t:TSphere )
		Local dx#=x-t.x,dy#=y-t.y,dz#=z-t.z
		Return Sqr( dx*dx+dy*dy+dz*dz )-r-t.r
	End Method
	
	Function FromBox:TSphere( box:TBox )
		Local c:TVec3=box.Centre()
		Return Sphere( c.x,c.y,c.z,box.Extent()/2 )
	End Function
	
End Type

Type THull Extends TBounds

	Field planes:TPlane[]
	
	Method Copy:THull()
		Return Hull( planes )
	End Method

	Method Intersects( bounds:TBounds )
		Return bounds.IntersectsHull( Self )
	End Method
	
	Method IntersectsBox( t:TBox )
		Throw "TODO"
	End Method
	
	Method IntersectsHull( t:THull )
		Throw "TODO"
	End Method
	
	Method IntersectsPoint( t:TVec3 )
		For Local q:TPlane=EachIn planes
			If q.DistanceToPoint(t)>0 Return False
		Next
		Return True
	End Method
	
	Method IntersectsPlane( t:TPlane )
		Throw "TODO"
	End Method
	
	Method IntersectsSphere( t:TSphere )
		Local c:TVec3=t.Centre()
		For Local i=0 Until planes.length
			Local d#=planes[i].DistanceToPoint( c )
			If d>t.r Return False
		Next
		Return True
	End Method
	
	Function WithPlanes:THull( planes:TPlane[] )
		Local t:THull=New THull
		t.planes=planes
		Return t
	End Function
		
	Function FromBox:THull( box:TBox )
		Local t:THull=New THull
		t.planes=New TPlane[6]
		t.planes[0]=TPlane.Create( -1, 0, 0,-box.ix )
		t.planes[1]=TPlane.Create( +1, 0, 0,-box.jx )
		t.Planes[2]=TPlane.Create(  0,-1, 0,-box.iy )
		t.Planes[3]=TPlane.Create(  0,+1, 0,-box.jy )
		t.Planes[4]=TPlane.Create(  0, 0,-1,-box.iz )
		t.Planes[5]=TPlane.Create(  0, 0,+1,-box.jz )
		Return t
	End Function
	
End Type

Type TQuat

	Field x#,y#,z#,w#
	
	Method Copy:TQuat()
		Return Quat(x,y,z,w)
	End Method
	
	Method ToString$()
		Return "("+x+","+y+","+z+","+w+")"
	End Method
	
	Method Slerp:TQuat( q:TQuat,a# )
		Local b#=1-a,f
		Local d#=x*q.x+y*q.y+z*q.z+w*q.w
		If d<0
			d=-d
			f=True
		EndIf
		If d<1
			Local om#=acos_( d )
			Local si#=sin_( om )
			a=sin_( a*om )/si
			b=sin_( b*om )/si
		EndIf
		If f a=-a
		Return Quat( x*b + q.x*a , y*b + q.y*a , z*b + q.z*a , w*b + q.w*a )
	End Method
	
	Method ToAngleAxis( angle# Var,axis:TVec3 Var )
		Local t#=ACos(w)
		angle=t*2
		If angle>EPSILON
			t=1/Sin(t)
			axis=Vec3( x*t,y*t,z*t )
		Else
			axis=Vec3(0,0,0)
		EndIf
	End Method
	
	Function FromAngleAxis:TQuat( angle#,axis:TVec3 )
		angle:/2
		Local s#=Sin(angle)
		Local t:TQuat=New TQuat
		t.x=s*axis.x
		t.y=s*axis.y
		t.z=s*axis.z
		t.w=Cos(angle)
		Return t
	End Function

End Type

Type TMat4

	Field ix#,iy#,iz#,iw#
	Field jx#,jy#,jz#,jw#
	Field kx#,ky#,kz#,kw#
	Field tx#,ty#,tz#,tw#
	
	Method ToString$()
		Local t$
		t=t+(ix+","+iy+","+iz+","+iw)+"~n"
		t=t+(jx+","+jy+","+jz+","+jw)+"~n"
		t=t+(kx+","+ky+","+kz+","+kw)+"~n"
		t=t+(tx+","+ty+","+tz+","+tw)+"~n"
		Return t
	End Method
	
	Method Copy:TMat4()
		Local t:TMat4=New TMat4
		MemCopy t,Self,SizeOf Self
		Return t
	End Method
	
	Method Translation:TVec3()
		Return Vec3(tx,ty,tz)
	End Method
	
	Method Rotation:TQuat()
		Local sc:TVec3=Scale()
		Local iv:TVec3=Vec3(ix,iy,iz).Scale(1/sc.x)
		Local jv:TVec3=Vec3(jx,jy,jz).Scale(1/sc.y)
		Local kv:TVec3=Vec3(kx,ky,kz).Scale(1/sc.z)
		Local x#,y#,z#,w#
		Local t#=iv.x+jv.y+kv.z+1
		If t>0
			t=Sqr(t)*2
			x=(kv.y-jv.z)/t
			y=(iv.z-kv.x)/t
			z=(jv.x-iv.y)/t
			w=t/4
		Else If iv.x>jv.y And iv.x>kv.z
'			dprint "here2"
			t=Sqr(iv.x-jv.y-kv.z+1)*2
			x=t/4
			y=(jv.x+iv.y)/t
			z=(iv.z+kv.x)/t
			w=(kv.y-jv.z)/t
		Else If jv.y>kv.z
'			dprint "here3"
			t=Sqr(jv.y-kv.z-iv.x+1)*2
			x=(jv.x+iv.y)/t
			y=t/4
			z=(kv.y+jv.z)/t
			w=(iv.z-kv.x)/t
		Else
'			dprint "here4"
			t=Sqr(kv.z-jv.y-iv.x+1)*2
			x=(iv.z+kv.x)/t
			y=(kv.y+jv.z)/t
			z=t/4
			w=(jv.x-iv.y)/t
		EndIf
		Return Quat( x,y,z,w )
	End Method
	
	Method Scale:TVec3()
		Return Vec3( Vec3(ix,iy,iz).Length(),Vec3(jx,jy,jz).Length(),Vec3(kx,ky,kz).Length() )
	End Method
	
	Method Times:TMat4( m:TMat4 )
		Local t:TMat4=New TMat4
		t.ix= ix*m.ix + jx*m.iy + kx*m.iz + tx*m.iw
		t.iy= iy*m.ix + jy*m.iy + ky*m.iz + ty*m.iw
		t.iz= iz*m.ix + jz*m.iy + kz*m.iz + tz*m.iw
		t.iw= iw*m.ix + jw*m.iy + kw*m.iz + tw*m.iw
		t.jx= ix*m.jx + jx*m.jy + kx*m.jz + tx*m.jw
		t.jy= iy*m.jx + jy*m.jy + ky*m.jz + ty*m.jw
		t.jz= iz*m.jx + jz*m.jy + kz*m.jz + tz*m.jw
		t.jw= iw*m.jx + jw*m.jy + kw*m.jz + tw*m.jw
		t.kx= ix*m.kx + jx*m.ky + kx*m.kz + tx*m.kw
		t.ky= iy*m.kx + jy*m.ky + ky*m.kz + ty*m.kw
		t.kz= iz*m.kx + jz*m.ky + kz*m.kz + tz*m.kw
		t.kw= iw*m.kx + jw*m.ky + kw*m.kz + tw*m.kw
		t.tx= ix*m.tx + jx*m.ty + kx*m.tz + tx*m.tw
		t.ty= iy*m.tx + jy*m.ty + ky*m.tz + ty*m.tw
		t.tz= iz*m.tx + jz*m.ty + kz*m.tz + tz*m.tw
		t.tw= iw*m.tx + jw*m.ty + kw*m.tz + tw*m.tw
		Return t
	End Method
	
	Method TimesPoint:TVec3( v:TVec3 )
		Return Vec3(..
			ix*v.x + jx*v.y + kx*v.z + tx,..
			iy*v.x + jy*v.y + ky*v.z + ty,..
			iz*v.x + jz*v.y + kz*v.z + tz)
	End Method
	
	Method TimesVector:TVec3( v:TVec3 )
		Return Vec3(..
			ix*v.x + jx*v.y + kx*v.z,..
			iy*v.x + jy*v.y + ky*v.z,..
			iz*v.x + jz*v.y + kz*v.z)
	End Method
	
	Method TimesPlane:TPlane( p:TPlane )
		Local m:TMat4=Inverse()
		Local t:TPlane=New TPlane
		t.nx=m.ix*p.nx + m.iy*p.ny + m.iz*p.nz + m.iw*p.d
		t.ny=m.jx*p.nx + m.jy*p.ny + m.jz*p.nz + m.jw*p.d
		t.nz=m.kx*p.nx + m.ky*p.ny + m.kz*p.nz + m.kw*p.d
		t.d =m.tx*p.nx + m.ty*p.ny + m.tz*p.nz + m.tw*p.d
		Return t.Normalize()
	End Method
	
	Method TimesBox:TBox( box:TBox )
		Local ix#=box.ix
		Local iy#=box.iy
		Local iz#=box.iz
		Local jx#=box.jx
		Local jy#=box.jy
		Local jz#=box.jz
		Local t:TBox=TBox.FromPoint( TimesPoint(Vec3(ix,iy,iz)) )
		t.AddPoint TimesPoint(Vec3(jx,iy,iz))
		t.AddPoint TimesPoint(Vec3(ix,jy,iz))
		t.AddPoint TimesPoint(Vec3(jx,jy,iz))
		t.AddPoint TimesPoint(Vec3(ix,iy,jz))
		t.AddPoint TimesPoint(Vec3(jx,iy,jz))
		t.AddPoint TimesPoint(Vec3(ix,jy,jz))
		t.AddPoint TimesPoint(Vec3(jx,jy,jz))
		Return t
	End Method
	
	Method TimesSphere:TSphere( sph:TSphere )
		Local sc:TVec3=Scale()
		Local sf#=Max(sc.x,Max(sc.y,sc.z))
		Local v:TVec3=TimesPoint( sph.Centre() )
		Return Sphere( v.x,v.y,v.z,sph.r*sf )
	End Method
	
	Method TimesHull:THull( hull:THull )
		Local planes:TPlane[hull.planes.length]
		For Local i=0 Until hull.planes.length
			planes[i]=TimesPlane( hull.planes[i] )
		Next
		Return THull.WithPlanes( planes )
	End Method
	
	Method Determinant#()
		Assert Abs(iw)<=.001 And Abs(jw)<=.001 And Abs(kw<=.001) And tw>=1-.001
		Return ix*(jy*kz-jz*ky) - iy*(jx*kz-jz*kx) + iz*(jx*ky-jy*kx)
	End Method
	
	Method I:TVec3()
		Return Vec3(ix,iy,iz)
	End Method
	
	Method J:TVec3()
		Return Vec3(jx,jy,jz)
	End Method
		
	Method k:TVec3()
		Return Vec3(kx,ky,kz)
	End Method
		
	Method Cofactor:TMat4()
		Local t:TMat4=New TMat4
		t.ix= (jy*kz-jz*ky)
		t.iy=-(jx*kz-jz*kx)
		t.iz= (jx*ky-jy*kx)
		t.jx=-(iy*kz-iz*ky)
		t.jy= (ix*kz-iz*kx)
		t.jz=-(ix*ky-iy*kx)
		t.kx= (iy*jz-iz*jy)
		t.ky=-(ix*jz-iz*jx)
		t.kz= (ix*jy-iy*jx)
		Return t
	End Method
	
	Method Inverse:TMat4()
		Local c#=1/Determinant()
		Local t:TMat4=New TMat4
		t.ix= c * ( jy*kz - jz*ky )
		t.iy=-c * ( iy*kz - iz*ky )
		t.iz= c * ( iy*jz - iz*jy )
		t.jx=-c * ( jx*kz - jz*kx )
		t.jy= c * ( ix*kz - iz*kx )
		t.jz=-c * ( ix*jz - iz*jx )
		t.kx= c * ( jx*ky - jy*kx )
		t.ky=-c * ( ix*ky - iy*kx )
		t.kz= c * ( ix*jy - iy*jx )
		t.tx=-( tx*t.ix + ty*t.jx + tz*t.kx )
		t.ty=-( tx*t.iy + ty*t.jy + tz*t.ky )
		t.tz=-( tx*t.iz + ty*t.jz + tz*t.kz )
		t.tw=1
		Return t
	End Method
	
	Method Transpose:TMat4()
		Local t:TMat4=New TMat4
		t.ix=ix
		t.iy=jx
		t.iz=kx
		t.iw=tx
		t.jx=iy
		t.jy=jy
		t.jz=ky
		t.jw=ty
		t.kx=iz
		t.ky=jz
		t.kz=kz
		t.kw=tz
		t.tx=iw
		t.ty=jw
		t.tz=kw
		t.tw=tw
		Return t
	End Method
	
	Function FromDirection:TMat4( dir:TVec3,up:TVec3=Null )
		If Not up up=Vec3(0,1,0)
		Local j:TVec3=up.Normalize()
		Local k:TVec3=dir.Normalize()
		Local i:TVec3=j.Cross(k).Normalize()
		j=k.Cross(i).Normalize()
		Local t:TMat4=New TMat4
		t.ix=i.x
		t.iy=i.y
		t.iz=i.z
		t.jx=j.x
		t.jy=j.y
		t.jz=j.z
		t.kx=k.x
		t.ky=k.y
		t.kz=k.z
		t.tw=1
		Return t
	End Function
	
	Function FromTranslation:TMat4( v:TVec3 )
		Local t:TMat4=New TMat4
		t.ix=1
		t.jy=1
		t.kz=1
		t.tx=v.x
		t.ty=v.y
		t.tz=v.z
		t.tw=1
		Return t
	End Function
	
	Function FromRotation:TMat4( q:TQuat )
		Local t:TMat4=New TMat4
		Local xx#=q.x*q.x,yy#=q.y*q.y,zz#=q.z*q.z
		Local xy#=q.x*q.y,xz#=q.x*q.z,yz#=q.y*q.z
		Local wx#=q.w*q.x,wy#=q.w*q.y,wz#=q.w*q.z
		t.ix=1-2*(yy+zz)
		t.iy=  2*(xy-wz)
		t.iz=  2*(xz+wy)
		t.jx=  2*(xy+wz)
		t.jy=1-2*(xx+zz)
		t.jz=  2*(yz-wx)
		t.kx=  2*(xz-wy)
		t.ky=  2*(yz+wx)
		t.kz=1-2*(xx+yy)
		t.tw=1
		Return t
	End Function
	
	Function FromScale:TMat4( v:TVec3 )
		Local t:TMat4=New TMat4
		t.ix=v.x
		t.jy=v.y
		t.kz=v.z
		t.tw=1
		Return t
	End Function
	
	Function FromTransRotScale:TMat4( trans:TVec3,rot:TQuat,scale:TVec3 )
		Local t:TMat4
		If trans
			t=FromTranslation(trans)
			If rot t=t.Times(FromRotation(rot))
			If scale t=t.Times(FromScale(scale))
		Else If rot
			t=FromRotation(rot)
			If scale t=t.Times(FromScale(scale))
		Else If scale
			t=FromScale(scale)
		Else
			t=Identity()
		EndIf
		Return t
	End Function
	
	Function FromYaw:TMat4( yaw# )	'untested!
		Local t:TMat4=New TMat4
		Local s#=Sin(yaw),c#=Cos(yaw)
		t.ix=c
		t.iz=s
		t.jy=1
		t.kx=-s
		t.kz=c
		t.tw=1
		Return t
	End Function
	
	Function FromPitch:TMat4( pitch# )	'untested!
		Local t:TMat4=New TMat4
		Local s#=Sin(pitch),c#=Cos(pitch)
		t.ix=1
		t.jy=c
		t.jz=s
		t.ky=-s
		t.kz=c
		t.tw=1
		Return t
	End Function
	
	Function FromRoll:TMat4( roll# )	'untested!
		Local t:TMat4=New TMat4
		Local s#=Sin(roll),c#=Cos(roll)
		t.ix=c
		t.iy=s
		t.jx=-s
		t.jy=c
		t.kz=1
		t.tw=1
		Return t
	End Function
	
	Function FromYawPitchRoll:TMat4( yaw#,pitch#,roll# )
		Local t:TMat4
		If yaw
			t=FromYaw(yaw)
			If pitch t=t.Times(FromPitch(pitch))
			If roll t=t.Times(FromRoll(roll))
		Else If pitch
			t=FromPitch(pitch)
			If roll t=t.Times(FromRoll(roll))
		Else If roll
			t=FromRoll(roll)
		Else
			t=Identity()
		EndIf
		Return t
	End Function
	
	Function FromFrustum:TMat4( near_left#,near_right#,near_bottom#,near_top#,near#,far# )
		Local t:TMat4=New TMat4
		Local near2#=near*2
		Local w#=near_right-near_left
		Local h#=near_top-near_bottom
		Local d#=far-near
		t.ix=near2/w
		t.jy=near2/h
		t.kx=(near_right+near_left)/w
		t.ky=(near_top+near_bottom)/h
		t.kz=-(far+near)/d
		t.kw=-1
		t.tz=-(far*near2)/d
		Return t
	End Function
	
	Function FromInfiniteFrustum:TMat4( near_left#,near_right#,near_bottom#,near_top#,near# )
		Local t:TMat4=New TMat4
		Local near2#=near*2
		Local w#=near_right-near_left
		Local h#=near_top-near_bottom
		Local e#=.001
		t.ix=near2/w
		t.jy=near2/w
		t.kx=(near_right+near_left)/w
		t.ky=(near_top+near_bottom)/h
		t.kz=1-e
		t.tz=near*(e-1)
		t.kw=1
		Return t
	End Function
	
	Function Identity:TMat4()
		Local t:TMat4=New TMat4
		t.ix=1
		t.jy=1
		t.kz=1
		t.tw=1
		Return t
	End Function
	
End Type

Function Vec3:TVec3( x#,y#,z# )
	Local t:TVec3=New TVec3
	t.x=x
	t.y=y
	t.z=z
	Return t
End Function

Function Plane:TPlane( nx#,ny#,nz#,d# )
	Local t:TPlane=New TPlane
	t.nx=nx
	t.ny=ny
	t.nz=nz
	t.d=d
	Return t
End Function

Function Box:TBox( ix#,iy#,iz#,jx#,jy#,jz# )
	Local t:TBox=New TBox
	t.ix=ix
	t.iy=iy
	t.iz=iz
	t.jx=jx
	t.jy=jy
	t.jz=jz
	Return t
End Function

Function Sphere:TSphere( x#,y#,z#,r# )
	Local t:TSphere=New TSphere
	t.x=x
	t.y=y
	t.z=z
	t.r=r
	Return t
End Function

Function Hull:THull( planes:TPlane[] )
	Local t:THull=New THull
	t.planes=New TPlane[planes.length]
	For Local i=0 Until planes.length
		t.planes[i]=planes[i].Copy()
	Next
	Return t
End Function

Function Quat:TQuat( x#,y#,z#,w# )
	Local t:TQuat=New TQuat
	t.x=x
	t.y=y
	t.z=z
	t.w=w
	Return t
End Function
