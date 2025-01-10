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
	
	#print(td.GetRow(2)) test
	#print(td.GetColumn("Category")) test
	
	#td.AddColumn([5, 4, 5, 6, 7, 9], "Total") test
	
	var total = treeData.EvalColumns(
		td.GetColumn("Category"), "+", td.GetColumn("Family Name")
	)
	td.AddColumn(total, "Total")
	
	var pct = treeData.EvalColumns(
		td.GetColumn("Tree Species"), "+", td.GetColumn("Total"), #true
	)
	td.AddColumn(pct, "Pct")
	 #Percent, ganti to display name and type
	
	print(td)
	
	
	#print(1 / 4)
	#print(3 / 2)
	
	#print("%s says hi to %s %d times" % ["Eypa", "Fadze", 7]) test
