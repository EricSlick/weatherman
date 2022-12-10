# require 'rails_helper'
#
# RSpec.describe "Locations Management" do
#   before do
#     driven_by(:selenium_chrome_headless)
#   end
#
#   it "enables me to create locations" do
#     visit "/locations/new"
#
#     fill_in "Location", :with => "Chicago, IL"
#     click_button "Create Location"
#
#     expect(page).to have_text("Location was successfully created.")
#   end
#
# end