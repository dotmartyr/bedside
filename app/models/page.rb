class Page < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :hospital, :room, :tips, :overview, :visiting_hours, :patient_name
  has_many :page_participations
  has_many :users, :through => :page_participations, :autosave => true
  has_many :posts
  has_many :visits
  has_many :wishes

  def can_edit?(user)
    pp = user.page_participations.find_by_page_id(self.id)

    !pp.nil? && (pp.permission_level == PageParticipation::PermissionLevel::OWNER || pp.permission_level == PageParticipation::PermissionLevel::PATIENT)
  end

end
