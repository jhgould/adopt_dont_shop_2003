require 'rails_helper'

RSpec.describe "pets create", type: :feature do
  it "test that pets can be created" do

    shelter_1 = Shelter.create(name: "shelter_1",
                               address: "123 something lane",
                               city: "Denver",
                               state: "CO",
                               zip: 12345)
    # shelter_2 = Shelter.create(name: "shelter_2",
    #                           address: "123 something lane",
    #                           city: "Denver",
    #                           state: "CO",
    #                           zip: 12345)


    visit "/shelters/#{shelter_1.id}/pets"
    click_link "Create Pet"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

    fill_in "image", with: "Image Here"
    fill_in "name", with: "Bear"
    # fill_in :description, with: "Description"
    fill_in "age", with: 2
    fill_in "sex", with: "male"

    click_button "Create Pet"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content("Bear")
  end
end
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed
