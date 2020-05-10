class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def shelter_pets_index
    @pets = Pet.all
    @shelter = Shelter.find(params[:shelter_id])
    # @pets = Pet.all
    @shelter_pets = pet_shelter_match
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    shelter = params[:shelter_id]
    pet = Pet.create({
              image: params[:image],
              name: params[:name],
              age: params[:age],
              sex: params[:sex],
              shelter_id: shelter
      })

    pet.save
    redirect_to "/shelters/#{shelter}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({
              image: params[:image],
              name: params[:name],
              age: params[:age],
              sex: params[:sex]})
  pet.save
  redirect_to "/pets/#{pet.id}"

  end


  private

  def pet_shelter_match
    shelter_pets = []
      @pets.each do |pet|
        if @shelter.id == pet.shelter_id
          shelter_pets << pet
        end
      end
    shelter_pets
  end

  def pet_params
    params.permit(:image, :name, :age, :sex)
  end

end