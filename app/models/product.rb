class Product < ActiveRecord::Base

	validates :name, presence: true
	validates :description, presence: true
	validates :price_in_cents, numericality: {only_integer: true}


	def format_price
		price_in_dollars = "$" + price_in_cents.to_s[0..-3] +"."+ price_in_cents.to_s[-2..-1]
	end
end
