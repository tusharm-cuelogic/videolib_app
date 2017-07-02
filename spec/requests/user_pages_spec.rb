require 'spec_helper'

describe User do
	subject {page}
	
	describe "signup page" do 
		before {visit new_user_registration_path}
		it {should have_selector('title', text: full_title('Sign up'))}
		it {should have_selector('h2', text: 'Sign up')}
	end

	describe "signup" do
		before {visit new_user_registration_path}
		let(:submit) {"Sign up"}

		describe "with invalid information" do 
			it "should not create a user" do
				expect {click_button submit}.not_to change(User, :count) 
			end
		end

		describe "with valid information" do 
			before do
				fill_in "Email",		with: "user@example.com"
				fill_in "Password",		with: "foobar"
				fill_in "Password confirmation", with: "foobar"
			end
			it "should create a user" do
				expect { click_button submit }.to_change(User, :count).by(1)
			end 
		end

		describe "signin" do
			before {visit new_user_session_path}
			describe "with invalid information" do
				before {click_button "Sign in"}
				it {should have_selector('title', text: 'Sign in')}
				it {should have_selector('div.alert', text: 'Invalid')} 
			end
		end
	end

	describe "profile page" do
		let(:user) {FactoryGirl.create(:user)} 
		before {visit user_path(user)}
		it {should have_selector('h1', text: user.first_name+ " " + user.last_name)}
		it {should have_selector('title', text: user.first_name + " " + user.last_name)} 
	end
end