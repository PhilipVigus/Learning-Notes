# Cross-origin resource sharing

- CORS is used by web applications when they request resources from a different origin to their own, eg loading a web font
- Doing so triggers a cross-origin HTTP request
- HTTP headers allow servers to specify which origins are allowed to read information
- Pre-flight requests are required if a request will have side-effects on a server
- Simple requests
  - don't trigger a pre-flight
  - GET, HEAD and POST only
  - limited subset of header information allowed
  - limited content types allowed
  - no event listeners
  - no ReadableStreams
- Pre-flight requests
  - use OPTIONS to determine whether a request is safe to send
  - use Acess-Control headers to indicate what the request wants to do
