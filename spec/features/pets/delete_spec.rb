require 'rails_helper'

RSpec.describe "pet delete", type: :feature do
  it "delete pets on the show page" do
    pet_1 = Pet.create(image: "image goes here",
                       name: "Bear",
                       age: 2,
                       sex: "M")
    pet_2 = Pet.create(image: "image goes here",
                      name: "Duke",
                      age: 2,
                      sex: "M")

  visit "/pets/#{pet_1.id}"

  click_button "Delete Pet"

  expect(current_path).to eq("/pets/")

  expect(page).to_not have_content(pet_1.name)
  expect(page).to have_content(pet_2.name)






  end
end

# Then a 'DELETE' request is sent to '/pets/:id',
# the pet is deleted,
# and I am redirected to the pet index page where I no longer see this pet
