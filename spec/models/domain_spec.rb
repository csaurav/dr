require 'spec_helper'

describe Domain do
	
	it "can be instantiated" do
		Domain.new.should be_an_instance_of(Domain)
	end

	it 'should not be valid without an url name rate and url_date' do
		lambda{Domain.create! :url_name => nil}.should raise_error
		lambda{Domain.create! :url_name => 'www.yahoo.com', :url_date => Date.today, :rate => nil}.should raise_error
		lambda{Domain.create! :url_name => 'www.yahoo.com', :url_date => Date.today, :rate => '$4'}.should_not raise_error
	end



end
