extends TileMap

var myNoise = FastNoiseLite.new()
var myNoise2 = FastNoiseLite.new()

var width = 150
var height = 150
@onready var player = $"../Player"

func _ready():
	myNoise.seed = randi()
	myNoise2.seed = randi()
	myNoise.frequency = 0.005

func _process(delta):
	generate_chunk(player.position)
	
func getRandom(noiseValue):
	var random = floor((noiseValue + 1)*2)
	if random == 4:
		random = 3
	return random
		
func generate_chunk(position):
	var tile_pos = local_to_map(position)
	for x in range(width):
		for y in range(height):
			var myX = tile_pos.x - width/2 + x
			var myY = tile_pos.y - height/2 + y
			var noiseValue = myNoise.get_noise_2d(myX, myY)
			var noiseValue2 = myNoise2.get_noise_2d(myX, myY)
			var v2 = Vector2(getRandom(noiseValue), getRandom(noiseValue2))
			set_cell(0, Vector2i(myX, myY), 0, v2)
