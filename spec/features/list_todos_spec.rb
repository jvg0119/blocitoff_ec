require 'rails_helper'

feature "Viewing the TODO list" do 
	xscenario "shows the TODOs" do
		visit todos_path 
	end

end


 
