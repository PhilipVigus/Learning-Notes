# HTTP

- Hypertext transfer protocol is stateless. No assumptions can be made about previous message exchanges.
- It requires a reliable protocol, usually TCP/IP (the internet protocol suite with the foundation Transfer Control Protocol and Internet Protocol that the internet uses to define its communication protocols). Messages or errors are guaranteed to get through.
- The default HTTP port is 80
- Communication is via request/response pairs

## URLs

A uniform resource locator gives the address of a web resource on a computer network, eg

http://www.domain.com:80/path/to/resource?a=b&c=d

- http specifies the protocol
- www.domain.com. specifies the host (the dot at the end is the root, and you don't usually see it as it's implicit)
- 80 is the port
- path/to/resource gives the path the the specific resource requestd
- a=b&c=d is the query

## Request verbs

| Verb   | Purpose                                            |
| :----- | :------------------------------------------------- |
| GET    | fetch an existing resource                         |
| POST   | create a new resource using the given payload      |
| PUT    | update a resource using the given payload          |
| DELETE | delete a resource                                  |
| PATCH  | update a part of a given resource with the payload |

HEAD, TRACE and OPTIONS are less common verbs.

## Identification

From

- request headers in the from, referer and user-agent fields
- the client-ip
- fat urls, where the user id is stored as part of a unique version of the url for that user
- cookies, popular and non-intrusive name-value pairs

## Authentication

- Basic uses the 401 unauthorised code, which prompts the client to ask for login details
- Digest is similar, but uses a more secure hashing function

## Secure HTTP

- Uses a secure sockets layer (SSL) or transport layer security (TLS)
- powerful encryption
- requires a digitial certificate to identify the server, which is issued by one of a number of Certificate Authorities

## Caching

Private

- browser

Public

- caching proxies
  - check for a local copy
  - see if it's expired (its freshness)
  - send it if it's still fresh

Whether something is cacheable is decided by information specified in the server response header.

## HTTP 1.1 vs 2

| HTTP 1.1                                                                                      | HTTP 2                                                                                  |
| :-------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------- |
| Keeps everything in plain text                                                                | Encodes everything using the binary encoding layer                                      |
| Uses pipelining to speed up messages (now superceded on most modern browsers by multiplexing) | Uses multiplexing and streams (which allow prioritisation), utilising the binary format |
| Uses resource inlining to predict resource needs                                              | Uses server push and multiple concurrent connections                                    |
| Often compresses with GZip                                                                    | Uses various techniques unlocked by using binary format                                 |
