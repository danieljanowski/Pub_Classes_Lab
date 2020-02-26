require_relative("drink")
require_relative("customer")

require("pry")

class Pub

attr_reader :name, :till
attr_accessor :stock

  def initialize(name, till, stock)
    @name = name
    @till = till
    @stock = stock
  end

  def check_drunkeness_and_age(customer)
    if customer.drunkeness >= 7 && customer.age < 18
      return false
    end
    return true
  end

  def customer_buys_drink(customer, drink_name)
    if check_drunkeness_and_age(customer)
      if @stock.keys.any?{|drink| drink==drink_name}
        drink= @stock[drink_name].shift()
        customer.buy_drink(drink)
        @till+=drink.price
      end
    else
      p "service is denied"
    end
  end



end
