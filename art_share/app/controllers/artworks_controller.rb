class ArtworksController < ApplicationController
  def create
    artwork = Artwork.new(user_params)
    
    if artwork.save
      render json: artwork, status: 201
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end
  
  def destroy
    artwork = Artwork.find(params[:id])
    
    return render json: artwork.errors.full_messages, status: 404 unless artwork
    artwork.destroy
    render json: artwork
  end
  
  def index
    render json: Artwork.all
  end
  
  def show
    artwork = Artwork.find(params[:id])
  
    if artwork
      render json: artwork, status: 200
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end
  
  def update
    artwork = Artwork.find(params[:id])
    return render json: artwork.errors.full_messages, status: 404 unless artwork
    
    if artwork.update(user_params)
      p "successful update"
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end
  
  private
  
  def user_params
    params.require(:artwork).permit(:title, :image_url)
  end
end