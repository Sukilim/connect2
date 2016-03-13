class User < ActiveRecord::Base

  authenticates_with_sorcery!
  
  has_one :agent_profile, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_one :user_profile, dependent: :destroy

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  accepts_nested_attributes_for :user_profile

  validates :password, length: { minimum: 8 }, if: :password
  validates :password, confirmation: true, if: :password
  validates :password_confirmation, presence: true, if: :password

  enum role: [:user, :agent, :admin]
  enum status: [:active, :inactive]
  
  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return user if user 
    false
  end

  def generate_auth_token
    payload = { user_id: id }
    AuthTokenService.encode(payload)
  end
end

