require "net/wol"
require "net/mac_address"

module Net
  
  describe Wol, "payload" do

  	before(:each) do
  		@mac_address = Net::MacAddress.new("01-23-45-67-89-0A")
  	end

  	it "should contain 102 bytes" do
  		Wol.send(@mac_address.octets) do |payload|
  			payload.length.should == 102
  		end
  	end

  	it "should have the first six bytes as 0xFF" do
  		Wol.send(@mac_address.octets) do |payload|
  			payload[0..5].should == [255,255,255,255,255,255]
  		end
  	end

  	it "should have the mac address repeated 16 times after the prefix" do
  		expected_value = [255,255,255,255,255,255]
  		16.times do 
  		 	expected_value = expected_value.concat([1,35,69,103,137,10])
  		end

  		Wol.send(@mac_address.octets) do |payload|
  			payload.should == expected_value
  		end
  	end
	
  end

end