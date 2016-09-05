module SmsTool
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']

  @client = Twilio::REST::Client.new(account_sid, auth_token)

  def self.send_sms(number:, message:)
    @client.messages.create(
      from: Rails.application.secrets.twilio_phone,
      to: "+1#{number}",
      body: "#{message}"
    )
  end
end