# Internet Overview

1. Client makes request to server using web address
2. DNS server converts web address to IP address, which is returned to the client
3. Client sends a request to the server designated by the IP address
4. Server responds to request, including the requested resource and file type or error code if applicable
5. Client processes the returned resource based on the resource type. Assuming HTML....
   - goes from head to toe
   - pauses on additional asset requests such as css, javascript or images. These trigger additional requests to the server
   - css usually goes in the header so it's loaded first. This prevents FOUSC (flash of unstyled content) problems
   - JavaScript usually goes just before the end of the body. This ensures the basic DOM is loaded before any scripts run, and speeds up the loading of the intial display of the page
   - Resources are often concatenated and minimified to limit both the number of requests and size of individual resources

Note, JavaScript can make XHR(AJAX) requests directly to the server

## Requests

Header + optional body

### Header

- host - the server root, eg www.google.com
- method - GET, PUT, POST, DELETE, PATCH etc
- path - the bit of the address after the first /
- user agent - web browser information used by the back end to do things like redirect to different resources etc
- content type - only included if the request includes a body

## Responses

Header + optional body

### Header

- content type
- status code
  - 200+ okay
  - 300+ redirected
  - 400+ error on client side
  - 500+ error on server side
