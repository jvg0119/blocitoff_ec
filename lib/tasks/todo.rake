
namespace :todo do 

	desc "Delete todos after 7 days."
	task :delete_todos => :environment do 
		puts Todo.where('created_at <= ?', Time.now - 7.days).delete_all
	end


end

