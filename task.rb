print("--------------------Welcome to Feel Free to Eat-----------------------\n")
puts "\n"

items_hash = { Coke: '$ 4', Milk: '$ 2', Chips: '$ 1', Choclates: '$ 5', Juice: '$ 2.5', Bread: '$ 1.5', Toast: '$ 0.5'}
len_hash = items_hash.length
puts("1. Show list of items.")
puts("2. Add items to your basket.")
puts("3. Check out items.")
puts("4. Exit")
puts "\n"
puts("Please select your choice to continue : ")
choice = gets.chomp.to_i
case choice
when 1
  # for i to 1..len_hash
  puts("Items                    Price")
  items_hash.each do |key, value|
  puts "#{key}                    #{value}"
  end
when 2
  puts("Generate your bill")
when 3

when 4
  exit(0)
end
