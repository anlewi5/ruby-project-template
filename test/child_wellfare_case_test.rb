require 'minitest/autorun'
require './lib/child_wellfare_case'

class ChildWellfareCaseTest < Minitest::Test

  attr_reader :cwc_1

  def setup
    @cwc_1 = ChildWellfareCase.new("Jane Doe", 13, "8763 Alameda Street, Los Angeles, CA, 90002")
  end

  def test_it_exists
    assert_instance_of ChildWellfareCase, cwc_1
  end

  def test_minor
    assert_equal "Jane Doe", cwc_1.minor
  end

  def test_age
    assert_equal 13, cwc_1.age
  end

  def test_zip
    assert_equal "90002", cwc_1.zip
  end

end
