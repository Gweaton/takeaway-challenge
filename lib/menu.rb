class Menu
  attr_reader :list, :basket
  def initialize
    @list = {
      bacon_sandwich: 4,
      scrambled_eggs: 5,
      poached_eggs: 4,
      toast: 1
    }
    @basket = Hash.new(0)
  end

  def add_to_basket(item, number = 1)
    fail "Item not on the menu" unless on_menu?(item)
    self.basket[item] = ["Quantity: #{number}, Total price: #{total(number, self.list[item.to_sym])}"]
  end

  private
  def on_menu?(item)
    self.list.include?(item.to_sym)
  end

  def total(quantity, item)
    quantity * item
  end


end
