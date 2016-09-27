namespace :notification do
  desc "sends SMS notification to employes them to log if they had overtime"
  task sms: :environment do
    # schedule to run at a given time (heroku)
    # iterate over all employees
    # skip adminusers
    # send a message that has instructions and a link to log time
    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end
  end

  desc "sends email notification to managers (admin users) each day to inform of pending overtime requests"
  task manager_email: :environment do
    # iterate over the list of pending overtime requests
    # check to see if there are any reuqests
    # iterate over the list of admin users
    # send the email to each admin
    submitted_posts = Post.submitted
    admin_user = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
    end
  end
end
