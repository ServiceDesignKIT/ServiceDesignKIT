require "rails_helper"

# test for creating post/method
RSpec.describe "Creating Post" do 
	# create user with parameters in capybara syntax
	let(:user) { create(:user)}
	scenario "successfully" do 
		login user
		visit root_path
		click_on "Submit a technique"

		fill_in "Title", with: "My first method"
		fill_in "Body", with: "Content"
		click_on "Submit"

		# uncomment for launchy no js, css
		#save_and_open_page

		# expect is in posts
		within(".posts") do 
		expect(page).to have_content "My first method"
		expect(page).to have_content user.username
		end
	end


	scenario "unsucessfully" do 
		login user
		visit root_path
		click_on "Submit a technique"

		fill_in "Title", with: "My second method"
		fill_in "Body", with: ""
		click_on "Submit"
		expect(page).to have_css ".error"
	end

	scenario "non-logged in user can't create post" do 
			visit root_path
			click_on "Submit a technique"

			expect(current_path).to eq(new_user_session_path)
	end



end
