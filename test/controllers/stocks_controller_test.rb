require "test_helper"

class StocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock = stocks(:one)
  end

  test "should get index" do
    get stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_stock_url
    assert_response :success
  end

  test "should create stock" do
    assert_difference("Stock.count") do
      post stocks_url, params: { stock: { email: 'stock-3@test.com', name: 'Stock-3' } }
    end

    assert_redirected_to stock_url(Stock.last)
  end

  test "should not create stock with empty name" do
    post stocks_url, params: { stock: { email: 'stock-3@test.com', name: nil } }
    assert_response 422
  end

  test "should not create stock with empty email" do
    post stocks_url, params: { stock: { email: nil, name: 'Team-3' } }
    assert_response 422
  end

  test "should show stock" do
    get stock_url(@stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_stock_url(@stock)
    assert_response :success
  end

  test "should update stock" do
    patch stock_url(@stock), params: { stock: { email: 'stock-update@test.com', name: 'stock-update' } }
    assert_redirected_to stock_url(@stock)
  end

  test "should not update stock with empty name" do
    patch stock_url(@stock), params: { stock: { email: 'stock-update@test.com', name: nil } }
    assert_response 422
  end

  test "should not update stock with empty email" do
    patch stock_url(@stock), params: { stock: { email: nil, name: 'stock-update' } }
    assert_response 422
  end

  test "should destroy stock" do
    assert_difference("Stock.count", -1) do
      delete stock_url(@stock)
    end

    assert_redirected_to stocks_url
  end
end