require_relative 'item.rb'
# This is class LineItem
class LineItem
  attr_accessor :items, :quantity
  def initialize(items, quantity)
    @items = items
    @quantity = quantity
  end
end
