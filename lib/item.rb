# This is class Item
class Item
  attr_accessor :id, :name, :price, :stock
  def initialize(id, name, price, stock)
    @id = id
    @name = name
    @price = price
    @stock = stock
  end
end
