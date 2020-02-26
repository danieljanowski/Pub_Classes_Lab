require('pry-byebug')

require_relative("drink")
require_relative("food")

class Customer

  attr_reader :name
  attr_accessor :wallet, :drunkeness, :age

  def initialize(name, wallet, age, drunkeness=0)
    @name= name
    @wallet= wallet
    @age = age
    @drunkeness= drunkeness
  end

  def buy_drink(drink)
    @wallet-= drink.price
    @drunkeness+= drink.alcohol_level
  end

  def eat_food(food)
    @wallet-= food.price
    @drunkeness-= food.rejuvenation_level
  end
end
