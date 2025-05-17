extends MeshInstance3D

var rings = 50
var radial_segments = 50
var radius = 1

func _ready(): 
	print('test debug')
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
	#using the ring example from the docs at this time 
	
	# Vertex indices.
	var thisrow = 0
	var prevrow = 0
	var point = 0

	# Loop over rings.
	for i in range(1 + 1):
		var v = float(i) / rings
		var w = sin(PI * v)
		var y = cos(PI * v)
		print(str('LOOPING OER RINGS: v: ',v,' w: ',w,' y: ',y))
		
		# Loop over segments in ring.
		for j in range(radial_segments + 1):
			var u = float(j) / radial_segments
			var x = sin(u * PI * 2.0)
			var z = cos(u * PI * 2.0)
			var vert = Vector3(x * radius * w, y * radius, z * radius * w)
			verts.append(vert)
			normals.append(vert.normalized())
			uvs.append(Vector2(u, v))
			point += 1
			print(str('DEBUGING SEGMENTS: u: ',u,' x: ',x,' z: ',z))
			
			# Create triangles in ring using indices.
			if i > 0 and j > 0:
				indices.append(prevrow + j - 1)
				indices.append(prevrow + j)
				indices.append(thisrow + j - 1)

				indices.append(prevrow + j)
				indices.append(thisrow + j)
				indices.append(thisrow + j - 1)

		prevrow = thisrow
		thisrow = point
	
	
	#This step is where data is added to the array 
	surface_array[Mesh.ARRAY_VERTEX] = verts
	surface_array[Mesh.ARRAY_TEX_UV] = uvs
	surface_array[Mesh.ARRAY_NORMAL] = normals
	surface_array[Mesh.ARRAY_INDEX] = indices

	# No blendshapes, lods, or compression used.
	#PRIMItive_Triangels 
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, surface_array)
