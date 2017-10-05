
namespace :todo do

	my final setup
	desc "Delete todos after 7 days."
	task :delete_todos => :environment do
		puts Todo.where('created_at <= ?', Time.now - 7.days).delete_all
	end

	# my test setup; using shorter time frame
	# desc "Delete todos after 5 minutes."
	# task :delete_todos => :environment do
	# 	puts Todo.where('created_at <= ?', Time.now - 5.minutes ).delete_all
	# 	 		# Todo.where('created_at <= ?', Time.now - 5.minutes ) # same as above
	# end

	# go to schdule.rb    to run whenever to automate this task 

end
