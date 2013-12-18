class ApplicationController < ActionController::Base
  protect_from_forgery


  def push_post(post)
    post_partial = render_to_string(partial: "posts/post", locals: {post: post})
    Pusher["posts"].trigger("new", post_partial)
  end


end

