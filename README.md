# WakeOnLan Gem

This WakeOnLan Ruby Gem is a script that can be used to send a
[Wake-On-Lan](http://en.wikipedia.org/wiki/Wake-on-LAN) packet
to a specified [MAC address](http://en.wikipedia.org/wiki/Mac_address).

## Installation

1. Download the Gem file
2. Execute 

   gem install <path to downloaded Gem file>

## Usage

To send a magic packet to the specified MAC address using the network
broadcast address and UDP port 9.

	wakeonlan --mac-address 01:23:45:67:89:0A

### Remarks

The specified MAC Address can be specified using any of these formats:
  * ##:##:##:##:##:## (example 01:23:45:67:89:0A)
  * ##-##-##-##-##-## (example 01-23-45-67-89-0A)
  * ####.####.#### (example 0123.4567.890A)

Copyright (c) 2014 Thomas Chester. This software is licensed under the MIT License.