require 'test_helper'

module Recommender
  class RecommendsControllerTest < ActionController::TestCase
    setup do
      @recommend = recommends(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:recommends)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create recommend" do
      assert_difference('Recommend.count') do
        post :create, recommend: { dynamic_fields: @recommend.dynamic_fields }
      end
  
      assert_redirected_to recommend_path(assigns(:recommend))
    end
  
    test "should show recommend" do
      get :show, id: @recommend
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @recommend
      assert_response :success
    end
  
    test "should update recommend" do
      put :update, id: @recommend, recommend: { dynamic_fields: @recommend.dynamic_fields }
      assert_redirected_to recommend_path(assigns(:recommend))
    end
  
    test "should destroy recommend" do
      assert_difference('Recommend.count', -1) do
        delete :destroy, id: @recommend
      end
  
      assert_redirected_to recommends_path
    end
  end
end
