require_relative 'item.rb'
require_relative 'lineitem.rb'
require_relative 'cart.rb'
require_relative 'dbconn.rb'

class Inititem

  def showInitItem
    begin
      results = Connection.conn.query("SELECT * from items")
      puts 'Id        Price        Stock        Name'
      results.each do |row|
        puts row["id"].to_s + "        " + row["price"].to_s +  "           " + row["stock"].to_s +  "            " + row["name"]
      end
      results.free
    rescue
      Connection.conn.close
    end
  end

  def add_item(id, name, price, quantity)
    begin
      statement = Connection.conn.prepare("INSERT INTO cart (item_id, item_name, item_price, item_quantity) VALUES (?, ?, ?, ?)")
      statement.execute(id, name, price, quantity)
      statement.close
    ensure
      Connection.conn.close
    end
  end

  def cart_exist_item(input_id, id, name, price, quantity)
    puts "id exist: " + name
    begin
      statement = Connection.conn.prepare("SELECT * from cart where item_id IN (?) ")
      result3 = statement.execute(input_id)
      results3.each do |row|
        puts row["item_name"]
      end
    rescue
      Connection.conn.close
    end
  end

  def stock_check(input_id, id, name, price, quantity)
    puts "id : " + input_id.to_s
    begin
      statement = Connection.conn.prepare("SELECT stock from items where id IN (?) ")
      result2 = statement.execute(input_id)
      result2.each do |cs|
        if cs["stock"] >= quantity
          puts "id inside condition: " + name
          cart_exist_item(input_id, id, name, price, quantity)
        else
          puts 'Not in stock'
        end
      end
    rescue
      Connection.conn.close
    end
  end

  def checkItem
    begin
      puts 'Enter id : '
      input_id = gets.chomp.to_i
      statement = Connection.conn.prepare("SELECT * from items where id IN (?) ")
      result1 = statement.execute(input_id)
      result1.each do |c|
        if c["id"] == input_id
          puts 'Item found'
          puts c["id"].to_s + "        " + c["price"].to_s +  "           " + c["stock"].to_s +  "            " + c["name"]
          puts 'Enter quantity : '
          quantity = gets.chomp.to_i
          stock_check(input_id, c["id"], c["name"], c["price"], quantity)
        else
          puts 'Item not found'
        end
      end
    rescue
      Connection.conn.close
    end
  end

end
