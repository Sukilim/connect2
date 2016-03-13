require 'rails_helper'

RSpec.describe Request, type: :model do

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:area) }
    it { is_expected.to belong_to(:location) }
  end
end