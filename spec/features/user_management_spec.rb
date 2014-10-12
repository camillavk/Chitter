require 'spec_helper'

feature "User signs up" do 

	scenario "when logged out" do 
		expect{ sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, Sam")
		expect(User.first.email).to eq("sam@example.com")
	end

	def sign_up(name = "Sam",
							email = "sam@example.com",
							password = "cat",
							password_confirmation = "cat")
		visit '/users/new'
		fill_in :name, :with => name
		fill_in :email, :with => email
		fill_in :password, :with => password
		fill_in :password_confirmation, :with => password_confirmation
		click_button "Sign up"
	end

end