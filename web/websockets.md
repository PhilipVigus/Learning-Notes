# WebSockets

- Allow a method for opening a semi-permanent two-way connection between a client and server
- Ideal for applications that require real-time updates
- Eliminate the need for hand-shaking when sending additional packets/messages
- HTTP/2 offers WebSocket support, but its use of binary multiplexing has reduced the use-cases for WebSockets considerably
- Work on a different layer to the features offered by HTTP/2, exposing an API directly to the programmer
