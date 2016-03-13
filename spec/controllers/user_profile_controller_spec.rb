require 'rails_helper'

RSpec.describe UserProfileController, type: :controller do

	let(:valid_attributes) {
	    skip("Add a hash of attributes valid for your model")
	  }

	let(:invalid_attributes) {
	    skip("Add a hash of attributes invalid for your model")
	  }

  describe "POST create" do
    context "with VALID user profile attributes" do
      it "saves the user profile to the database" do
        expect {
          post :create, user_profile: attributes_for(:user_profile)
        }
      end
    end

    context "with INVALID user profile attributes" do
      it "does not save the user profile to the database" do
        expect {
          post :create, user_profile: attributes_for(:user_profile, :invalid_user)
        }
      end

      it "redirects to :back" do
        expect {
          post :create, user_profile: attributes_for(:user_profile, :invalid_user)
          expect(response).to eq "where_user_came_from"
        }
      end
    end
  end

  describe "POST update" do
    context "with VALID user attributes" do
      it "updates user profile to the database" do
        expect {
          post :update, user_profile: attributes_for(:user_profile)
        }
      end
    end

    context "with INVALID user profile attributes" do
      it "does not save the user to the database" do
        expect {
          post :update, user_profile: attributes_for(:user_profile, :invalid_user)
        }
      end

      it "redirects to :back" do
        expect {
          post :update, user_profile: attributes_for(:user_profile, :invalid_user)
          expect(response).to eq "where_user_came_from"
        }
      end
    end
  end

end
