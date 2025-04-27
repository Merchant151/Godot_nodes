In this project I am just testing some ideas in godot related to modeling simulations in a game engine.


Okay so I am reading docs to help me understand what I can do here 


my idea is to create kinda on overworld or like a map of connected nodes like SoaSE 

Godot docs suggest to use geometry to do this so a solution would require a MeshInstance3d which can draw the mesh. 

For multiple drawings in a dynamic map using a single node like a multiMeshInstance3D node might help with performance in this area. 

okay so we need to script an arrayMesh shape... 

so we need to ad a meshinstance3d node to the scene and then an arrayMesh to it. Then add a script to the meshinstance node. 
