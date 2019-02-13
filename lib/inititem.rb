require_relative "item.rb"
require_relative "lineitem.rb"
require_relative "cart.rb"

class Inititem

  @@input_id = 0
  @@item_quan = 0
  @@items = [Item.new(45, "Juice", 30, 5), Item.new(52, "Chocalate", 40, 3), Item.new(55, "Coke", 60, 4),
            Item.new(23, "Chips", 20, 0), Item.new(71, "Maggie", 15, 8), Item.new(34, "Cookies", 45, 2)]

  def showInitItem
    puts "Item Id.\t Item price\t Item in Stock\t Item Name"
    @@items.each do |c|
      puts "#{c.id}\t\t #{c.price}\t\t #{c.stock}\t\t #{c.name}"
    end
  end

  def add_item
    @@items.each do |c|
      if @@input_id == c.id
        cart = Cart.new
        cart.line_items << LineItem.new(Item.new(c.id, c.name, c.price, c.stock), @@item_quan)
      end
    end
  end

  def checkItem
    puts "Enter id : "
    @@input_id = gets.chomp.to_i
    item_ids = @@items.map(&:id)
    if (item_ids.include?(@@input_id))
      puts "Enter quantity of item"
      @@item_quan = gets.chomp.to_i
      item_stock = @@items.map(&:stock)
      if (item_stock.any? { |i| i  >= @@item_quan})
        add_item()
      else
        puts 'Out of Stock'
      end
    else
      puts "Item Id not found"
    end
  end
end

# inititem = Inititem.new
# inititem.showInitItem
# # inititem.checkItem
