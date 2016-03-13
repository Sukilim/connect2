class RequestsController < ApplicationController
 before_action :set_request, only: [:edit, :update, :destroy]

  def index
  end

	def create
	@request = Request.new(request_params.merge(user_id: current_user.id))
		
    if @request.save
      respond_to do |format|
       format.html { redirect_to user_path(current_user.id), notice: 'Request was successfully created.' }
      end
    else
      flash[:notice] = "Please let us know more details"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
     if @request.update(request_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @request.destroy
    redirect_to user_path(current_user.id)
  end

	private

  def request_params
    params.require(:request).permit(:area_id, :location_id, :budget_min, :budget_max, :rent_sale, :pet_friendly, :sq_ft, :furnished, :no_of_rooms, :no_of_carpark, :house_condo, :date_needed, :special_req)
  end

  def set_request
    @request = Request.find_by(user_id: current_user.id)
  end

end