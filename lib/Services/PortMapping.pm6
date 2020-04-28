unit module Services::PortMapping;

use Text::CSV;

my $csv = "resources/data/service-names-port-numbers.csv".IO.e
        ??"resources/data/service-names-port-numbers.csv".IO.slurp
        !!%?RESOURCES<data/service-names-port-numbers.csv>.slurp;

my @csv = csv( in => [$csv], headers => "auto");

our %TCPPorts is export;
our %TCPServices is export;
our %UDPPorts is export;
our %UDPServices is export;

for @csv -> %line {
    next unless %line{'Port Number'};
    next unless %line{'Service Name'};
    given %line{"Transport Protocol"} {
        when 'tcp' {
            %TCPPorts{%line{"Service Name"}} = %line{"Port Number"}.Int;
            %TCPServices{%line{"Port Number"}} = %line{"Service Name"};
        }
        when 'udp' {
            %UDPPorts{%line{"Service Name"}} = %line{"Port Number"}.Int;
            %UDPServices{%line{"Port Number"}} = %line{"Service Name"};
        }
    }
}
