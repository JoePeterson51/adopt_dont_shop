class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def new
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:alert] = "Must Fill out all fields"
      render :new
    end
  end

  def update
    application = Application.find(params[:id])
    if params[:pet_id].present?
      pet = Pet.find(params[:pet_id])
      application.add_pet(application, pet)
      redirect_to "/applications/#{application.id}"
    end
    if params[:qualities].present?
      application.update(application_params)
      redirect_to "/applications/#{application.id}"
    end
  end

  def show
    if params[:search].present?
      @application = Application.find(params[:id])
      @pets = Pet.partial_search(params)
    else
      @application = Application.find(params[:id])
      @pets = []
    end
  end

private
  def application_params
    params.permit(:name, :street_address, :city, :state, :zip_code, :applicant_qualitys, :pet_names, :application_status)
  end
end