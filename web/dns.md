# DNS - Domain Name System

Transforms website names to ip addresses

1. Type the web address into your browswer. The browser sends a query asking what the ip address is for that address
2. A recursive resolver server (usually but not always run by your ISP), accepts the query. The resolver knows how to contact all other DNS servers required to resolve the query.
3. First the resolve contacts a Root Server. These each know DNS information for a top-level domain such as .com or .net.
4. The resolver uses the information from the Root Server to contact the appropriate TLD server. These each store information about the second level of the web address, e.g. the 'google' part of www.google.com. The TLD answers the query with the IP address of the domain's authoritative name server.
5. The ANS knows the full IP address for the full query, which is returned to the recursive resolver.
6. The resolver tells the browser the IP, which sends a request to the website using it to retrieve its content.

Caching is also a hugely important aspect of this process. At each stage listed above, the relevant server maintains a cache of the most common queries. This means that for commonly requested queries, the process can be significantly short-circuited.
