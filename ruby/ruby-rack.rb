[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Rack

Rack underpins most of the web frameworks built in Ruby. As long as modules implement its simple interface, they can ue used as modules within Rack and form a part of larger applications.

## The interface

* call(env) - a method that takes a single argument, and returns an array of three elements - status (the HTTP status code), headers and body

## A simple rack application

```ruby
require 'rack'
require 'thin'

class HelloWorld
	def call(env)
		[200, { 'Content-Tyle' => "text/plain" }, ["Hello World"]]
	end
end

Rack::Handler::Thin.run HelloWorld.new
```

Note that Rack expects the body of the response to respond to each, which is why the string in the example above is wrapped in an array.

In the above example, think is a Ruby web server that can handle rack modles. It's worth noting that pretty much all Ruby web servers can do this, as they are all built to handle the Rack interface.

## The env object

A hash that contains all of the data about the request and response, including user agent strings, cookies, request paths etc. All values are strings.

## Using lambdas

An alternate, more succinct syntax:

```ruby
require "rack"
require "thin"

app = -> (env) do
  [ 200, { "Content-Type" => "text/plain" }, env ]
end

Rack::Handler::Thin.run app
```

## Middleware

These are small building blocks that can be used together to form larger Rack applications. Each block confirms to the Rack pattern, as does the larger application.

### Example - logging

```ruby

require 'rack'
require 'thin'

# The core Rack app
app = -> (env) do
	sleep 3
	[200, { "Content-Type" => "text/plain"}, ["Hello World\n"]]
end

# The middleware
class LoggingMiddleware
	def initialize(app)
		@app = app
	end
	
	# The method that a rack app must implement
	def call(env)
		before = Time.now.to_i
		# Use parallel assignment
		status, headers, body = @app.call(env)
		after = Time.now.to_i
		# The message to log
		log_message = "App took #{after - before} seconds."
		
		# Append the log message to the body and return the expected array of three elements
		[status, headers, body << log_message]
	end
end

Rack::Handler::Thin.run LoggingMiddleware.new(app)

```

Middleware only knows (and needs to know) about the next piece of middleware in the chain that makes up a Rack app.

## Rack Builder and RackUp files

The Rack::Builder pattern makes it easier to define and build Rack apps out of multiple components. It is defined in a config.ru file, and run directly through the Rack gem executable using `rackup config.ru`.

```ruby
# no longer need to require 'rack'
require "thin"

app = -> (env) do
  sleep 3
  [ 200, { "Content-Type" => "text/plain" }, ["Hello World\n"] ]
end

class LoggingMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    before = Time.now.to_i
    status, headers, body = @app.call(env)
    after = Time.now.to_i
    log_message = "App took #{after - before} seconds."

    [status, headers, body << log_message]
  end
end

# more concise way of specifying the middleware to use
use LoggingMiddleware
# use secondMiddleware
# use thirdMiddleware
# etc
run app
```

## Example middleware

* Logging
* Cookie handling
* Caching headers
* Parsing the request object