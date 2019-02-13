require_relative "item.rb"
require_relative "lineitem.rb"
require_relative "inititem.rb"
require_relative 'cart.rb'
$items = Inititem.new
$cart = Cart.new
# This is class Index
class Index

  def showMenu
    puts ("1. Display all Items")
    puts ("2. Display Cart")
    puts ("3. Place an Order")
    puts ("0. Exit")
  end

  def showCartMenu
    puts ("1. Add item to Cart")
    puts ("0. Exit")
  end

  def menu
    loop do
      showMenu()
      puts 'Enter choice : '
      choice = gets.chomp.to_i
      case choice
      when 1
        $items.showInitItem
        showCartMenu
        puts 'Enter choice'
        innerchoice()
      when 2
        $cart.show_line_item
      when 3
        $cart.cart_total
      when 0
        exit(0)
        break
      else
        puts 'Wrong input'
      end
      break if choice == 'q'
    end
  end

  def innerchoice
    choice = gets.chomp.to_i
    case choice
    when 1
      $items.checkItem
    else
      puts 'Wrong input'
    end
  end
end

index = Index.new

puts('--------------------Welcome to Feel Free to Eat-----------------------')
puts('')
index.menu
