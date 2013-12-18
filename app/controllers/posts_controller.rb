class PostsController < ApplicationController

  def index
    @posts = Post.order("id DESC").all
    render :index
  end

  def create
    post = Post.create!(params[:post])

    post_partial = render_to_string(partial: "posts/post", locals: {post: post})
    Pusher["posts"].trigger("new", post_partial)


    if request.xhr?
      render :nothing
    else
      redirect_to root_url
    end
  end

end