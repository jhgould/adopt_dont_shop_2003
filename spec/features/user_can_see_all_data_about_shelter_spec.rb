require 'rails_helper'

RSpec.describe "shelter info page", type: :feature do
  it "can see all the data on one shelter" do

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


   visit "/shelters/#{shelter_1.id}"

   expect(page).to have_content(shelter_1.name)
   expect(page).to have_content(shelter_1.address)
   expect(page).to have_content(shelter_1.city)
   expect(page).to have_content(shelter_1.state)
   expect(page).to have_content(shelter_1.zip)

  end
end
