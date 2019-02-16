require_relative 'item.rb'
require_relative 'lineitem.rb'
require_relative 'inititem.rb'
require_relative 'cart.rb'
require_relative 'dbconn.rb'
# This is class Home
class Home
  @@items = Inititem.new
  @@cart = Cart.new

  def show_main_menu
    puts '1. Display all Items'
    puts '2. Display Cart'
    puts '3. Place an Order'
    puts '0. Exit'
  end

  def show_cart_menu
    puts '1. Add item to Cart'
    puts '0. Exit'
  end

  def menu
    loop do
      show_main_menu()
      puts 'Enter choice : '
      choice = gets.chomp.to_i
      case choice
      when 1
        @@items.show_init_Item
        show_cart_menu()
        puts 'Enter choice'
        inner_choice()
      when 2
        @@cart.check_cart
      when 3
        @@cart.place_order
      when 0
        exit(0)
      else
        puts 'Wrong input'
      end
      break if choice == '0'
    end
  end

  def inner_choice
    choice = gets.chomp.to_i
    case choice
    when 1
      @@items.check_item
    else
      puts 'Wrong input'
    end
  end
end
