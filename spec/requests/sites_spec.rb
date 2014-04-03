require 'spec_helper'

describe "Sites" do

	describe "Gets /sites" do
		it "should be successful" do
			get sites_path
			response.status.should == 200
		end
	end
end