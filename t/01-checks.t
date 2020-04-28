
use Test;

use Service::PortMapping;


is %TCPServices<22>, "ssh", "ssh correct";
is %TCPPorts<ssh>, "22", "ssh port correct";
done-testing;