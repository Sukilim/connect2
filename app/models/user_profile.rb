class UserProfile < ActiveRecord::Base
  belongs_to :user
  
  mount_uploader :avatar, AvatarUploader

  validates_uniqueness_of :contact_no
  validates :contact_no, presence: true
  validates :first_name, presence: true
end
