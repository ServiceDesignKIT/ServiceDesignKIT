#testfile
#add configuraiton file
require "rails_helper"

#capybara syntax
RSpec.feature "User visits homepage" do
	scenario "successfully and sees a logo" do 
		visit root_path
		expect(page).to have_content "Designapp"
	end
end
