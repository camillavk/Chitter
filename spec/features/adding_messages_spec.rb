require 'spec_helper'

feature "User adds a link" do 
	before(:each) do 
		User.create(:name => "Sam",
								:username => 'samsam',
								:email => "sam@example.com",
								:password => "cat",
								:password_confirmation => "cat")
	end

	scenario "when browsing the homepage" do 
		expect(Message.count).to eq(0)
		visit '/'
		add_message("example", "testing")
		expect(Message.count).to eq(1)
		message = Message.first
		expect(message.title).to eq("example")
	end

	def add_message(title, text)
		visit 'messages/new'
		fill_in 'title', :with => title
		fill_in 'text', :with => text
		click_button "Add message"
	end

end