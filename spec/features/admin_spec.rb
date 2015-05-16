require 'rails_helper'

RSpec.describe "Admin aspects", :type => :feature do
  let(:admin){FactoryGirl.create(:admin)}
  describe "admin sign in" do
    before(:each) do
       visit  admin_path
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button "Sign in"
    end
    
    it "redirect to admin dashboard" do 
      expect(page).to have_selector("h2", :text => "admin index")
    end
  end
end    