class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def new
  end

  def create
    application = Application.create!(application_params)
    redirect_to "/applications/#{application.id}"
  end

  def update
    application = Application.find(params[:id])
    pet = Pet.find(params[:pet_id])
    application.add_pet(application, pet)
    redirect_to "/applications/#{application.id}"
  end

  def show
    if params[:search].present?
      @application = Application.find(params[:id])
      @pets = Pet.search(params[:search])
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