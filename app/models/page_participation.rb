class PageParticipation < ActiveRecord::Base
  attr_accessible :page_id, :user_id, :permission_level
  belongs_to :page
  belongs_to :user
end
