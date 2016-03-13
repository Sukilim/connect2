require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:contact_no) }
    it { is_expected.to validate_presence_of(:first_name) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
