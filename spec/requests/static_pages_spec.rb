require 'spec_helper' 

describe "Static pages" do
	describe "Home page" do
		
		it "should have the h1 'Sample App'" do
			visit root_path
			page.should have_selector('h1', :text => 'Sample App')
		end

		it "should have the base title" do 
			visit root_path 
			page.should have_selector('title', :text => "Ruby on Rails Tutorial Video App")
		end

		it "should not have a custom page title" do
			visit root_path
			page.should_not have_selector('title', :text => '| Home')
		end
	end
end