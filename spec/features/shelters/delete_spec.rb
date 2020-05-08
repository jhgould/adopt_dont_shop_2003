require 'rails_helper'

RSpec.describe "User can delete a shelter", type: :feature do
  it "can delete an existing shelter" do
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

  visit 'shelters'
  expect(page).to have_content(shelter_1.name)

  # visit "shelters/#{shelter_1.id}"
  # expect(page).to have_content(shelter_1.name)
  # expect(page).to have_content(shelter_1.address)
  # expect(page).to have_content(shelter_1.city)

  visit "shelters/#{shelter_1.id}"
  click_on "Delete Shelter"


  expect(current_path).to eq('/shelters')
  expect(page).to_not have_content("shelter_1")


  end
end


# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter
