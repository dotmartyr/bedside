class Visit < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :user_id, :page_id, :start_time
  belongs_to :user
  belongs_to :page

end
