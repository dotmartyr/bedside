class User < ActiveRecord::Base
  rolify
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :async, :invitable,:database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  has_many :page_participations
  has_many :pages, :through => :page_participations, :autosave => true
  has_many :posts
  has_many :visits
  has_many :wishes, :foreign_key => 'claimed_by'
  has_many :comments
  
end
