class ApplicationController < ActionController::Base
  protect_from_forgery

  def push_post(post)
    post_partial = render_to_string(partial: "posts/post", locals: {post: post})
    Pusher["posts"].trigger("new", post_partial)
  end

  def send_text(receiver, body)
    twilio = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
    twilio.account.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: receiver,
      body: body)
  end

end

