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
              description: params[:description],
              age: params[:age],
              sex: params[:sex],
              adoption_status: params[:adoption_status],
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

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets/'
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

  def shelter_name
    name = ""
    @pets.each do |pet|
      @shelters.each do |shelter|
        if pet[:shelter_id] == shelter[:id]
          name = shelter[:name]
        end
      end
    end
    name
  end

end
