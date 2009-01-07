
Strict

Framework bmx3d.max3d

Import maxgui.drivers
Import brl.timer
Import brl.eventqueue

Local m3dapp:TMax3dApplet
m3dapp=New TMax3dApplet.Create("Max3dSDK (C)2007 Blitz Research Ltd.")
While True
	WaitEvent
	m3dapp.OnEvent(CurrentEvent)
Wend

End

Const MENU_NEW=101
Const MENU_OPEN=102
Const MENU_SAVE=103
Const MENU_CLOSE=104
Const MENU_EXIT=105

Const MENU_CUT=106
Const MENU_COPY=107
Const MENU_PASTE=108

Const MENU_ABOUT=109

Type TMax3dApplet

	Field camera
	Field light
	Field entity
	
	Field lost=True
	
	Field yellow
	Field green
	Field ground
	
	Method InitWorld(maxwidth,maxheight)
		OpenMax3d	
		SetClearColor 0,.1,.4
		camera=CreateCamera()
		MoveEntity camera,0,2,-2
		light=CreatePointLight()
		MoveEntity light,6,10,-10
		yellow=CreateMaterial()
		SetMaterialColor yellow,"DiffuseColor",1,1,0
		entity=CreateBox( yellow,1,1,1,2,0 )
		MoveEntity entity,0,2,0
		SetAmbientColor .5,.5,.5
		green=CreateMaterial()
		SetMaterialColor green,"DiffuseColor",0,1,0
		ground=CreateBox( green,100,.1,100,2,0 )
		lost=False
	End Method

	Method DrawWorld(w,h)
		SetGraphics CanvasGraphics(canvas)
		Global init
		If Not init
			w=ClientWidth(Desktop())
			h=ClientHeight(Desktop())
			InitWorld(w,h)
			init=True
		EndIf
'		If lost Return
		SetCameraViewport camera,0,0,w,h
		TurnEntity entity,0,1,0
		RenderWorld
'		Cls
		Flip 
	End Method

	Field	window:TGadget
	Field	canvas:TGadget
	Field	timer:TTimer
	Field filemenu:TGadget
	Field editmenu:TGadget
	Field helpmenu:TGadget

	Method Create:TMax3dApplet(name$)
		Local	w,h,hwnd
		
		window=CreateWindow(name,20,20,512,512)

		filemenu=CreateMenu("&File",0,WindowMenu(window))
		CreateMenu"&New",MENU_NEW,filemenu,KEY_N,MODIFIER_COMMAND
		CreateMenu"&Open",MENU_OPEN,filemenu,KEY_O,MODIFIER_COMMAND
		CreateMenu"&Close",MENU_CLOSE,filemenu,KEY_W,MODIFIER_COMMAND
		CreateMenu"",0,filemenu
		CreateMenu"&Save",MENU_SAVE,filemenu,KEY_S,MODIFIER_COMMAND
		CreateMenu"",0,filemenu
		CreateMenu"E&xit",MENU_EXIT,filemenu,KEY_F4,MODIFIER_COMMAND
		
		editmenu=CreateMenu("&Edit",0,WindowMenu(window))
		CreateMenu "Cu&t",MENU_CUT,editmenu,KEY_X,MODIFIER_COMMAND
		CreateMenu "&Copy",MENU_COPY,editmenu,KEY_C,MODIFIER_COMMAND
		CreateMenu "&Paste",MENU_PASTE,editmenu,KEY_V,MODIFIER_COMMAND
		
		helpmenu=CreateMenu("&Help",0,WindowMenu(window))
		CreateMenu "&About",MENU_ABOUT,helpmenu
		
		UpdateWindowMenu window
	
		w=ClientWidth(window)
		h=ClientHeight(window)

		canvas=CreateCanvas(0,0,w,h,window)
		canvas.SetLayout 1,1,1,1
		
		timer=CreateTimer(30)
		Return Self		
	End Method
	
	Field rendertime=MilliSecs()
	
	Method OnEvent:Object(Event:TEvent)
		Select event.id
		Case EVENT_WINDOWCLOSE
			End
		Case EVENT_TIMERTICK
			If (MilliSecs()-rendertime<10) Return
			DrawWorld ClientWidth(canvas),ClientHeight(canvas)
			rendertime=MilliSecs()
			Return Null
'			RedrawGadget canvas
		Case EVENT_GADGETPAINT
			DrawWorld ClientWidth(canvas),ClientHeight(canvas)
		Case EVENT_MENUACTION
			Select EventData()
				Case MENU_EXIT
					End
				Case MENU_ABOUT
					Notify "Incrediabler~n(C)2005 Incredible Software"
			End Select
		End Select
	End Method

	
End Type

