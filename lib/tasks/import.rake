namespace :import do

	task :test => :environment do
		account = Account.where(:aff => "Purple")
		account.each do |purple|
			purple.update_attributes(:aff => "Green")
		end
	end

end