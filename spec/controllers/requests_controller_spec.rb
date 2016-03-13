require 'rails_helper'

RSpec.describe RequestsController, type: :controller do

let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

	describe "POST #create" do
    context "with valid params" do
      it "creates a new request" do
        expect {
          post :create, {:request => valid_attributes}, valid_session
        }
      end

      it "redirects to user dashboard" do
        post :create, {:request => valid_attributes}, valid_session
        expect(response).to redirect_to user_path(current_user.id)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved request" do
        post :create, {:request => invalid_attributes}, valid_session
        expect(assigns(:request)).to be_a_new(Request)
      end

      it "re-renders the 'new' template" do
        post :create, {:request => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

	describe "POST #update" do
  	context "with a valid params" do
  		it "saves an updated request" do
  			expect {
  				post :update, {:request => valid_attributes}, valid_session
  			}
  		end

	  	it "redirects to user dashboard" do
				post :update, {:request => valid_attributes}, valid_session
	      expect(response).to redirect_to user_path(current_user.id)
	  	end
	  end

	  context "with invalid params" do
      it "assigns a newly created but unsaved request" do
        post :update, {:request => invalid_attributes}, valid_session
        expect(assigns(:request)).to be_a_edit(Request)
      end

      it "re-renders the 'new' template" do
        post :update, {:request => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end 

  describe "DELETE destroy" do
    it "destroys the request" do
      user = Request.create! valid_attributes
      expect {
        delete :destroy, {:id => user.to_param}
      }.to change(Request, :count).by(-1)
    end

    it "redirects to the users profile" do
      user = Request.create! valid_attributes
      delete :destroy, {:id => user.to_param}
      expect(response).to redirect_to user_path(current_user.id)
    end
  end

end

