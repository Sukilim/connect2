RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    authorize_user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Request' do
    object_label_method do
      :area_name
      :location_name
    end
    list do
      field :user_id
      field :area_name
      field :location_name
      field :budget_min
      field :budget_max
      field :pet_friendly
      field :furnished
      field :no_of_rooms
      field :no_of_carpark
      field :date_needed
      field :special_req
      field :sq_ft
      field :rent_sale
      field :house_condo
    end
    create do
      field :user_id
      field :area_name
      field :location_name
      field :budget_min
      field :budget_max
      field :pet_friendly
      field :furnished
      field :no_of_rooms
      field :no_of_carpark
      field :date_needed
      field :special_req
      field :sq_ft
      field :rent_sale
      field :house_condo
    end
    edit do
      field :user_id
      field :area_name
      field :location_name
      field :budget_min
      field :budget_max
      field :pet_friendly
      field :furnished
      field :no_of_rooms
      field :no_of_carpark
      field :date_needed
      field :special_req
      field :sq_ft
      field :rent_sale
      field :house_condo
    end
  end

  config.model 'User' do
    list do 
      field :email
      field :role
      field :status
      field :crypted_password
    end
    create do
      field :email
      field :role
      field :status
      field :password
      field :password_confirmation
    end
    edit do
      field :email
      field :role
      field :status
      field :password
      field :password_confirmation
    end
  end

  config.model 'Listing' do
    #object_label_method do
    #  :area_name
    #  :location_name
    #end
    list do
      field :user_id
      field :area_id
      field :location_id
      field :rent_sale
      field :house_condo
      field :date_available
      field :unit_no
      field :price
      field :sq_ft
      field :no_of_rooms
      field :no_of_baths
      field :no_of_carpark
      field :pet_friendly
      field :additional_info
      field :status
    end
    create do
      field :user_id
      field :area_id
      field :location_id
      field :rent_sale
      field :house_condo
      field :date_available
      field :unit_no
      field :price
      field :sq_ft
      field :no_of_rooms
      field :no_of_baths
      field :no_of_carpark
      field :pet_friendly
      field :additional_info
      field :status
    end
    edit do
      field :user_id
      field :area_id
      field :location_id
      field :rent_sale
      field :house_condo
      field :date_available
      field :unit_no
      field :price
      field :sq_ft
      field :no_of_rooms
      field :no_of_baths
      field :no_of_carpark
      field :pet_friendly
      field :additional_info
      field :status
    end
  end

  config.model 'Area' do
    list do
      field :area
    end
    create do
      field :area
    end
    edit do
      field :area
    end
  end

  config.model 'Location' do
    object_label_method do
      :area_name
    end
    list do
      field :area_id
      field :location
    end
    create do
      field :area_id
      field :location
    end
    edit do
      field :area_id
      field :location
    end 
  end

  config.model 'AdminListing' do
    list do
      field :id 
      field :area
      field :location
      field :sq_ft
      field :avatar
    end
    create do
      field :area
      field :location
      field :sq_ft
      field :avatar
    end
    edit do
      field :area
      field :location
      field :sq_ft
      field :avatar
    end
  end
end
