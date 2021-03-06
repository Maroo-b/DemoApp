require 'rails_helper'

RSpec.describe "static page", :type => :feature do

  describe "home page" do
    it "have title and navigations links" do
      visit root_path
     expect(page).to have_selector("h1", :text => "Welcome to PicBook")
      expect(page).to have_link("About")
      expect(page).to have_link("Log in")
      expect(page).to have_link("Sign in")
    end
  end
  
  describe "about page" do
    it "have a about title" do
      visit root_path
      click_link 'About'
      expect(page).to have_selector("h1", :text => "About")
    end
  end
  
  describe "sign in page" do
    it "have sign up title" do
      visit root_path
      click_link 'Sign in'
      expect(page).to have_selector("h2",:text => 'Sign up')
    end
  end




end
