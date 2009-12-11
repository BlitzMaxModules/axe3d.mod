		
Type TPivot Extends TMiniEntity

	Method Update()
	End Method
	
	Method CopyEntity:TEntity(parent_ent:TEntity=Null)

		' new piv
		Local piv:TPivot
		
		piv=New TPivot
		
		Clone(piv,TMiniEntity(parent_ent))
		
		piv.cull_radius#=cull_radius#
		piv.radius_x#=radius_x#
		piv.radius_y#=radius_y#
		piv.box_x#=box_x#
		piv.box_y#=box_y#
		piv.box_z#=box_z#
		piv.box_w#=box_w#
		piv.box_h#=box_h#
		piv.box_d#=box_d#
		piv.pick_mode=pick_mode
		piv.obscurer=obscurer
		
		Return piv

	End Method

	Function CreatePivot:TPivot(parent_ent:TEntity=Null)

		Local piv:TPivot=New TPivot
		piv.class$="Pivot"
		
		piv.SetParent(parent_ent)
		piv.EntityListAdd(entity_list)

		' update matrix
		piv.Dirty()

		Return piv

	End Function
		
End Type
