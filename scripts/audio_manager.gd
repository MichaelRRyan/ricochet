extends Node

var num_players = 8
var bus = "Master"

var available = []  # The available players.
var queue = []  # The queue of sounds to play.


# -----------------------------------------------------------------------------
func play(sound_path):
	if not UserPreferences.get_sfx_volume_muted():
		queue.append(sound_path)
		_check_queue()


# -----------------------------------------------------------------------------
func _ready():
	# Create the pool of AudioStreamPlayer nodes.
	for i in num_players:
		var p = AudioStreamPlayer.new()
		add_child(p)
		available.append(p)
		p.connect("finished", self, "_on_stream_finished", [p])
		p.bus = bus
	
	pause_mode = Node.PAUSE_MODE_PROCESS


# -----------------------------------------------------------------------------
func _on_stream_finished(stream):
	# When finished playing a stream, make the player available again.
	available.append(stream)
	_check_queue()


# -----------------------------------------------------------------------------
func _check_queue():
	# Play a queued sound if any players are available.
	if not queue.empty() and not available.empty():
		available[0].stream = load(queue.pop_front())
		available[0].play()
		available.pop_front()


# -----------------------------------------------------------------------------
