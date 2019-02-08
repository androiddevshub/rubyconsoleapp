class Order
  def order_item
    array_item = []
    puts("Add items to your basket")
    putitems = gets.chomp.to_s
    array_item.push(putitems)
    puts array_item.to_s
  end
end
