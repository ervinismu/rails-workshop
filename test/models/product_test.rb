require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	test "should not save product without name" do
		product = Product.new
		assert_not product.save, "Saved the article without a name"
	end

	test "should report error" do
		# some undefined variable is not defined elswhere in the test case
		assert_raises(NameError) do
			some_undefined_variable
		end
	end
end
