
namespace :print do
	
	desc "say hello"
	task :hello do 
		puts "This task says hello"
	end

	desc "This task prints users"
	task users: :environment do 
		User.all.each do |u|
			puts u.name
			puts u.email
		end
	end

	desc "This task prints todos"
	task :todos => :environment do 
		Todo.all.each do |t|
			puts t.description
			puts t.days_left
		end
	end

	desc "OK"
	task :all => [:todos, :users]

	desc "good" 
	task :all1 => [:todos, :users] do 
		u = User.first
		t = Todo.first
		puts "#{u} did #{t}"
	end
end

