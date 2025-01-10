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
func GetColumn(col: String):
	assert(col in columns) #11:37
	
	var ix = columns.find(col)
	var result = []
	
	for row in data:
		result.append(row[ix])
	
	return result #12:29

func GetRow(i: int):
	assert(i < len(data)) #10:44
	
	return data[i]

# adders
func AddColumn(d: Array, col_name: String):
	assert(len(d) == len(data))
	
	for i in range(len(data)):
		data[i].append(d[i])
	
	columns.append(col_name) #14:00


static func EvalColumns(
	c1: Array,
	operand: String,
	c2: Array
):
	assert(len(c1) == len(c2)) #15:10 change 15:46
	
	var expression = Expression.new()
	expression.parse("a %s b" % operand, ["a", "b"]) #16:43
	
	#18:56
	var result = []
	for i in range(len(c1)):
			result.append(
				expression.execute([c1[i], c2[i]])
			)
	
	return result


func _to_string():
	if len(data) == 0:
		return "<empty treeData>"
	
	var result = " | ".join(columns) + "\n--------------------------------------------------------\n"
	
	for row in data:
		result += " | ".join(row) + "\n"
	
	return result
