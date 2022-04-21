require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: "Home & Kitchen")
    @category2 = Category.create(name: "Sports & Outdoors")
  end

  test "should show category list" do
    get '/categories'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end

end
