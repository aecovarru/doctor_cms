namespace :import do

	task :test => :environment do
		puts Time.zone.now.strftime("%m/%d/%y")
	end

end