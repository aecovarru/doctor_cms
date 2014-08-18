module AccountsHelper
	def account_status_tag(string, options={})
		options[:true_text] ||= ''
		options[:false_text] ||= ''

		if string == "Active"
			content_tag(:span, options[:true_text], :class => 'status green')
		elsif string == "Hot"
			content_tag(:span, options[:false_text], :class => 'status red')
		elsif string == "No Contact Yet"
			content_tag(:span, options[:false_text], :class => 'status blue')
		end
	end
end
