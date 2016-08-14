# magic_packet

* [Homepage](https://rubygems.org/gems/magic_packet)
* [Documentation](http://rubydoc.info/gems/magic_packet/frames)
* [Source](https://github.com/tjchester/magic_packet)

## Description

This Ruby gem is a script that can be used to send a magic or 
[Wake-On-Lan](http://en.wikipedia.org/wiki/Wake-on-LAN) packet
to a specified [MAC address](http://en.wikipedia.org/wiki/Mac_address).

## Features

## Examples

    require 'magic_packet'

## Requirements

## Install

    $ gem install magic_packet

## Command Line Tool Usage

To send a magic packet to the specified MAC address using the network
broadcast address and UDP port 9.

```
magic_packet --mac-address 01:23:45:67:89:0A
```

> The specified MAC Address can be specified using any of these formats: **##:##:##:##:##:##** (example 01:23:45:67:89:0A), **##-##-##-##-##-##** (example 01-23-45-67-89-0A), or **####.####.####** (example 0123.4567.890A)

## Copyright

Copyright (c) 2014 Thomas Chester

See LICENSE.txt for details.
