require 'rails_helper'

RSpec.describe "shelter pet index", type: :feature do
  it "show all the pets at a givin shelter" do
    shelter_1 = Shelter.create(name: "shelter_1",
                               address: "123 something lane",
                               city: "Denver",
                               state: "CO",
                               zip: 12345)
    shelter_2 = Shelter.create(name: "shelter_2",
                              address: "123 something lane",
                              city: "Denver",
                              state: "CO",
                              zip: 12345)
    pet_1 = Pet.create(image: "image goes here",
                       name: "Bear",
                       age: 2,
                       sex: "M",
                       shelter_id: shelter_1.id)
    pet_2 = Pet.create(image: "image goes here",
                      name: "Duke",
                      age: 2,
                      sex: "M",
                      shelter_id: shelter_2.id)

    visit "/pets/#{pet_1.id}"

    expect(page).to have_content(pet_1.image)
    expect(page).to have_content(pet_1.name)
    # expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    # expect(page).to have_content(pet_1.adoption_status)


  end
end
#     As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status
