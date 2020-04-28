
use Test;

use Service::PortMapping;

say %TCPPorts;
is %TCPServices<22>, "ssh", "ssh correct";
is %TCPPorts<ssh>, "22", "ssh port correct";
done-testing;