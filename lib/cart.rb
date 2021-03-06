# This is class Cart
require_relative 'item.rb'
require_relative 'lineitem.rb'
require_relative 'inititem.rb'
require_relative 'dbconn.rb'
class Cart
  @@total = 0
  def show_line_item
    begin
      result = Connection.conn.query('SELECT * from cart')
      result.each do |row|
        puts row['item_id'].to_s + '        ' + row['item_price'].to_s +  '           ' + row['item_quantity'].to_s +  '               ' + row['item_name']
        @@total += row['item_quantity'] * row['item_price']
      end
    rescue TypeError => e
      puts e.message.to_s
      puts e.backtrace.inspect.to_s
    end
  end

  def check_cart
    begin
      query = 'EXISTS(SELECT * from cart)'
      statement = Connection.conn.prepare( 'SELECT ' + query)
      result = statement.execute()
      puts 'Id        Price        Quantity        Name'
      result.each do |row|
        if row[query] == 0
          puts 'Cart is empty'
        else
          show_line_item()
        end
      end
      results.free
    rescue
    end
  end

  def empty_cart
    results = Connection.conn.query('DELETE FROM cart')
    puts results.to_s
  end

  def cart_total(order_id)
    begin
      statement = Connection.conn.prepare('SELECT total from order_tbl where order_id IN (?) ')
      result2 = statement.execute(order_id)
      result2.each do |c|
        @@total = c['total']
      end
    rescue TypeError => e      # only for debug purposes, don't rescue Exception in real code
      puts e.message.to_s
      puts e.backtrace.inspect.to_s
    end
  end

  def place_order
    puts 'Enter your name'
    uname = gets.chomp
    puts 'Enter your address'
    uadd = gets.chomp
    order_id = 'ORD'+ rand.to_s[2..7]
    begin
      statement13 = Connection.conn.prepare('INSERT INTO order_tbl VALUES (?, ?, ?, ?)')
      statement13.execute(order_id, uname, uadd, @@total)
      statement13.close
    rescue TypeError => e
      puts e.message.to_s
      puts e.backtrace.inspect.to_s
    end
    puts '-------------------------------------------------------------------------'
    puts '|                              Invoice                                   |'
    puts '| Name : '+ uname + '                                   Date : 17.02.2019|'
    puts '| Address : '+ uadd + "                                 Order Id : " + order_id + '    |'
    puts '|                                                                        |'
    puts '|                                                                        |'
    puts '|                                                                        |'
    puts '|                                                                        |'
    puts "| Item Id.\t Item price\t Quantity\t Item Name                |"
    begin
      results = Connection.conn.query('SELECT * from cart')
      results.each do |row|
        puts "| #{row['item_id']}\t\t #{row['item_price']}\t\t #{row['item_quantity']}\t\t #{row['item_name']}               |"
      end
      results.free
    rescue TypeError => e
      puts e.message.to_s
      puts e.backtrace.inspect.to_s
    end
    puts '|                                                                        |'
    puts '|                                                                        |'
    puts '|                                                                        |'
    puts '|                                                                        |'
    cart_total(order_id)
    puts '| Total : ' + @@total.to_s + '                                                           |'
    puts '|                                                                        |'
    puts '|                                                                        |'
    puts '--------------------------------------------------------------------------'
    empty_cart()
  end
end
