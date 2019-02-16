# This is class Cart
require_relative "item.rb"
require_relative "lineitem.rb"
require_relative "inititem.rb"
require_relative 'dbconn.rb'
class Cart
  attr_accessor :line_items
  def initialize
    @line_items = []
  end

  def show_line_item
    begin
      results = Connection.conn.query("SELECT * from cart")
      puts 'Id        Price        Quantity        Name'
      results.each do |row|
        puts row["item_id"].to_s + "        " + row["item_price"].to_s +  "           " + row["item_quantity"].to_s +  "               " + row["item_name"]
      end
      results.free
    rescue
      Connection.conn.close
    end
  end

  def cart_total
    total = 0
    @line_items.each do |c|
      total += c.items.price * c.quantity
    end
    puts "Total : " + total.to_s
    puts ''
    puts 'Enter your name'
    uname = gets.chomp
    puts 'Enter your address'
    uadd = gets.chomp
    puts '-------------------------------------------------------------------------'
    puts '|                              Invoice                                   |'
    puts '| Name : '+ uname + '                                   Date : 17.02.2019|'
    puts '| Address : '+ uadd + '                                                        |'
    puts '|                                                                        |'
    puts '|                                                                        |'
    puts '|                                                                        |'
    puts '|                                                                        |'
    puts "| Item Id.\t Item price\t Quantity\t Item Name             |"
    @line_items.each do |c|
      puts "| #{c.items.id}\t\t #{c.items.price}\t\t #{c.quantity}\t\t #{c.items.name}                   |"
    end
    puts '|                                                                        |'
    puts '|                                                                        |'
    puts '|                                                                        |'
    puts '|                                                                        |'
    puts "| Total : " + total.to_s + '                                                             |'
    puts '|                                                                        |'
    puts '|                                                                        |'
    puts '--------------------------------------------------------------------------'
  end
end
