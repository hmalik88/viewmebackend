class Api::V1::ContentController < ApplicationController

  def create
    @content = Content.create(content_params)
    @content.clip.attach(content_params[:clip])
    @url = @content.clip.service_url
    @content.update(url: @url)
    render json: {name: @content.name, url: @url}
  end

  def delete
    @content = Content.find_by(id: content_params[:id])
    @content.destroy
    render json: {content: @content}
  end

  def index
    render json: Content.includes(:users), include: ['users']
  end

  private

  def content_params
    # byebug
    params.permit(:user_id, :name, :channel, :clip)
  end

end
