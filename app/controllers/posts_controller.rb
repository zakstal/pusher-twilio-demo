class PostsController < ApplicationController

  def index
    @posts = Post.order("id DESC").all
    render :index
  end

  def create
    post = Post.create!(params[:post])

    push_post(post)

    if request.xhr?
      head :created
    else
      redirect_to root_url
    end
  end

end