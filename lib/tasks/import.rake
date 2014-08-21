namespace :import do

	task :test => :environment do
		puts Time.zone.now.strftime("%B %d, %Y")
	end

end