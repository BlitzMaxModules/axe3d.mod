
Strict

Rem
bbdoc: axe3d.Drivers
about:
Your Axe3D application should import this module for standard default #{axe3D drivers}

Current defaults:

[ @Platform | @{Default Driver}
* Windows | #axe3d.MiniB3D
* Linux | #axe3d.MiniB3D
* Mac OS X | #axe3d.MiniB3D
]
End Rem
Module axe3d.drivers

ModuleInfo "Version: 0.01"
ModuleInfo "Author: Simon Armstrong"
ModuleInfo "License: Blitz Shared Source Code"
ModuleInfo "Copyright: Blitz Research Ltd"
ModuleInfo "Modserver: BRL"

ModuleInfo "History: 0.01 Release"
ModuleInfo "History: Initial concept build"

Import axe3d.m3d

'Import axe3d.minib3d
'Import axe3d.b3dsdk
