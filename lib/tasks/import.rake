namespace :import do

	task :test => :environment do
		puts Time.now.strftime("%B %d, %Y")
	end

end