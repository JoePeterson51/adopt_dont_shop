require 'rails_helper'

RSpec.describe Admin do
  describe "#index" do
    it 'shows all shelters' do
      shelter_1 = Shelter.create!(foster_program: true, name: "Adopt em all!", city: "Denver", rank: 5)
      shelter_2 = Shelter.create!(foster_program: true, name: "Dogs Dogs Dogs", city: "Denver", rank: 7)
      shelter_3 = Shelter.create!(foster_program: true, name: "Cats Cats Cats", city: "Boulder", rank: 3)

      visit '/admin/shelters'

      expect(page).to have_content("Adopt em all!")
      expect(page).to have_content("Dogs Dogs Dogs")
      expect(page).to have_content("Cats Cats Cats")
    end

    it 'shows all shelters with pending applications' do
      shelter_1 = Shelter.create!(foster_program: true, name: "Adopt em all!", city: "Denver", rank: 5)
      shelter_2 = Shelter.create!(foster_program: true, name: "Dogs Dogs Dogs", city: "Denver", rank: 7)
      pet_1 = shelter_1.pets.create!(adoptable: true, age: 3, breed: "mutt", name: "Sparky")
      pet_2 = shelter_2.pets.create!(adoptable: true, age: 4, breed: "Beagle", name: "Professor Snuggles")
      application_1 = Application.create!(name: 'Jim', street_address: '123 Car dr.', city: 'Denver', state: 'CO', zip_code: 22222, application_status: 'Pending')
      application_1.pets << pet_1

      visit '/admin/shelters'

      within('#pending-apps') do
        expect(page).to have_content("Adopt em all!")
        expect(page).to_not have_content("Dogs Dogs Dogs")
      end
    end
  end
end