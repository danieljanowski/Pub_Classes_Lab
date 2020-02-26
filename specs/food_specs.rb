require ('minitest/autorun')
require ('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require("pry-byebug")

require_relative("../food")
require_relative("../customer")

class FoodTest< MiniTest::Test

  def setup()
    @customer1= Customer.new("David", 50, 25, 8)
    @food1= Food.new("Kebab", 10, 3)
  end

  def test_eating_food
    @customer1.eat_food(@food1)
    assert_equal(5, @customer1.drunkeness)
    assert_equal(40, @customer1.wallet)
  end


end
