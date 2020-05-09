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

  visit "/shelters/#{shelter_1.id}/pets"

  expect(page).to have_content(pet_1.name)
  expect(page).to_not have_content(pet_2.name)

  visit "/shelters/#{shelter_2.id}/pets"

  expect(page).to have_content(pet_2.name)
  expect(page).to_not have_content(pet_1.name)

  end
end
