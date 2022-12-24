require "test_helper"

class CreditTest < ActiveSupport::TestCase
  def setup
    @first_user   = User.create!(
      email: 'user_20@test.com',
      name: 'User 20'
    )

    @second_user   = User.create!(
      email: 'user_30@test.com',
      name: 'User 30'
    )

    @first_debit = Debit.create!(
      owner_id: @first_user.code,
      sender_id: @first_user.wallet.address,
      receiver_id: @first_user.wallet.address,
      description: 'Top Up',
      amount: 1000
    )

    @second_debit = Credit.create!(
      owner_id: @first_user.code,
      sender_id: @first_user.wallet.address,
      receiver_id: @second_user.wallet.address,
      description: 'Transfer',
      amount: 100
    )
  end
  
  test 'User able to do Credit transaction' do
    assert_equal 900, @first_user.wallet.reload.balance
  end

  test 'User able to do receive transfer transaction' do
    assert_equal 100, @second_user.wallet.reload.balance
  end
end
