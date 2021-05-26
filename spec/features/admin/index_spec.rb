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
  end
end