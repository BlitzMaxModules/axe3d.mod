
' Procedural Interfaces

Rem
bbdoc: Minib3d Only
about:
This command is included as MiniB3D currently does not have the same buffer commands as Blitz3D.

Use this command to copy a region of the backbuffer to a texture.

The region copied from the backbuffer will start at (0,0), and end at the texture's width and height.

Therefore if you want to copy the whole of a 3D scene to a texture, you must first resize the camera viewport to the size of 
the texture, use RenderWorld to render the camera, then use this command to copy the backbuffer to the texture.

Note that if a texture has the mipmap flag enabled (by default it does), then this command must be called for each mipmap,
otherwise the texture will appear to fade into a different, non-matching mipmap as you move away from it. A routine similar to
the one below will copy the backbuffer to each mipmap, making sure the camera viewport is the same size as the mipmap.

For i=0 Until tex.CountMipmaps()
	CameraViewport 0,0,tex.MipmapWidth(),tex.MipmapHeight()
	Renderworld
	BackBufferToTex(tex,i)
Next

It may be easier to disable the mipmap flag for the texture. To do so, use ClearTextureFilters after calling Graphics3D 
(the mipmap flag is a default filter).

If you are using this command to copy to a cubemap texture, use SetCubeFace to first select which portion of the texture you
will be copying to. Note that in MiniB3D mipmaps are not used by cubemaps, so ignore the information about mipmaps for normal 
textures above.

See the cubemap.bmx example included with MiniB3D to learn more about cubemapping.
End Rem
Function BackBufferToTex(tex:TTexture,mipmap_no=0,frame=0)
	tex.BackBufferToTex(mipmap_no,frame)
End Function

Rem
bbdoc: Minib3d Only
about:
This command is the equivalent of Blitz3D's MeshCullBox command.

It is used to set the radius of a mesh's 'cull sphere' - if the 'cull sphere' is not inside the viewing area, the mesh will not 
be rendered.

A mesh's cull radius is set automatically, therefore in most cases you will not have to use this command.

One time you may have to use it is for animated meshes where the default cull radius may not take into account all animation 
positions, resulting in the mesh being wrongly culled at extreme positions.
End Rem
Function MeshCullRadius(ent:TEntity,radius#)
	ent.MeshCullRadius(radius#)
End Function

