# Servers and Scaling

## A basic server

- Typically used for simple, static websites
- Listen on a port (defaults to 80 for http)
- Maps requests from clients based on the host specified in the request header to a specified folder
- If no path is specified, it maps to index.html/php
- If a path is specified, it maps to the uniqe resource as a filename

## A web application server (eg node, laravel, rails)

- Dynamically builds html based on the request using templates or code
- Typically has access to a database
- Handles

  - basic resource requests (static assets)
  - JavaScript requests, eg to delete or edit a resource, in which case responses don't include bodies
  - templating and dynamic HTML

  ## Scaling

  Typically, the DNS points to a load balancer, which redirects resource requests to one of a cluster of web application servers depending on how much load they currently have.
