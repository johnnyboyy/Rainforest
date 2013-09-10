class Product < ActiveRecord::Base

	validates :name, :description, presence: true,
																uniqueness: true
	validates :price_in_cents, numericality: {only_integer: true}


	def format_price
		if price_in_cents < 10
			price_in_dollars = "$0.0" + price_in_cents.to_s
		elsif price_in_cents < 100
			price_in_dollars = "$0." + price_in_cents.to_s
		else
			price_in_dollars = "$" + price_in_cents.to_s[0..-3] +"."+ price_in_cents.to_s[-2..-1]
		end
	end
end
