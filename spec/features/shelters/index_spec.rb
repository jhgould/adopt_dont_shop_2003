require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can see all shelters" do
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

  visit "/shelters"

  expect(page).to have_content(shelter_1.name)
  expect(page).to have_content(shelter_2.name)
  end
end
