class Application < ApplicationRecord
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