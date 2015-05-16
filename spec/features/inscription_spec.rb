require 'rails_helper'

RSpec.describe "inscription process", :type => :feature do
  let(:user){FactoryGirl.create(:user)}

  describe "sign in page" do
    before {visit new_user_registration_path}
    context "with invalid data" do
      it "doesn't succeed" do
        click_button 'Sign up'
        expect(page).to have_selector('div#error_explanation',:text => 'prohibited')
      end
    end
    context "with valid data" do
      it "succeed and go to profile" do
       fill_in 'Name', with: user.name       
       fill_in 'Email', with: "test2@test.com"
       fill_in 'Password', with: "12345678"
       fill_in 'Password confirmation', with: "12345678"
       click_button "Sign up"
       expect(page).to have_content("You have signed up successfully")
      end
    end
  end

  describe "profile page" do
    before(:each) do
      visit  new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button "Sign in"
    end
    it "sign in" do
      expect(page).to have_content("Signed in successfully")
    end
    it "access profile page" do
      click_link 'Profile'
      expect(page).to have_selector("h2", :text => "Profile")
    end
  end  

end

