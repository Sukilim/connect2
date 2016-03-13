require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
  end

  describe 'associations' do
    it { should have_many(:requests) }
    it { should have_one(:agent_profile) }
    it { should have_one(:profile) }
    it { should have_many(:authentications) }
  end
end



  



