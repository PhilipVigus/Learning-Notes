[Main TOC](../README.md)
# Week 3


## Protocols

Defined sets of rules about how things work/interact. There are multiple layers of abstraction within hardware and software:

* Application - HTTP, DNS
* Transmission - TCP/UDP
* Internet - IP(v4 and v6)
* Link Layer - Ethernet, WiFi

### Internet Protocol

This protocol defines how connections work between networked hosts. It splits requests and response into multiple packets, but makes no guarantees that an individual packet will arrive (that's what TCP does, which sits on top of IP)

### Transmission Control Protocol

A layer that sits above IP, dealing with transmission control. It prevents packets from getting lost by resending them.

```bash
# list open TCP connections in the form host:port -> host:port
lsof -i
```

Special hosts:

* 127.0.0.1 - loopback or local host
* 192.168.0.1 - default address for routers and modems

Special ports:

* 80 - HTTP (hypertext transmission protocol)
* 443 - TCP/UDP (transmission control protocol/user datagram protocol)
* 22 - SSH (secure shell)
* 25 - SMTP (simple mail transfer protocol

Your IP address is a bit like your internet phone number

### DNS

A directory of enquiries for the internet

```bash
# get a web address for a domain name
host -t a google.com
```

### HTTP

Defines the format for how documents are served over the internet

#### Request

```bash
# type
telnet google.co.uk 80

# then this followed by two line returns
GET / HTTP/1.1
```

#### Status codes

1xx - wait a sec
2xx - here you go
3xx - go away/somewhere else
4xx - you (client) messed up
5xx - I (server) messed up

#### Chrome console

The network tab shows you all requests and responses made, and you can click on a particular response to get further information.

#### Ruby console

```ruby
# return a document as a string
Net::HTTP.get 'google.com', '/'

# create a response object that can be queried for the attributes of the response
response = Net::HTTP.get 'google.com', '/'
response.code
response.message
response.body
response.each_header { |k, v| puts "#{k}:#{v}" }

```

# Process Modelling

HTTP Request-Response cycle

Why?

* Helps understand how a process work
* Easier than going straight to code
* Easier to add detail than coding
* Good for communicating a process to someone else
* For complex processes, it's impossible to hold it all in your brain at once

What can the models look like?

* Boxes and arrows
* Interpretive dance(!)
* A performance
* ***_Sequence diagrams (https://www.diagram.codes/d/sequence)_***

