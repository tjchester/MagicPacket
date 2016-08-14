require 'spec_helper'
require 'magic_packet'

module MagicPacket

  describe Wol, "payload" do

  	before(:each) do
  		@mac_address = MagicPacket::MacAddress.new("01-23-45-67-89-0A")
  	end

  	it "should contain 102 bytes" do
  		Wol.send(@mac_address.octets) do |payload|
  			expect(payload.length).to eq(102)
  		end
  	end

  	it "should have the first six bytes as 0xFF" do
  		Wol.send(@mac_address.octets) do |payload|
  			expect(payload[0..5]).to eq([255,255,255,255,255,255])
  		end
  	end

  	it "should have the mac address repeated 16 times after the prefix" do
  		expected_value = [255,255,255,255,255,255]
  		16.times do 
  		 	expected_value = expected_value.concat([1,35,69,103,137,10])
  		end

  		Wol.send(@mac_address.octets) do |payload|
  			expect(payload).to eq(expected_value)
  		end
  	end
	
  end

end