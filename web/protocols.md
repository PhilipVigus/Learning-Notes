[Main TOC](../README.md) / [Web TOC](./web-TOC.md)

# Week 3


## Protocols

Defined sets of rules about how things work/interact. There are multiple layers of abstraction within hardware and software:

* Application - HTTP, DNS
* Transmission - TCP/UDP
* Internet - IP(v4 and v6)
* Link Layer - Ethernet, WiFi

Communication protocols specify the syntax, semantics and timing issues within their particular domain

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

Is an application protocol that sits above the communication protocol (TCP/IP). It defines the format for how documents are served over the internet

#### Request

```bash
# type
telnet google.co.uk 80

# then this followed by two line returns
# GET - the verb or method
# / - The path to the information we want
# HTTP/1.1 - The flavour(version) of the language we're speaking
GET / HTTP/1.1
```
#### Response

```bash
HTTP/1.1 200 OK
Date: date_info
Sever: server_info
Content-Type: content_info
Set-Cookie: cookie info
...
etc

```

#### Status codes

1xx - wait a sec
2xx - here you go
3xx - go away/somewhere else
4xx - you (client) messed up
5xx - I (server) messed up

#### Methods

HEAD - like get except the server is only asked to return the response header, with no resource(body). It's useful if you want to check a resource's characteristics without needing the resource itself, and it saves bandwidth.

POST - send data to a server
* Contains a block of data in the body that's sent to the server and a few extra headers to describe the body
* The request URI usually points to a program to handle the data being sent
* The HTTP response is normally program output rather than a static file

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
