class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def new
  end

  def show
    @shelters = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.create({
              name: params[:shelter][:name],
              address: params[:shelter][:address],
              city: params[:shelter][:city],
              state: params[:shelter][:state],
              zip: params[:shelter][:zip]
      })

      shelter.save
      redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update({
              name: params[:shelter][:name],
              address: params[:shelter][:address],
              city: params[:shelter][:city],
              state: params[:shelter][:state],
              zip: params[:shelter][:zip]
      })
    shelter.save
    redirect_to "/shelters/#{shelter.id}"
  end


end
