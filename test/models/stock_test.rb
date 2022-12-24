require "test_helper"

class StockTest < ActiveSupport::TestCase
  def setup
    @stock = stocks(:first_stock)
  end

  test 'valid stock' do
    assert @stock.valid?
  end

  test 'invalid without name' do
    @stock.name = nil
    refute @stock.valid?, 'saved stock without a name'
    assert_not_nil @stock.errors[:name], 'no validation error for name present'
  end

  test 'invalid without email' do
    @stock.email = nil
    refute @stock.valid?, 'saved stock without a name'
    assert_not_nil @stock.errors[:email]
  end
end
