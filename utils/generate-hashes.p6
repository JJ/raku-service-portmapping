unit module Services::PortMapping;

use Text::CSV;

my $file = "resources/data/service-names-port-numbers.csv".IO.e
            ??"resources/data/service-names-port-numbers.csv"
            !!%?RESOURCES<resources/data/service-names-port-numbers.csv>;

my @csv = csv( in => $file, headers => "auto");

our %TCPPorts is export;
our %TCPServices is Export;
our %UDPPorts is Export;
our %UDPServices is Export;

for @csv -> %line {
    next unless %line{'Port Number'};
    next unless %line{'Service Name'};
    given %line{"Transport Protocol"} {
        when 'tcp' {
            %TCPPorts{%line{"Service Name"}} = %line{"Port Number"};
            %TCPServices{%line{"Port Number"}} = %line{"Service Name"};
        }
        when 'udp' {
            %UDPPorts{%line{"Service Name"}} = %line{"Port Number"};
            %UDPServices{%line{"Port Number"}} = %line{"Service Name"};
        }
    }
}

