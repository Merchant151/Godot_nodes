extends MeshInstance3D


func _ready(): 
	# create an array for the ArrayMesh
	var surface_array = []
	# array is required to be this size: 
	surface_array.resize(Mesh.ARRAY_MAX)
	
	# create array of each required data type  
	var verts = PackedVector3Array()
	var uvs = PackedVector2Array()
	var normals = PackedVector3Array()
	var indices = PackedInt32Array()
	#At this time we need to fill the data arrays with geometry. 
	
	#This step is where data is added to the array 
	surface_array[Mesh.ARRAY_VERTEX] = verts
	surface_array[Mesh.ARRAY_TEX_UV] = uvs
	surface_array[Mesh.ARRAY_NORMAL] = normals
	surface_array[Mesh.ARRAY_INDEX] = indices

	# No blendshapes, lods, or compression used.
	#PRIMItive_Triangels 
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, surface_array)
