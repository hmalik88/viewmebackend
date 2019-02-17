class Api::V1::FavoritesController < ApplicationController
skip_before_action :authorized, only: [:create, :destroy]

  def create
    @content = Content.find_by(id: favorites_params[:content_id])
    @url = url_for(@content.clip)
    @favorite = Favorite.create(content_id: favorites_params[:content_id], user_id: favorites_params[:user_id], name: favorites_params[:name], url: @url)
    if @favorite.valid?
      render json: {favorite: @favorite}, status: :created
    else
      render json: {error: 'failed to create favorite'}, status: :not_acceptable
    end
  end

  def destroy
    @favorite = Favorite.find_by(id: favorites_params[:favorite_id])
    @favorite.destroy
    render json: {favorite: @favorite}
  end

  private

  def favorites_params
    params.require(:favorite).permit(:content_id, :user_id, :name, :favorite_id)
  end

end
