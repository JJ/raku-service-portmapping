
use Test;

use Services::PortMapping;

is %TCPServices<22>, "ssh", "ssh correct";
is %TCPPorts<ssh>, "22", "ssh port correct";
is %UDPServices<22>, "ssh", "ssh correct";
is %UDPPorts<ssh>, "22", "ssh port correct";
done-testing;