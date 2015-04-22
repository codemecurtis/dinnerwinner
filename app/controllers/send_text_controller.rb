class SendTextController < ApplicationController
  def index
  end

  def send_text_message
    number_to_send_to = "+15105898966"

    account_sid = "ACdc0df8cf20642a410470834aef5ae75e"
    auth_token = "b235c398c62605637c9e76907dc3e5c5"
    twilio_phone_number = "15109721904"

    @twilio_client = Twilio::REST::Client.new(account_sid, auth_token)

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "This is an message. It gets sent to #{number_to_send_to}"
    )
  end
end

# def notify
#     @customer = current_customer
#     @client = Twilio::REST::Client.new(account_sid, auth_token)

#     @message = @client.messages.create(:body => "First test", :to => '+15105898966', :from => '+15109721904')

#     render plain: @message.status
#   end