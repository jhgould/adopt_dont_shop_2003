require 'rails_helper'

RSpec.describe "pet update", type: :feature do
  it "update pets info" do
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

  click_link "Update Pet"

  expect(current_path).to eq("/pets/#{pet_1.id}/edit")

  fill_in "image", with: "New Image Here"
  fill_in "name", with: "Bear Dawg"
  # fill_in :description, with: "Description"
  fill_in "age", with: 3
  fill_in "sex", with: "male"

  click_button "Update Pet"

  expect(current_path).to eq("/pets/#{pet_1.id}")

  expect(page).to have_content("Bear Dawg")
 end
end
