require "test_helper"

class DebitTest < ActiveSupport::TestCase
  def setup
    @first_user   = User.create!(
      email: 'user_10@test.com',
      name: 'User 10'
    )

    @first_team   = Team.create!(
      email: 'team_10@test.com',
      name: 'Team 10'
    )

    @first_stock  = Stock.create!(
      email: 'stock_10@test.com',
      name: 'Stock 10'
    )

    @first_debit = Debit.create!(
      owner_id: @first_user.code,
      sender_id: @first_user.wallet.address,
      receiver_id: @first_user.wallet.address,
      description: 'Top up',
      amount: 1000
    )

    @second_debit = Debit.create!(
      owner_id: @first_team.code,
      sender_id: @first_team.wallet.address,
      receiver_id: @first_team.wallet.address,
      description: 'Top up',
      amount: 1000
    )

    @third_debit = Debit.create!(
      owner_id: @first_stock.code,
      sender_id: @first_stock.wallet.address,
      receiver_id: @first_stock.wallet.address,
      description: 'Top up',
      amount: 1000
    )
  end
  
  test 'User able to Topup' do
    assert_equal 1000, @first_user.wallet.reload.balance
  end

  test 'Team able to Topup' do
    assert_equal 1000, @first_team.wallet.reload.balance
  end

  test 'Stock able to Topup' do
    assert_equal 1000, @first_stock.wallet.reload.balance
  end
end
