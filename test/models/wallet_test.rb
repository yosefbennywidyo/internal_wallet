require "test_helper"

class WalletTest < ActiveSupport::TestCase
  def setup
    @user = users(:first_user)
    @user_wallet = @user.build_wallet

    @team = teams(:first_team)
    @team_wallet = @team.build_wallet

    @stock = stocks(:first_stock)
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
