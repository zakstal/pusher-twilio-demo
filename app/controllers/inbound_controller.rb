class InboundController < ApplicationController

  def twilio
    post = Post.create!(
            sender: params["From"],
            body: params["Body"])

    push_post(post)
    send_text(post.sender, "Thank you for your cat sighting! Have a nice day!")

    head :created
  end

end