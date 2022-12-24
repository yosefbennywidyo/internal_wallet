require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @first_user = users(:first_user)
    @first_user_wallet = @first_user.wallet
    @user_without_name = users(:first_invalid_user)
    @user_without_email = users(:second_invalid_user)
  end

  test 'valid user' do
    assert @first_user.valid?
    assert_equal true, @first_user_wallet.present?
  end

  test 'invalid without name' do
    assert_equal @user_without_name.valid?, false
    assert_equal @user_without_name.errors[:name], ["can't be blank"]
    assert_equal false, @user_without_name.wallet.present?
  end

  test 'invalid without email' do
    assert_equal @user_without_email.valid?, false
    assert_equal @user_without_email.errors[:email], ["can't be blank"]
    assert_equal false, @user_without_email.wallet.present?
  end
end
