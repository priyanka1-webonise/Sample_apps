


namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Priyanka",
                         email: "ukirde.priyanka@weboniselab.com",
                         password: "priyanka",
                         password_confirmation: "priyanka")
    admin.toggle!(:admin)
    9.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    9.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end



  end
end












