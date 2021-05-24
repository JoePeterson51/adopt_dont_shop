require 'rails_helper'

RSpec.describe Application do
  describe '#show' do
    it "shows the application and all it's attributes" do
      application = Application.create!(
        name: "John",
        street_address: "123 clarkson ln.",
        city: "Denver",
        state: "Colorado",
        zip_code: "80003",
        applicant_qualitys: "Loves dogs",
        application_status: "In Progress")

      visit "applications/#{application.id}"

      expect(page).to have_content("John")
      expect(page).to have_content("123 clarkson ln.")
      expect(page).to have_content("Denver")
      expect(page).to have_content("Colorado")
      expect(page).to have_content("80003")
      expect(page).to have_content("Loves dogs")
      expect(page).to have_content("In Progress")
    end

    it 'can search for pets by name' do
      shelter = Shelter.create!(foster_program: true, name: "Adopt em all!", city: "Denver", rank: 5)
      shelter.pets.create!(adoptable: true, age: 3, breed: "mutt", name: "Sparky")
      application = Application.create!(
        name: "John",
        street_address: "123 clarkson ln.",
        city: "Denver",
        state: "Colorado",
        zip_code: "80003",
        applicant_qualitys: "Loves dogs",
        application_status: "In Progress")

      visit "applications/#{application.id}"

      expect(page).to_not have_content("Sparky")

      fill_in 'search', with: "Sparky"
      click_button "Search"

      expect(page).to have_content("Sparky")
    end
  end
end

