require ('minitest/autorun')
require ('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')

class TestDrink < Minitest::Test

  def setup
    @drink1 = Drink.new("Duff Beer", 5, 1)
  end

  def test_drink_name
    assert_equal("Duff Beer", @drink1.name)
  end

  def  test_price
    assert_equal(5, @drink1.price)
  end

end
