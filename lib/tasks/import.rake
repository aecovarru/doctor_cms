namespace :import do

	task :test => :environment do
		puts Time.now.strftime("%B %d, %Y")
		Account.create(:name => "Alan")
		Note.create(:account_id => 1, :date => Time.now.strftime("%B %d, %Y"))
	end

end