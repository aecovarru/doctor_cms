namespace :import do

	task :test => :environment do
		require 'nokogiri'
		require 'open-uri'
	end

end