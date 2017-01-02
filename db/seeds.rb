# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


joe = User.new(name: "Joe", email: "joe@example.com", password: "password")
joe.save
mike = User.new(name: "Mike", email: "mike@example.com", password: "password")
mike.save
tina = User.new(name: "Tina", email: "tina@example.com", password: "password")
tina.save

users = User.all

1.upto 20 do |x|
	user = users.sample
	date =  Time.now - rand(1..10).days
#	todo = user.todos.new(description: "Todo task #{x} for #{user}.")
	todo = Todo.new(description: "Todo task #{x} for #{user.name}.", user: user, created_at: date)

	todo.save!
end

puts "*".center(40,"*")
puts
puts "seeding done".center(40)
puts "#{User.count} users created".center(40)
puts "#{Todo.count} todos created".center(40)
puts
puts "*".center(40,"*")


