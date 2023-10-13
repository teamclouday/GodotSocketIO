# Godot SocketIO

socket.io v4 client for Godot engine

## How to Use

### Step 1

Drop `client.gd` into Godot project.

### Step 2

See reference code in `example.gd`

Be aware that by default socket.io server uses `/socket.io/` suffix in url. So for example, if `http://localhost:8000/` is normally used in client, use `http://localhost:8000/socket.io/` instead.

## References

- [engine.io-protocol](https://github.com/socketio/engine.io-protocol)
- [socket.io-protocol](https://github.com/socketio/socket.io-protocol)

## Limitations

Does not support binary data transfer. You're welcome to open pull request for this.
