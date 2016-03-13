require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  before(:each) do
    request.env["HTTP_REFERER"] = "where_user_came_from"
  end

  describe "POST create" do
    context "with VALID user attributes" do
      it "saves the user to the database" do
        expect {
          post :create, user: attributes_for(:user)
        }
      end

      it "redirects to new_user_profile path" do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to new_user_profile_path 
      end
    end

    context "with INVALID user attributes" do
      it "does not save the user to the database" do
        expect {
          post :create, user: attributes_for(:user, :invalid_user)
        }
      end

      it "redirects to :back" do
        expect {
          post :create, user: attributes_for(:user, :invalid_user)
          expect(response).to eq "where_user_came_from"
        }
      end
    end
  end

  describe "POST update" do
    context "with VALID user attributes" do
      it "updates user to the database" do
        expect {
          post :update, user: attributes_for(:user)
        }
      end
    end

    context "with INVALID user attributes" do
      it "does not save the user to the database" do
        expect {
          post :update, user: attributes_for(:user, :invalid_user)
        }
      end

      it "redirects to :back" do
        expect {
          post :update, user: attributes_for(:user, :invalid_user)
          expect(response).to eq "where_user_came_from"
        }
      end
    end
  end

  describe "GET show" do
    it "assigns the request user to @user" do
      user = User.create! valid_attributes
      get :show, {:id => user.to_param}, valid_session
      expect(assign(:user)).to eq(user)
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, {:id => user.to_param}, valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! valid_attributes
      delete :destroy, {:id => user.to_param}, valid_session
      expect(response).to redirect_to(root_path)
    end
  end
end
