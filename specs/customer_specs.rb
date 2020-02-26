require ('minitest/autorun')
require ('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')
require_relative('../drink')


class CustomerTest < MiniTest::Test

  def setup()
    @customer1= Customer.new("David", 50, 25)
    @drink1= Drink.new("Elvis Juice", 6, 2)
  end

  def test_customer_name()
    assert_equal("David", @customer1.name)
  end

  def test_wallet()
    assert_equal(50, @customer1.wallet)
  end

  def test_age()
    assert_equal(25, @customer1.age)
  end

  def test_drunkeness()
    assert_equal(0, @customer1.drunkeness)
  end

  def test_buy_drink()
    @customer1.buy_drink(@drink1)
    assert_equal(44, @customer1.wallet)
    assert_equal(2, @customer1.drunkeness)
  end

end
