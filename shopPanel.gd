extends Node


func _ready():
	
	var columns = ["Category", "Family Name", "Tree Species"]
	var data = [
		["Pokok Asli (Native)", "NA", "Meranti (Shorea spp)"],
		["Pokok Hiasan/Naungan", "NA", "Angsana (Pterocarpus indicus)"],
		["Pokok Biasa (Common)", "NA", "Banyan (Ficus benghalensis)"],
		["NA", "Bignoniaceae", "Tabebuai sp."],
		["NA", "Combretaceae", "Bucida sp."],
		["NA", "Rubiaceae", "Gardenia sp."]
	]
	
	var td = treeData.New(data, columns)
	#print(td) #14:25 delete
	
	#print(td.GetRow(2))
	#print(td.GetColumn("Category"))
	
	td.AddColumn(
		[5, 4, 5, 6, 7, 9], 
		"Total"
	)
	
	print(td)
