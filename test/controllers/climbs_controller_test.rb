require "test_helper"

class ClimbsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @climb = climbs(:one)
  end

  test "should get index" do
    get climbs_url
    assert_response :success
  end

  test "should get new" do
    get new_climb_url
    assert_response :success
  end

  test "should create climb" do
    assert_difference("Climb.count") do
      post climbs_url, params: { climb: { attempts: @climb.attempts, climb_type: @climb.climb_type, comments: @climb.comments, grade_id: @climb.grade_id, location: @climb.location, name: @climb.name } }
    end

    assert_redirected_to climb_url(Climb.last)
  end

  test "should show climb" do
    get climb_url(@climb)
    assert_response :success
  end

  test "should get edit" do
    get edit_climb_url(@climb)
    assert_response :success
  end

  test "should update climb" do
    patch climb_url(@climb), params: { climb: { attempts: @climb.attempts, climb_type: @climb.climb_type, comments: @climb.comments, grade_id: @climb.grade_id, location: @climb.location, name: @climb.name } }
    assert_redirected_to climb_url(@climb)
  end

  test "should destroy climb" do
    assert_difference("Climb.count", -1) do
      delete climb_url(@climb)
    end

    assert_redirected_to climbs_url
  end
end
