use Test;

use Services::PortMapping;

is %TCPServices<22>, "ssh", "ssh correct";
is %TCPPorts<ssh>, 22, "ssh port correct";
is %TCPPorts<www>, 80, "www port correct";
is %UDPServices<22>, "ssh", "ssh correct";
is %UDPPorts<ssh>, 22, "ssh port correct";
is %TCPServices<80>, "www-http", "http correct";
is %UDPPorts<domain>, 53, "dns correct";
is %SCTPServices<21>, "ftp", "SCTP ftp correct";
done-testing;
