extends Node


func _ready():
	
	var columns = ["Category", "Family Name", "Tree Species"]
	var data = [
		["Pokok Asli (Native)", "", "Meranti (Shorea spp)"],
		["Pokok Hiasan/Naungan", "", "Angsana (Pterocarpus indicus)"],
		["Pokok Biasa (Common)", "", "Banyan (Ficus benghalensis)"],
		["", "Bignoniaceae", "Tabebuai sp."],
		["", "Combretaceae", "Bucida sp."],
		["", "Rubiaceae", "Gardenia sp."]
	]
	
	var td = treeData.New(data, columns)
	print(td)
	
	print(td.GetRow(2))
	print(td.GetColumn("Category"))
