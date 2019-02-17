class Api::V1::ContentController < ApplicationController
skip_before_action :authorized, only: [:create, :index, :show, :update]

  def create
    @content = Content.create(content_params)
    @content.clip.attach(content_params[:clip])
    @url = url_for(@content.clip)
    @content.update(url: @url)
    render json: {name: @content.name, url: @url}
  end

  def destroy
    @content = Content.find_by(id: params[:id])
    @content.clip.purge
    @content.destroy
    render json: {content: @content}
  end

  def update
    @content = Content.find_by(id: params[:id])
    @content.update(name: content_params[:name], channel: content_params[:channel])
    render json: {content: @content}
  end

  def index
    render json: Content.includes(:users), include: ['users']
  end

  def show
    @content = Content.find_by(id: params[:id])
    render json: {content: ContentSerializer.new(@content)}, status: :accepted
  end

  private

  def content_params
    # byebug
    params.permit(:user_id, :name, :channel, :clip)
  end

end
