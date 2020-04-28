# Services::PortMapping

Map ports to services (and back) for internet services. Using [this CSV file](https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.csv) 
included in the distribution, creates and exports 4 hashes that map ports to
 services and back, for UDP and TCP.
 
 * `%TCPServices` maps ports to TCP services
 * `%TCPPorts` maps service names to ports;
 
 And idem with UDP instead of TCP.
 
# Example

```
say %TCPServices<80>; # should return www-http
say %UDPPorts<domain>;   # should return 53
```

You can also use .keys to print the existing values.

## License

GPL