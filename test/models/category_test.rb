require 'test_helper'
class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Board Games")
  end

  test "category should be valid" do 
    assert @category.valid?
  end

  test "name should be present" do
    @category = Category.new(name: " ")
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    @category2 = Category.new(name: "Board Games")
    assert_not @category2.valid?
  end

  test "name should not be too long" do 
    @category.name = "A" * 26
    @category.save
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "AA"
    @category.save
    assert_not @category.valid?
  end

end