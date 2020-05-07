require 'rails_helper'

RSpec.describe "shelters can be created", type: :feature do
  it "test it can create a shelter" do

    visit '/shelters'

    click_link "New Shelter"

    expect(current_path).to eq('/shelters/new')

    fill_in 'shelter[name]', with: "New Shelter"
    fill_in 'shelter[address]', with: "New Address"
    fill_in 'shelter[city]', with: "New City"
    fill_in 'shelter[state]', with: "New State"
    fill_in 'shelter[zip]', with: 12344

    click_button "Create Shelter"

    expect(current_path).to eq('/shelters')

    expect(page).to have_content("New Shelter")














  end
end


# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.
