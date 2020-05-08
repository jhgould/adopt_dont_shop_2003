class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def shelter_pets_index
    @shelter = Shelter.find(params[:shelter_id])
    @pets = Pet.all
    @shelter_pets = pet_shelter_match
  end

  def show
    @pet = Pet.find(params[:id])
  end


  private

  def pet_shelter_match
    shelter_pets = []
      @pets.each do |pet|
        if @shelter.id == pet.shelter.to_i
          shelter_pets << pet
        end
      end
    shelter_pets
  end

end
