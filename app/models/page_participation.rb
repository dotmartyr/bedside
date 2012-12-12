class PageParticipation < ActiveRecord::Base
  attr_accessible :page_id, :user_id, :permission_level
  belongs_to :page
  belongs_to :user

  module PermissionLevel
    OWNER = "owner"
    FOLLOWER = "follower"
    PATIENT = "patient"
  end

  def name
    return nil unless self.user_id
    self.user.name
  end

  def email
    return nil unless self.user_id
    self.user.email
  end

end
