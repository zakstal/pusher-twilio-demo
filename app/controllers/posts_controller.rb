class PostsController < ApplicationController

  def index
    @posts = Post.order("id DESC").all
    render :index
  end

  def create
    post = Post.create!(params[:post])
    redirect_to root_url
  end

end