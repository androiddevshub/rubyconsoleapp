require_relative "items.rb"
require_relative "order.rb"

class Index
  def view_items
    items = Items.new
    items.showItem
  end
  def order_items
    order = Order.new
    order.order_item
  end
end

index = Index.new

puts("--------------------Welcome to Feel Free to Eat-----------------------\n")

puts("1. Show list of items.")
puts("2. Add items to your basket.")
puts("3. Check out items.")
puts("4. Exit")
puts "\n"
puts("Please select your choice to continue : ")
choice = gets.chomp.to_i
case choice
when 1
  index.view_items
when 2
  index.order_items
when 3
  puts("Generate your bill")
when 4
  exit(0)
end
