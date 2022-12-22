require "test_helper"

class ClientTest < ActiveSupport::TestCase
  test "Client doesn't have table" do
    assert_nil Client.table_name
  end
end
