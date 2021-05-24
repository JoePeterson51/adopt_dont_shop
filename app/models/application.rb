class Application < ApplicationRecord
  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, numericality: true
  has_many :application_pets
  has_many :pets, through: :application_pets

  def add_pet(application, pet)
    if application.pets.exists?(pet.id)
      return nil
    else
      application.pets << pet
    end
  end
end