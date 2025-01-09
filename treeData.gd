extends Resource
class_name treeData

@export var data: Array
@export var columns: PackedStringArray

static func New(d: Array, c: PackedStringArray) -> treeData:
	var td = treeData.new()
	
	td.data = d
	if c:
		td.columns = c
	
	return td

# getters
func GetColumn():
	pass

func GetRow(i: int):
	assert(i < len(data)) #10:44
	
	return data[i]


func _to_string():
	if len(data) == 0:
		return "<empty treeData>"
	
	var result = " | ".join(columns) + "\n-----------------\n"
	
	for row in data:
		result += " | ".join(row) + "\n"
	
	return result
