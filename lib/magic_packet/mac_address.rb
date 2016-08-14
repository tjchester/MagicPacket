module MagicPacket
  # A MAC (media access control) address is a unique identifier assigned
  # to a network interface at the physical layer.
  # link: http://en.wikipedia.org/wiki/Mac_address
  class MacAddress

    # An array of six integers that represents the original MAC address.
    attr_reader :octets

    # Accepts a MAC address in one of the string formats listed
    # below and converts it to as an array of six integers.
    #
    # Accepted formats:
    #  * ##-##-##-##-##-##
    #  * ##:##:##:##:##:##
    #  * ####.####.####
    #
    # Will throw an ArgumentExcpetion if the input format is 
    # not one of the accepted formats.
    def initialize(mac_address)

      # At the end of initialization, this variable will hold the
      # binary representation of the input mac address as an array
      # six integers.
      @octets = []

      if mac_address.downcase =~ /([a-z0-9]{2}-){5}[a-z0-9]{2}/

        # Matches format: "01:23:45:67:89:ab"
        mac_address.split("-").each do |number|
          octets << number.to_i(16)
        end

      elsif mac_address.downcase =~ /([a-z0-9]{2}:){5}[a-z0-9]{2}/
        
        # Matches format: "01-23-45-67-89-ab" 
        mac_address.split(":").each do |number|
          octets << number.to_i(16)
        end

      elsif mac_address.downcase =~ /[a-z0-9]{4}\.[a-z0-9]{4}\.[a-z0-9]{4}/
          
        # Matches format: "0123.4567.89ab"
        mac_address.split(".").each do |number|
          octets << number[0,2].to_i(16)  # For '0123', handle the '01' part
          octets << number[2,2].to_i(16)  # For '0123', handle the '23' part
        end

      else
      
        raise ArgumentError, "The format of '#{mac_address}' is not recognized.", caller
      
      end

    end

    # Returns a string representation of the original MAC address
    # formatted as "##-##-##-##-##-##". If you need a different 
    # format, access the octets attribute instead.
    def to_s()
      "%02x-%02x-%02x-%02x-%02x-%02x" % @octets
    end

  end
end

if __FILE__ == $0
  mac_address = MagicPacket::MacAddress.new("01:23:45:67:89:ab")
  puts mac_address.to_s
end