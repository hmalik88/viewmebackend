class FavoritesController < ApplicationController
skip_before_action :authorized, only: [:create, :destroy]

  def create
  end

  def destroy
  end

end
