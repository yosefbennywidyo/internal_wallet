require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = teams(:first_team)
  end

  test "should get index" do
    get teams_url
    assert_response :success
  end

  test "should get new" do
    get new_team_url
    assert_response :success
  end

  test "should create team" do
    assert_difference("Team.count") do
      post teams_url, params: { team: { email: 'team-3@test.com', name: 'Team-3' } }
    end

    assert_redirected_to team_url(Team.last.code)
  end

  test "should not create team with empty name" do
    post teams_url, params: { team: { email: 'team-3@test.com', name: nil } }
    assert_response 422
  end

  test "should not create team with empty email" do
    post teams_url, params: { team: { email: nil, name: 'Team-3' } }
    assert_response 422
  end

  test "should show team" do
    get team_url(@team.code)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_url(@team.code)
    assert_response :success
  end

  test "should update team" do
    patch team_url(@team.code), params: { team: { email: 'team-update@test.com', name: 'team-update' } }
    assert_redirected_to team_url(@team.code)
  end

  test "should not update team with empty name" do
    patch team_url(@team.code), params: { team: { email: 'team-update@test.com', name: nil } }
    assert_response 422
  end

  test "should not update team with empty email" do
    patch team_url(@team.code), params: { team: { email: nil, name: 'team-update' } }
    assert_response 422
  end

  test "should destroy team" do
    assert_difference("Team.count", -1) do
      delete team_url(@team.code)
    end

    assert_redirected_to teams_url
  end
end
