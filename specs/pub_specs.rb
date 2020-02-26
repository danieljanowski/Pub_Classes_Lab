require ('minitest/autorun')
require ('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require("pry-byebug")

require_relative('../customer')
require_relative('../drink')
require_relative('../pub')


class PubTest < MiniTest::Test

  def setup()
    @customer1= Customer.new("David", 50, 19)
    @drink1 = Drink.new("Duff Beer", 5, 1)
    @drink1a = @drink1.clone()
    @drink1b = @drink1.clone()

    @drink2= Drink.new("Bloody Mary", 10, 3)
    @drink2a = @drink2.clone()
    @drink2b = @drink2.clone()
    @drink2c= @drink2.clone()

    @drink3= Drink.new("Elvis Juice", 6, 2)
    @drink3a = @drink3.clone()
    @drink3b = @drink3.clone()
    @drink3c= @drink3.clone()


    @stock= {@drink1.name => [@drink1, @drink1a,@drink1b], @drink2.name => [@drink2, @drink2a, @drink2b, @drink2c], @drink3.name => [@drink3, @drink3a, @drink3b, @drink3c] }
    @pub1 = Pub.new("Under the Dog", 1000, @stock)

    #binding.pry()
  end

  def test_pub_name
    assert_equal("Under the Dog", @pub1.name)
  end

  def test_pub_till
    assert_equal(1000, @pub1.till)
  end

  def test_customer_buys_drink()
    @pub1.customer_buys_drink(@customer1, @drink2.name)
    assert_equal(1010, @pub1.till)
    assert_equal(3, @stock[@drink2.name].size())
    assert_equal(3, @customer1.drunkeness)
  end

  def test_customer_drunk_tries_to_buy_drink
    @pub1.customer_buys_drink(@customer1, @drink1.name)
    assert_equal(2, @stock[@drink1.name].size())
    @pub1.customer_buys_drink(@customer1, @drink2.name)
    assert_equal(3, @stock[@drink2.name].size())
    @pub1.customer_buys_drink(@customer1, @drink2.name)
    assert_equal(2, @stock[@drink2.name].size())
    @pub1.customer_buys_drink(@customer1, @drink2.name)
    result = @pub1.check_drunkeness(@customer1)
    assert_equal(2, @stock[@drink2.name].size())
    assert_equal(false, result)
  end

end
