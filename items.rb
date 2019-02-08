class Items
  def showItem
    items_hash = { Coke: '$8', Milk: '$2', Chips: '$3', Choclates: '$9', Juice: '$2', Bread: '$1', Toast: '$5'}
    puts "Price     Item"
    items_hash.each do |key, value|
    puts "#{value}        #{key}"
    end
  end
end
