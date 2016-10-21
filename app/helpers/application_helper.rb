module ApplicationHelper
	def to_money(cents)
	  ("<span class='dollar_amount'>" + Money.new(cents,"USD").format + "</span>").html_safe
	end
end
