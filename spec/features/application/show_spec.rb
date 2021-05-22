require 'rails_helper'

RSpec.describe 'the application show' do
  it "shows the application and all it's attributes" do
    shelter = Shelter.create!(foster_program: true, name: "Adopt em all!", city: "Denver", rank: 5)
    sparky = shelter.pets.create!(adoptable: true, age: 3, breed: "Mutt", name: "Sparky")
    application = Application.create!(name: "John", address: "123 clarkson ln.", applicant_qualitys: "Loves dogs", pet_names: "Sparky", application_status: "In Progress")
    app = ApplicationPet.create!(pet: sparky, application: application)

    visit "applications/#{application.id}"

    expect(page).to have_content("John")
    expect(page).to have_content("123 clarkson ln.")
    expect(page).to have_content("Loves dogs")
    expect(page).to have_content("Sparky")
    expect(page).to have_content("In Progress")
  end
end

