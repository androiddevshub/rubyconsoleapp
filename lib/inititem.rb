require_relative 'item.rb'
require_relative 'lineitem.rb'
require_relative 'cart.rb'
require_relative 'dbconn.rb'
# This is class Inititem
class Inititem
  def show_init_Item
    begin
      results = Connection.conn.query('SELECT * from items')
      puts 'Id        Price        Stock        Name'
      results.each do |row|
        puts row['id'].to_s + "        " + row['price'].to_s +  "           " + row['stock'].to_s +  "            " + row['name']
      end
      results.free
    rescue TypeError => e
      puts e.message.to_s
      puts e.backtrace.inspect.to_s
    end
  end

  def add_item(id, name, price, quantity)
    begin
      statement = Connection.conn.prepare('INSERT INTO cart (item_id, item_name, item_price, item_quantity) VALUES (?, ?, ?, ?)')
      statement.execute(id, name, price, quantity)
      statement.close
    rescue TypeError => e
      puts e.message.to_s
      puts e.backtrace.inspect.to_s
    end
  end

  def cart_exist_item(input_id, id, name, price, quantity)
    begin
      statement = Connection.conn.prepare('SELECT EXISTS(SELECT * FROM cart WHERE item_id = (?))')
      result3 = statement.execute(input_id)
      query = 'EXISTS(SELECT * FROM cart WHERE item_id = (?))'
      # puts "Exist = >" + result3.to_s
      result3.each do |row|
        if row[query] == 1
          puts 'Already in cart'
        else
          puts 'Added to cart'
          add_item(id, name, price, quantity)
        end
      end
    rescue TypeError => e
      puts e.message.to_s
      puts e.backtrace.inspect.to_s
      Connection.conn.close
    end
  end

  def stock_check(input_id, id, name, price, quantity)
    begin
      statement = Connection.conn.prepare('SELECT stock from items where id IN (?)')
      result2 = statement.execute(input_id)
      result2.each do |cs|
        if cs['stock'] >= quantity
          cart_exist_item(input_id, id, name, price, quantity)
        else
          puts 'Not in stock'
        end
      end
    rescue TypeError => e
      puts e.message.to_s
      puts e.backtrace.inspect.to_s
    end
  end

  def check_item
    begin
      puts 'Enter id : '
      input_id = gets.chomp.to_i
      query = 'EXISTS(SELECT * FROM items WHERE id = (?))'
      statement = Connection.conn.prepare('SELECT ' + query)
      result1 = statement.execute(input_id)
      result1.each do |c|
        if c[query] == 1
          puts 'Item found'
          statement = Connection.conn.prepare('SELECT * FROM items WHERE id = (?)')
          result6 = statement.execute(input_id)
          result6.each do |c|
            puts c['id'].to_s + "        " + c['price'].to_s +  "           " + c['stock'].to_s +  "            " + c['name']
            puts 'Enter quantity : '
            quantity = gets.chomp.to_i
            stock_check(input_id, c['id'], c['name'], c['price'], quantity)
          end
        else
          puts 'Item not found'
        end
      end
    rescue TypeError => e
      puts e.message.to_s
      puts e.backtrace.inspect.to_s
    end
  end
end
