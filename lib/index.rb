require_relative 'inititem.rb'
require_relative 'item.rb'
items = Inititem.new
# This is class Index
class Index

  choice = 0

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
        items = Inititem.new
        items.showInitItem
        showCartMenu
        puts 'Enter choice'
        innerchoice()
        break
      when 2
        puts "Showing..."
        break
      when 3
        puts('Generate your bill')
        break
      when 0
        exit(0)
        break
      else
        puts 'Wrong input'
      end
      break if choice == 0
    end
  end

  def innerchoice
    choice = gets.chomp.to_i
    case choice
    when 1
      items = Inititem.new
      items.checkItem
    else
      puts 'Wrong input'
    end
  end
end

index = Index.new

puts('--------------------Welcome to Feel Free to Eat-----------------------')
puts('')
index.menu
