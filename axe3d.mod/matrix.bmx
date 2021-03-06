Strict

Import brl.math

Type TMatrix

	Global identity:TMatrix=New TMatrix.LoadIdentity()

	Field grid#[4,4]

	Method New()
		LoadIdentity
	End Method

	Method Transform(x# Var,y# Var,z# Var)
		Local xx# = grid#[0,0]*x + grid#[0,1]*y + grid#[0,2]*z+ grid#[3,0]
		Local yy# = grid#[1,0]*x + grid#[1,1]*y + grid#[1,2]*z+ grid#[3,1]
		Local zz# = grid#[2,0]*x + grid#[2,1]*y + grid#[2,2]*z + grid#[3,2]
		x=xx
		y=yy
		z=zz
	End Method
	
	Method TransformVector(x# Var,y# Var,z# Var)
		Local xx# = grid#[0,0]*x + grid#[0,1]*y + grid#[0,2]*z
		Local yy# = grid#[1,0]*x + grid#[1,1]*y + grid#[1,2]*z
		Local zz# = grid#[2,0]*x + grid#[2,1]*y + grid#[2,2]*z
		x=xx
		y=yy
		z=zz
	End Method

	Method LoadIdentity:TMatrix()	
		grid[0,0]=1.0
		grid[1,0]=0.0
		grid[2,0]=0.0
		grid[3,0]=0.0
		grid[0,1]=0.0
		grid[1,1]=1.0
		grid[2,1]=0.0
		grid[3,1]=0.0
		grid[0,2]=0.0
		grid[1,2]=0.0
		grid[2,2]=1.0
		grid[3,2]=0.0		
		grid[0,3]=0.0
		grid[1,3]=0.0
		grid[2,3]=0.0
		grid[3,3]=1.0
		Return Self	
	End Method
	
	' copy - create new copy and returns it
	
	Method Copy:TMatrix()		
		Local mat:TMatrix=New TMatrix		
		mat.Overwrite Self
		Return mat
	End Method
	
	' overwrite - overwrites self with matrix passed as parameter
	
	Method Overwrite(mat:TMatrix)
		For Local i=0 Until 4
			For Local j=0 Until 4
				grid[i,j]=mat.grid[i,j]
			Next
		Next
	End Method


	Method Multiply(mat:TMatrix)

		Local m00# = grid#[0,0]*mat.grid#[0,0] + grid#[1,0]*mat.grid#[0,1] + grid#[2,0]*mat.grid#[0,2] + grid#[3,0]*mat.grid#[0,3]
		Local m01# = grid#[0,1]*mat.grid#[0,0] + grid#[1,1]*mat.grid#[0,1] + grid#[2,1]*mat.grid#[0,2] + grid#[3,1]*mat.grid#[0,3]
		Local m02# = grid#[0,2]*mat.grid#[0,0] + grid#[1,2]*mat.grid#[0,1] + grid#[2,2]*mat.grid#[0,2] + grid#[3,2]*mat.grid#[0,3]
		'Local m03# = grid#[0,3]*mat.grid#[0,0] + grid#[1,3]*mat.grid#[0,1] + grid#[2,3]*mat.grid#[0,2] + grid#[3,3]*mat.grid#[0,3]
		Local m10# = grid#[0,0]*mat.grid#[1,0] + grid#[1,0]*mat.grid#[1,1] + grid#[2,0]*mat.grid#[1,2] + grid#[3,0]*mat.grid#[1,3]
		Local m11# = grid#[0,1]*mat.grid#[1,0] + grid#[1,1]*mat.grid#[1,1] + grid#[2,1]*mat.grid#[1,2] + grid#[3,1]*mat.grid#[1,3]
		Local m12# = grid#[0,2]*mat.grid#[1,0] + grid#[1,2]*mat.grid#[1,1] + grid#[2,2]*mat.grid#[1,2] + grid#[3,2]*mat.grid#[1,3]
		'Local m13# = grid#[0,3]*mat.grid#[1,0] + grid#[1,3]*mat.grid#[1,1] + grid#[2,3]*mat.grid#[1,2] + grid#[3,3]*mat.grid#[1,3]
		Local m20# = grid#[0,0]*mat.grid#[2,0] + grid#[1,0]*mat.grid#[2,1] + grid#[2,0]*mat.grid#[2,2] + grid#[3,0]*mat.grid#[2,3]
		Local m21# = grid#[0,1]*mat.grid#[2,0] + grid#[1,1]*mat.grid#[2,1] + grid#[2,1]*mat.grid#[2,2] + grid#[3,1]*mat.grid#[2,3]
		Local m22# = grid#[0,2]*mat.grid#[2,0] + grid#[1,2]*mat.grid#[2,1] + grid#[2,2]*mat.grid#[2,2] + grid#[3,2]*mat.grid#[2,3]
		'Local m23# = grid#[0,3]*mat.grid#[2,0] + grid#[1,3]*mat.grid#[2,1] + grid#[2,3]*mat.grid#[2,2] + grid#[3,3]*mat.grid#[2,3]
		Local m30# = grid#[0,0]*mat.grid#[3,0] + grid#[1,0]*mat.grid#[3,1] + grid#[2,0]*mat.grid#[3,2] + grid#[3,0]*mat.grid#[3,3]
		Local m31# = grid#[0,1]*mat.grid#[3,0] + grid#[1,1]*mat.grid#[3,1] + grid#[2,1]*mat.grid#[3,2] + grid#[3,1]*mat.grid#[3,3]
		Local m32# = grid#[0,2]*mat.grid#[3,0] + grid#[1,2]*mat.grid#[3,1] + grid#[2,2]*mat.grid#[3,2] + grid#[3,2]*mat.grid#[3,3]
		'Local m33# = grid#[0,3]*mat.grid#[3,0] + grid#[1,3]*mat.grid#[3,1] + grid#[2,3]*mat.grid#[3,2] + grid#[3,3]*mat.grid#[3,3]
	
		grid[0,0]=m00
		grid[0,1]=m01
		grid[0,2]=m02
		'grid[0,3]=m03
		grid[1,0]=m10
		grid[1,1]=m11
		grid[1,2]=m12
		'grid[1,3]=m13
		grid[2,0]=m20
		grid[2,1]=m21
		grid[2,2]=m22
		'grid[2,3]=m23
		grid[3,0]=m30
		grid[3,1]=m31
		grid[3,2]=m32
		'grid[3,3]=m33
		
	End Method


' apply mat transform to self
' scale is independent
' px->mat[3,0] py->mat[3,1]  pz->mat[3,2]

	Method Local2Global(mat:TMatrix,m:TMatrix)
		Local sgrid#[,]

		sgrid=mat.grid	
	
		Local m00# = sgrid#[0,0]*grid#[0,0] + sgrid#[1,0]*grid#[0,1] + sgrid#[2,0]*grid#[0,2] 
		Local m01# = sgrid#[0,1]*grid#[0,0] + sgrid#[1,1]*grid#[0,1] + sgrid#[2,1]*grid#[0,2] 
		Local m02# = sgrid#[0,2]*grid#[0,0] + sgrid#[1,2]*grid#[0,1] + sgrid#[2,2]*grid#[0,2] 
		Local m03# = 0

		Local m10# = sgrid#[0,0]*grid#[1,0] + sgrid#[1,0]*grid#[1,1] + sgrid#[2,0]*grid#[1,2] 
		Local m11# = sgrid#[0,1]*grid#[1,0] + sgrid#[1,1]*grid#[1,1] + sgrid#[2,1]*grid#[1,2] 
		Local m12# = sgrid#[0,2]*grid#[1,0] + sgrid#[1,2]*grid#[1,1] + sgrid#[2,2]*grid#[1,2] 
		Local m13# = 0

		Local m20# = sgrid#[0,0]*grid#[2,0] + sgrid#[1,0]*grid#[2,1] + sgrid#[2,0]*grid#[2,2] 
		Local m21# = sgrid#[0,1]*grid#[2,0] + sgrid#[1,1]*grid#[2,1] + sgrid#[2,1]*grid#[2,2] 
		Local m22# = sgrid#[0,2]*grid#[2,0] + sgrid#[1,2]*grid#[2,1] + sgrid#[2,2]*grid#[2,2] 
		Local m23# = 0

		Local m30# = sgrid#[0,0]*grid#[3,0] + sgrid#[1,0]*grid#[3,1] + sgrid#[2,0]*grid#[3,2] 
		Local m31# = sgrid#[0,1]*grid#[3,0] + sgrid#[1,1]*grid#[3,1] + sgrid#[2,1]*grid#[3,2] 
		Local m32# = sgrid#[0,2]*grid#[3,0] + sgrid#[1,2]*grid#[3,1] + sgrid#[2,2]*grid#[3,2] 
		Local m33# = 1

		Local sx# = grid#[0,3]
		Local sy# = grid#[1,3]
		Local sz# = grid#[2,3]
	
		m.grid[0,0]=m00*sx
		m.grid[0,1]=m01*sx
		m.grid[0,2]=m02*sx
		m.grid[0,3]=m03
		
		m.grid[1,0]=m10*sy
		m.grid[1,1]=m11*sy
		m.grid[1,2]=m12*sy
		m.grid[1,3]=m13
		
		m.grid[2,0]=m20*sz
		m.grid[2,1]=m21*sz
		m.grid[2,2]=m22*sz
		m.grid[2,3]=m23
		
		m.grid[3,0]=m30
		m.grid[3,1]=m31
		m.grid[3,2]=m32
		m.grid[3,3]=m33
		
	End Method
	
	Method LoadRotation(a#,b#,c#)
		Local t1#,t2#,t4#,t5#,t6#,t8#,t9#,t12#
	
		t1 = Cos(b);
		t2 = Cos(a);
		t4 = Sin(c);
		t5 = Sin(b);
		t6 = t4*t5;
		t8 = Cos(c);
		t9 = Sin(a);
		t12 =t8*t5;
		
		grid[0,0] = t1*t2;
		grid[0,1] = -t6*t2-t8*t9;
		grid[0,2] = -t12*t2+t4*t9;

		grid[1,0] = t1*t9;
		grid[1,1] = -t6*t9+t8*t2;
		grid[1,2] = -t12*t9-t4*t2;

		grid[2,0] = t5;
		grid[2,1] = t4*t1;
		grid[2,2] = t8*t1;

	End Method

	
	Method Inverse:TMatrix()
		Local mat:TMatrix=New TMatrix
		mat.Invert(Self)
		Return mat
	End Method
		
	Method Invert(src:TMatrix)

		Local tx#=0
		Local ty#=0
		Local tz#=0
	
	  	' The rotational part of the matrix is simply the transpose of the
	  	' original matrix.
	  	grid[0,0] = src.grid[0,0]
	  	grid[1,0] = src.grid[0,1]
	  	grid[2,0] = src.grid[0,2]
	
		grid[0,1] = src.grid[1,0]
		grid[1,1] = src.grid[1,1]
		grid[2,1] = src.grid[1,2]
	
		grid[0,2] = src.grid[2,0]
		grid[1,2] = src.grid[2,1]
		grid[2,2] = src.grid[2,2]
	
		' The right column vector of the matrix should always be [ 0 0 0 1 ]
		' in most cases. . . you don't need this column at all because it'll 
		' never be used in the program, but since this code is used with GL
		' and it does consider this column, it is here.
		grid[0,3] = 0 
		grid[1,3] = 0
		grid[2,3] = 0
		grid[3,3] = 1
	
		' The translation components of the original matrix.
		tx = src.grid[3,0]
		ty = src.grid[3,1]
		tz = src.grid[3,2]
	
		' Result = -(Tm * Rm) To get the translation part of the inverse
		grid[3,0] = -( (src.grid[0,0] * tx) + (src.grid[0,1] * ty) + (src.grid[0,2] * tz) )
		grid[3,1] = -( (src.grid[1,0] * tx) + (src.grid[1,1] * ty) + (src.grid[1,2] * tz) )
		grid[3,2] = -( (src.grid[2,0] * tx) + (src.grid[2,1] * ty) + (src.grid[2,2] * tz) )
	
	End Method


	Method Translate(x#,y#,z#)
	
		grid[3,0] = grid#[0,0]*x# + grid#[1,0]*y# + grid#[2,0]*z# + grid#[3,0]
		grid[3,1] = grid#[0,1]*x# + grid#[1,1]*y# + grid#[2,1]*z# + grid#[3,1]
		grid[3,2] = grid#[0,2]*x# + grid#[1,2]*y# + grid#[2,2]*z# + grid#[3,2]

	End Method
		
	Method Scale(x#,y#,z#)
	
		grid[0,0] = grid#[0,0]*x#
		grid[0,1] = grid#[0,1]*x#
		grid[0,2] = grid#[0,2]*x#

		grid[1,0] = grid#[1,0]*y#
		grid[1,1] = grid#[1,1]*y#
		grid[1,2] = grid#[1,2]*y#

		grid[2,0] = grid#[2,0]*z#
		grid[2,1] = grid#[2,1]*z#
		grid[2,2] = grid#[2,2]*z# 
	
	End Method
	
	Method Roll(ang#)
	
		Local cos_ang#=Cos(ang#)
		Local sin_ang#=Sin(ang#)

		Local m00# = grid#[0,0]*cos_ang# + grid#[1,0]*sin_ang#
		Local m01# = grid#[0,1]*cos_ang# + grid#[1,1]*sin_ang#
		Local m02# = grid#[0,2]*cos_ang# + grid#[1,2]*sin_ang#

		grid[1,0] = grid#[0,0]*-sin_ang# + grid#[1,0]*cos_ang#
		grid[1,1] = grid#[0,1]*-sin_ang# + grid#[1,1]*cos_ang#
		grid[1,2] = grid#[0,2]*-sin_ang# + grid#[1,2]*cos_ang#

		grid[0,0]=m00#
		grid[0,1]=m01#
		grid[0,2]=m02#

	End Method
	
		
End Type



Rem		

	Method Freshen(row)
		Select row
			Case 0
				grid[0,0]=grid[0,1]*grid[0,2]
				grid[1,0]=grid[1,1]*grid[1,2]
				grid[2,0]=grid[2,1]*grid[2,2]

			Case 1
				grid[0,1]=grid[0,0]*grid[0,2]
				grid[1,1]=grid[1,0]*grid[1,2]
				grid[2,1]=-grid[2,0]*grid[2,2]
			Case 2
				grid[0,2]=grid[0,1]*grid[0,0]
				grid[1,2]=grid[1,1]*grid[1,0]
				grid[2,2]=grid[2,1]*grid[2,0]
			Case 3
				grid[0,0]=grid[1,0]*grid[2,0]
				grid[0,1]=grid[1,1]*grid[1,2]
				grid[0,2]=grid[1,2]*grid[2,2]
			Case 4
				grid[1,0]=grid[0,0]*grid[2,0]
				grid[1,1]=grid[0,1]*grid[2,1]
				grid[1,2]=grid[0,2]*grid[2,2]
			Case 5
				grid[2,0]=grid[1,0]*grid[0,0]
				grid[2,1]=grid[1,1]*grid[0,1]
				grid[2,2]=grid[1,2]*grid[0,2]
		End Select
	End Method
	Method Freshen2(row)
		Select row
			Case 0
				grid[0,0]=Sqr(1-(grid[0,1]*grid[0,1]+grid[0,2]*grid[0,2]))
				grid[1,0]=Sqr(1-(grid[1,1]*grid[1,1]+grid[1,2]*grid[1,2]))
				grid[2,0]=Sqr(1-(grid[2,1]*grid[2,1]+grid[2,2]*grid[2,2]))
			Case 1
				grid[0,1]=Sqr(1-(grid[0,0]*grid[0,0]+grid[0,2]*grid[0,2]))
				grid[1,1]=Sqr(1-(grid[1,0]*grid[1,0]+grid[1,2]*grid[1,2]))
				grid[2,1]=Sqr(1-(grid[2,0]*grid[2,0]+grid[2,2]*grid[2,2]))
			Case 2
				grid[0,2]=Sqr(1-(grid[0,0]*grid[0,0]+grid[0,1]*grid[0,1]))
				grid[1,2]=Sqr(1-(grid[1,0]*grid[1,0]+grid[1,1]*grid[1,1]))
				grid[2,2]=Sqr(1-(grid[2,0]*grid[2,0]+grid[2,1]*grid[2,1]))
			Case 3
				grid[0,0]=Sqr(1-(grid[1,0]*grid[1,0]+grid[2,0]*grid[2,0]))
				grid[0,1]=Sqr(1-(grid[1,1]*grid[1,1]+grid[2,1]*grid[1,2]))
				grid[0,2]=Sqr(1-(grid[1,2]*grid[1,2]+grid[2,2]*grid[2,2]))
			Case 4
				grid[1,0]=Sqr(1-(grid[0,0]*grid[0,0]+grid[2,0]*grid[2,0]))
				grid[1,1]=Sqr(1-(grid[0,1]*grid[0,1]+grid[2,1]*grid[2,1]))
				grid[1,2]=Sqr(1-(grid[0,2]*grid[0,2]+grid[2,2]*grid[2,2]))
			Case 5
				grid[2,0]=Sqr(1-(grid[0,0]*grid[0,0]+grid[1,0]*grid[1,0]))
				grid[2,1]=Sqr(1-(grid[0,1]*grid[0,1]+grid[1,1]*grid[1,1]))
				grid[2,2]=Sqr(1-(grid[0,2]*grid[0,2]+grid[1,2]*grid[1,2]))
		End Select
	End Method

EndRem
