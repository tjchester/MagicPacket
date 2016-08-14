require 'socket'

module MagicPacket
  # Sends a wake-on-lan magic packet to the specified address and port.
  # Link: http://en.wikipedia.org/wiki/Wake-on-LAN
  module Wol
  	
  	# By default this method will send the magic packet as a UDP broadcast
  	# packet using port 9. Using this default will match Wireshark's WOL
  	# packet detection rule. If you want to generate the magic packet
  	# without sending it or want to send it using a different method just
  	# pass a block to this function.
  	#
  	# The input parameter is expected to be an array of integers that
  	# represent the MAC address.
  	def self.send(mac_address)
  		
  		# Create the magic packet using a prefix of six 0xFF bytes
  		# followed by 16 copies of the six byte mac address.
		  payload = [255,255,255,255,255,255]
		  16.times do 
			 payload = payload.concat(mac_address)
		  end

		  if block_given?
          yield(payload)
      else
	  		socket = UDPSocket.new

	  		# Refer to setsockopt() function in sys/socket.h for 
	  		# additional information on options.
			  socket.setsockopt(Socket::SOL_SOCKET, Socket::SO_BROADCAST, true)
			
			  socket.send(payload.pack("C" * payload.length), 0, '<broadcast>', 9)
			  socket.close
      end

	   end
  
  end
end