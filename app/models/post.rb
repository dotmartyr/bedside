class Post < ActiveRecord::Base
  attr_accessible :user_id, :page_id, :body
  
  belongs_to :user
  belongs_to :page
end
