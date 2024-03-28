class_name ExampleClient extends Node

var client = SocketIOClient
var backendURL: String

func _ready():
    # prepare URL
    backendURL = "http://localhost:8000/socket.io"

    # initialize client
    client = SocketIOClient.new(backendURL, {"token": "MY_AUTH_TOKEN"})

    # this signal is emitted when the socket is ready to connect
	client.on_engine_connected.connect(on_socket_ready)

    # this signal is emitted when socketio server is connected
	client.on_connect.connect(on_socket_connect)

    # this signal is emitted when socketio server sends a message
    client.on_event.connect(on_socket_event)

    # add client to tree to start websocket
	add_child(client)

func _exit_tree():
	# optional: disconnect from socketio server
	client.socketio_disconnect()

func on_socket_ready(_sid: String):
	# connect to socketio server when engine.io connection is ready
	client.socketio_connect()

func on_socket_connect(_payload: Variant, _name_space, error: bool):
	if error:
		push_error("Failed to connect to backend!")
	else:
		print("Socket connected")

func on_socket_event(event_name: String, payload: Variant, _name_space):
	print("Received ", event_name, " ", payload)
	# respond hello world
	client.socketio_send("hello", "world")
