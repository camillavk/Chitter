require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature "User signs up" do 

	scenario "when logged out" do 
		expect{ sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, Sam")
		expect(User.first.email).to eq("sam@example.com")
	end

	scenario "with a password that doesn't match" do 
		expect{ sign_up("Sam", "s@s.com", "pass", "wrong") }.to change(User, :count).by(0)
		expect(current_path).to eq('/users')
		expect(page).to have_content("Sorry, your passwords don't match")
	end


end