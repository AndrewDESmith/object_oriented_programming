class Product
	attr_accessor :price, :name, :quantity, :item_tax

	def initialize(name, price, quantity)
		@name = name
		@price = price
		@quantity = quantity
	end

	def item_tax
		@price * 1.10
	end
end


class ExemptProduct < Product
	
	def item_tax
		@price	
	end

end


class Hammered < Product

	def item_tax
		@price * 1.15
	end

end

class OnlyDuty < Product

	def item_tax
		@price * 1.05
	end

end

class ShoppingCart

	def initialize(products)
		@products = products
	end

	def total_tax
		@total= 0
		@products.each do |product|
			@total += product.item_tax 
		end
		@total.round(2)
	end

	def just_taxes
		@total = 0
		@products.each do |product|
			@total += (product.item_tax - product.price)
		end
		@total.round(2)
	end

end


book = ExemptProduct.new("Glasshouse", 12.49, 1)
music = Product.new("The Suburbs", 14.99, 1)
chocolate = ExemptProduct.new("Mars Bar", 0.85, 1)

imported_chocolate = OnlyDuty.new("Lindor", 10.00, 1)
imported_perfume = Hammered.new("Eau de Toilette", 47.50, 1)

imported_perfume2 = Hammered.new("Cheap Perfume", 27.99, 1)
perfume = Product.new("Really Cheap Perfume", 18.99, 1)
headache_pills = ExemptProduct.new("Tylenol", 9.75, 1)
imported_chocolate2 = OnlyDuty.new("Nice Chocolate", 11.25, 1)

basket1 = ShoppingCart.new([book, music, chocolate])
puts "Basket 1"
puts "Taxes = " + basket1.just_taxes.to_s
puts "Total = " + basket1.total_tax.to_s

puts ""
basket2 = ShoppingCart.new([imported_chocolate, imported_perfume])
puts "Basket 2"
puts "Taxes = " + basket2.just_taxes.to_s
puts "Total = " + basket2.total_tax.to_s

puts ""
basket3 = ShoppingCart.new([imported_perfume2, perfume, headache_pills, imported_chocolate2])
puts "Basket 3"
puts "Taxes = " + basket3.just_taxes.to_s
puts "Total = " + basket3.total_tax.to_s
