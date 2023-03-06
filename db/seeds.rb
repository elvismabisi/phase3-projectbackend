puts "🌱 Seeding data..."

# Make 5 users
5.times do
  User.create(
    name: Faker::Internet.username,
    email: "#{Faker::Internet.username}@gmail.com",
    password: Faker::Internet.password(min_length: 8),
    image: Faker::Avatar.image
    )
end

# Make 10 projects
10.times do
  # create a projects with random data
project = Project.create(
    name: Faker::ProgrammingLanguage.name,
    description: Faker::Lorem.sentence,
    author: Faker::Name.name, 
    status:['On Hold', 'Ready to start', 'Working on it', 'Completed'].sample,
    date: Faker::Date.backward(days: 14)
  )
  
  # create between 1 and 5 members for each project
  rand(1..5).times do
    # get a random user for every member
    # https://stackoverflow.com/a/25577054
    user = User.order('RANDOM()').first

    # A member belongs to a project and a user, so we must provide those foreign keys
    Member.create(
      name: Faker::Name.name,
      email: "#{Faker::Internet.username}@gmail.com",
      user: user,
      project: project,
      image: Faker::Avatar.image
    )
  end
end

puts "🌱 Done seeding!"