class Wish < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :claimed_by, :page_id, :title, :claimed 
  belongs_to :user, :foreign_key => 'claimed_by'
  belongs_to :page
end
