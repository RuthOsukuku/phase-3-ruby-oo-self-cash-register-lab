
class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction = 0
    end
  
    def add_item(title, price, quantity = 1)
      self.total += price * quantity
      quantity.times { self.items << title }
      self.last_transaction = price * quantity
    end
  
    def apply_discount
      if self.discount > 0
        discount_amount = (self.total * self.discount) / 100
        self.total -= discount_amount
        "After the discount, the total comes to $#{self.total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      self.total -= self.last_transaction
    end
  end

  register = CashRegister.new(20)
register.total # => 0
register.discount # => 20

register.add_item("Apple", 0.99)
register.total # => 0.99
register.items # => ["Apple"]

register.add_item("Orange", 1.5, 2)
register.total # => 3.99
register.items # => ["Apple", "Orange", "Orange"]

register.apply_discount # => "After the discount, the total comes to $3.19"
register.total # => 3.19

register.void_last_transaction
register.total # => 0.99
register.items # => ["Apple"]
