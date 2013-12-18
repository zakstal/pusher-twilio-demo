class InboundController < ApplicationController

  def twilio
    # params["From"]
    # params["To"]
    # params["Body"]

    post = Post.create!(
            sender: params["From"],
            body: params["Body"])

    push_post(post)

    client = Twilio::REST::Client.new(ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"])

    client.account.messages.create(
        :from => ENV["TWILIO_NUMBER"],
        :to => post.sender,
        :body => "Thank you for your cat sighting! Have a nice day!")

    head :created
  end

end