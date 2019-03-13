class Api::V1::ContentController < ApplicationController
skip_before_action :authorized, only: [:create, :index, :show, :update]

  def create
    @content = Content.new(content_params)
    if @content.valid?
      @content.save
      @content.clip.attach(content_params[:clip])
      @url = url_for(@content.clip)
      @content.update(url: @url)
      render json: {name: @content.name, url: @url}
    else
      render json: {message: 'Must enter a name'}, status: :unauthorized
    end

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
    @all_content = []
    Content.all.each do |content|
      @all_content.push({id: content.id, name: content.name, url: content.url, user: content.user.e_mail, channel: content.channel})
    end
    render json: @all_content
  end

  def show
    @content = Content.find_by(id: params[:id])
    render json: {content: ContentSerializer.new(@content), user: @content.user}, status: :accepted
  end

  private

  def content_params
    # byebug
    params.permit(:user_id, :name, :channel, :clip)
  end

end
