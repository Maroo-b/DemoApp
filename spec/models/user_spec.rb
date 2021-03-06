require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user){FactoryGirl.build(:user)}
  it "must have a name " do
    user.name = ""
    expect(user).to_not be_valid
  end

  
  it "have a unique email" do
    FactoryGirl.create(:user,email: "sample@sample.com")
    expect(FactoryGirl.build(:user,email: "sample@sample.com")).to_not be_valid
  end
end  
