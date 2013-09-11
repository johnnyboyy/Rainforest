class Product < ActiveRecord::Base
	has_many :reviews


	validates :name, presence: true,
									uniqueness: true
	validates :description, presence: true
	validates :price_in_cents, numericality: {only_integer: true}

	has_attached_file :image, default_url: "/images/missing.jpg"


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
