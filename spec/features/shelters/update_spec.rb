require 'rails_helper'

RSpec.describe "Update Shelters", type: :feature do
  it "I can update a shelters info" do
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

    click_link 'Update Shelter'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    fill_in 'shelter[name]', with: 'New shelter'
    fill_in 'shelter[address]', with: 'some random adress'
    fill_in 'shelter[city]', with: 'Greenville'
    fill_in 'shelter[state]', with: 'SC'
    fill_in 'shelter[zip]', with: '56678'

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    expect(page).to have_content('New shelter')

  end
end


# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info
