class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def notify
    @client = Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']

    @message = @client.messages.create(:body => "First test", :to => '+15105898966', :from => '+15109721904')

    render plain: @message.status
  end

end
