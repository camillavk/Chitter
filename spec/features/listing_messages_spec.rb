require 'spec_helper'

feature "User browses the list of available messages" do 
	before(:each) {
		Message.create(:title => "Example",
									:text => "Testing")
	}

	scenario "when opening the home page" do 
		visit '/'
		expect(page).to have_content("Example")
	end
end