namespace :notification do
  desc "send SMS notification to employes them to log if they had overtime"
  task sms: :environment do
    # schedule to run at a given time (heroku)
    # iterate over all employees
    # skip adminusers
    # send a message that has instructions and a link to log time
    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end
  end
end
