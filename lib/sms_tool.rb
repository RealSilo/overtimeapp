module SmsTool
  def self.send_sms(number:, message:)
    puts "Sending message"
    puts "#{message} to #{number}"
  end
end