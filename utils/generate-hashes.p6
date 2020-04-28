#!/usr/bin/env perl6

use Cro::HTTP::Client;
use Text::CSV;

#constant $url = "https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.csv";
#
#my $client = Cro::HTTP::Client.new(
#    headers => [
#        User-agent => 'Raku Service PortMapping'
#    ]); # Need user agent to avoid 403
#my $mapping-resp = await $client.get( $url );
#my $mapping = await $mapping-resp.body;

my @csv = csv( in => "utils/service-names-port-numbers.csv",
                headers => "auto");

my (%TCPPorts, %TCPServices, %UDPPorts, %UDPServices);

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

say %TCPPorts.raku;
say %UDPPorts.raku;
say %TCPServices.raku;
say %UDPServices.raku;

