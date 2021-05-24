require "rails_helper"

RSpec.describe Application, type: :model do
  describe "relationships" do
    it { should have_many :application_pets}
    it { should have_many(:pets).through(:application_pets)}
  end

  describe '#add_pet' do
    it 'can add pets to an application' do
      shelter = Shelter.create!(foster_program: true, name: "Adopt em all!", city: "Denver", rank: 5)
      pet = shelter.pets.create!(adoptable: true, age: 3, breed: "mutt", name: "Sparky")
      application = Application.create!(
        name: "John",
        street_address: "123 clarkson ln.",
        city: "Denver",
        state: "Colorado",
        zip_code: "80003",
        applicant_qualitys: "Loves dogs",
        application_status: "In Progress")

      application.add_pet(application, pet)

      expect(application.pets.first).to eq(pet)

      application.add_pet(application, pet)

      expect(application.pets.count).to eq(1)
    end
  end
end
