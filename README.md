# Services::PortMapping  [![Test-install distro](https://github.com/JJ/raku-service-portmapping/actions/workflows/test.yaml/badge.svg)](https://github.com/JJ/raku-service-portmapping/actions/workflows/test.yaml)

Map ports to services (and back) for internet services. Using [this CSV file](https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.csv) 
included in the distribution, creates and exports 4 hashes that map ports to
 services and back, for UDP and TCP.
 
 * `%TCPServices` maps ports to TCP services
 * `%TCPPorts` maps service names to ports;
 
And idem with UDP instead of TCP.
 
# Example

We have `[protocol]Services`, a hash that maps port numbers to the services
 it hosts, and `[protocol]Ports`, which maps the conventional service name to
  the port it uses. `protocol == any <TCP UDP SCTP DCCP>`

> No, I had never heard about these last two before

```
say %TCPServices<80>; # should return www-http
say %UDPPorts<domain>;   # should return 53
```

You can also use `.keys` to print the existing ports or services.

## License

(c) JJ Merelo, `jj@raku.org`, 2020-2022

Released under the GPL-3.0 license.
