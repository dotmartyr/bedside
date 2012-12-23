require 'spec_helper'

describe PostsController do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @page = FactoryGirl.create(:page)
    @page_participation = FactoryGirl.create(:page_participation, page_id: @page.id, user_id: @user.id)
  end

  describe "POST create" do
    before do
      mock_login @user
      post :create, page_id: @page.id, :post => {body: 'I am a test', user_id: @user.id}
    end

    it "should create a post" do
      Post.last.body.should == 'I am a test'
    end

    it "should create a post with user as @user" do
      Post.last.user_id.should == @user.id
    end
  end
end
