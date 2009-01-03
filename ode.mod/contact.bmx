
Strict

'Conversion of contact.h

Const dContactMu2=1
Const dContactFDir1=2
Const dContactBounce=4
Const dContactSoftERP=8
Const dContactSoftCFM=16
Const dContactMotion1=$20
Const dContactMotion2=$40
Const dContactSlip1=$80
Const dContactSlip2=$100
Const dContactApprox0=$0
Const dContactApprox1_1=$0
Const dContactApprox1_2=$0
Const dContactApprox1=$0

Type dSurfaceParameters
	Field mode
	Field mu#
	Field mu2#
	Field bounce#
	Field bounce_vel#
	Field soft_erp#
	Field soft_cfm#
	Field motion1#
	Field motion2#
	Field slip1#
	Field slip2#
End Type

Type dContactGeom
	Field pos_x#,pos_y#,pos_z#,pos_w#
	Field normal_x#,normal_y#,normal_z#,normal_w#
	Field depth#
	Field g1,g2
	Field side1,side2
End Type

Type dContact
	Field mode
	Field mu#
	Field mu2#
	Field bounce#
	Field bounce_vel#
	Field soft_erp#
	Field soft_cfm#
	Field motion1#
	Field motion2#
	Field slip1#
	Field slip2#
	Field pos_x#,pos_y#,pos_z#,pos_w#
	Field normal_x#,normal_y#,normal_z#,normal_w#
	Field depth#
	Field g1,g2
	Field side1,side2
	Field fdir1_x#,fdir1_y#,fdir1_z#,fdir1_w#
End Type
