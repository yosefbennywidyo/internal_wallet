require "test_helper"

class TeamTest < ActiveSupport::TestCase
  def setup
    @team = teams(:first_team)
  end

  test 'valid team' do
    assert @team.valid?
  end

  test 'invalid without name' do
    @team.name = nil
    refute @team.valid?, 'saved team without a name'
    assert_not_nil @team.errors[:name], 'no validation error for name present'
  end

  test 'invalid without email' do
    @team.email = nil
    refute @team.valid?, 'saved team without a name'
    assert_not_nil @team.errors[:email]
  end
end
