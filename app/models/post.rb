class Post < ActiveRecord::Base
  acts_as_commentable

  attr_accessible :user_id, :page_id, :body

  belongs_to :user
  belongs_to :page
end
