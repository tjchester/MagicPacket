require "net/mac_address"

module Net
  
  describe MacAddress do

  	it "should accept mac addresses using the ##-##-##-##-##-## format" do
  		mac_address = Net::MacAddress.new("01-23-45-67-89-0A")
  		true
  	end

  	it "should accept mac addresses using the ##:##:##:##:##:## format" do
  		mac_address = Net::MacAddress.new("01:23:45:67:89:0A")
  		true
  	end

  	it "should accept mac addresses using the ####.####.#### format" do
  		mac_address = Net::MacAddress.new("0123.4567.890A")
  		true
  	end

  	it "should reject mac addresses using a ############ format" do 
  		begin
  			mac_address = Net::MacAddress.new("01234567890A")
  		rescue
  			true
  		end
  	end

  	it "should convert the mac address to an array of six bytes in length" do
  		mac_address = Net::MacAddress.new("0123.4567.890A")
  		mac_address.octets.size.should == 6
  	end

  	it "should convert the mac address to an equivalent array of integers" do 
  		mac_address = Net::MacAddress.new("01-23-45-67-89-0A")
  		mac_address.octets.should == [1,35,69,103,137,10]
  	end

  	it "should convert mac addresses back to strings in the ##-##-##-##-##-## format" do
  		mac_address = Net::MacAddress.new("01:23:45:67:89:0A")
  		mac_address.to_s.upcase.should == "01-23-45-67-89-0a".upcase
  	end

  end

end