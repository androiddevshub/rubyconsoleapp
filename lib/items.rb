# This is class Items
class Items
  def show_item
    item_id = %w[FFE12 FFE21 FFE35 FFE54 FFE04 FFE14 FFE09 FFE11]
    item_name = %w[Juice Maggie Milk Choclates Chips Coke Bread Rusk]
    item_price = [8, 3, 1, 4, 5, 5, 3, 2]
    item_stock = [6, 5, 7, 8, 9, 4, 0, 2]
    # items_hash = { Coke: '$8', Milk: '$2', Chips: '$3', Choclates: '$9',
    #                Juice: '$2', Bread: '$1', Toast: '$5' }
    # puts item_id[0]
    # puts item_name[0]
    # puts item_price[0]
    # puts item_stock[0]
    # puts 'S.No.  ItemId  ItemStock  ItemPrice  Item'
    for i in 0..item_id.length-1
      puts "#{i+1}  #{item_id[i]}  #{item_stock[i]}  #{item_price[i]}  #{item_name[i]}"
    end


    # puts 'Price  Item'
    # items_hash.each do |key, value|
    #   puts "#{value}  #{key}"
    # end
  end
end
