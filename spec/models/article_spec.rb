require 'rails_helper'

RSpec.describe Article, :type => :model do
  let(:user){FactoryGirl.build(:user)}
  describe "article" do
    it "add to user" do
      @article = user.articles.new(:title => 'sample')
      @article.save
      expect(user.articles.size).to eq(1)
      user.destroy
      expect(Article.all.size).to eq(0)
    end
    
    it "delete with user" do
      user.destroy
      expect(Article.all.size).to eq(0)
    end
  end
end
