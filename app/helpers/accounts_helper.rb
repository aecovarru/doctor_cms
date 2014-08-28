module AccountsHelper
	def account_status_tag(string, options={})
		options[:true_text] ||= ''
		options[:false_text] ||= ''

		if string == "Green"
			content_tag(:span, options[:true_text], :class => 'status green')
		elsif string == "Red"
			content_tag(:span, options[:false_text], :class => 'status red')
		elsif string == "Blue"
			content_tag(:span, options[:false_text], :class => 'status blue')
		elsif string == "Yellow"
			content_tag(:span, options[:false_text], :class => 'status yellow')
		elsif string == "Purple"
			content_tag(:span, options[:false_text], :class => 'status purple')
		elsif string == "Orange"
			content_tag(:span, options[:false_text], :class => 'status orange')
		elsif string == "Black"
			content_tag(:span, options[:false_text], :class => 'status black')
		end
	end
end
