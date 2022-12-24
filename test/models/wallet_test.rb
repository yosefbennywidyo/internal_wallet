require "test_helper"

class WalletTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @user_wallet = @user.build_wallet

    @team = teams(:one)
    @team_wallet = @team.build_wallet

    @stock = stocks(:one)
    @stock_wallet = @stock.build_wallet
  end
  
  test 'valid user wallet created' do
    assert @user_wallet.balance, 0.0
  end

  test 'valid team wallet created' do
    assert @team_wallet.balance, 0.0
  end

  test 'valid stock wallet created' do
    assert @stock_wallet.balance, 0.0
  end
end
