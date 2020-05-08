require 'rails_helper'

RSpec.describe "pets index", type: :feature do
  it "show all the pets" do
    shelter_1 = Shelter.create(name: "shelter_1",
                               address: "123 something lane",
                               city: "Denver",
                               state: "CO",
                               zip: 12345)
    pet_1 = Pet.create(image: "image goes here",
                       name: "Bear",
                       age: 2,
                       sex: "M",
                       shelter: shelter_1.id)

  visit '/pets'

  expect(page).to have_content(pet_1.name)


  end
end
