class Api::V1::ContentController < ApplicationController

  def create
    @content = Content.create(content_params)
    render json: {@content}
  end

  def delete
    @content = Content.find_by(id: content_params[:id])
    @content.destroy
    render json: {@content}
  end

  def index
    render json: Content.includes(:users), include: ['users']
  end

  private

  def content_params
    params.require(:content).permit(:id)
  end

end
