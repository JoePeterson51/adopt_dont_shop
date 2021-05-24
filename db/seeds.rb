shelter = Shelter.create!(foster_program: true, name: "Adopt em all!", city: "Denver", rank: 5)
shelter.pets.create!(adoptable: true, age: 3, breed: "mutt", name: "Sparky")
shelter.pets.create!(adoptable: true, age: 4, breed: "Beagle", name: "Professor Snuggles")
shelter.pets.create!(adoptable: true, age: 2, breed: "Lab", name: "Howard")