
Strict

'Conversion of common.h

Const dJointTypeNone=0
Const dJointTypeBall=1
Const dJointTypeHinge=2
Const dJointTypeSlider=3
Const dJointTypeContact=4
Const dJointTypeUniversal=5
Const dJointTypeHinge2=6
Const dJointTypeFixed=7
Const dJointTypeNull=8
Const dJointTypeAMotor=9
Const dJointTypeLMotor=10

Const dParamLoStop=0
Const dParamHiStop=1
Const dParamVel=2
Const dParamFMax=3
Const dParamFudgeFactor=4
Const dParamBounce=5
Const dParamCFM=6
Const dParamStopERP=7
Const dParamStopCFM=8
Const dParamSuspensionERP=9
Const dParamSuspensionCFM=10

Const dParamLoStop2=256
Const dParamHiStop2=257
Const dParamVel2=258
Const dParamFMax2=259
Const dParamFudgeFactor2=260
Const dParamBounce2=261
Const dParamCFM2=262
Const dParamStopERP2=263
Const dParamStopCFM2=264
Const dParamSuspensionERP2=265
Const dParamSuspensionCFM2=266

Const dParamLoStop3=512
Const dParamHiStop3=513
Const dParamVel3=514
Const dParamFMax3=515
Const dParamFudgeFactor3=516
Const dParamBounce3=517
Const dParamCFM3=518
Const dParamStopERP3=519
Const dParamStopCFM3=520
Const dParamSuspensionERP3=521
Const dParamSuspensionCFM3=522

Const dAMotorUser=0
Const dAMotorEuler=1

Type dJointFeedback
	Field f1_x#,f1_y#,f1_z#,f1_w#
	Field t1_x#,t1_y#,t1_z#,t1_w#
	Field f2_x#,f2_y#,f2_z#,f2_w#
	Field t2_x#,t2_y#,t2_z#,t2_w#
End Type
