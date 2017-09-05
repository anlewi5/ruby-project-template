require 'minitest/autorun'
require './lib/social_worker'
require './lib/child_wellfare_case'

class SocialWorkerTest < Minitest::Test
  def test_it_exists
    sw = SocialWorker.new("Mariko Yamada")

    assert_instance_of SocialWorker, sw
  end

  def test_it_has_name
   sw = SocialWorker.new("Mariko Yamada")

   assert_equal "Mariko Yamada", sw.name
  end

  def test_it_has_cases
    sw = SocialWorker.new("Mariko Yamada")

    assert_equal [], sw.cases
  end

  def test_it_has_caseload
    sw = SocialWorker.new("Mariko Yamada")

    assert_equal 0, sw.caseload
  end

  def test_adds_case
    sw = SocialWorker.new("Mariko Yamada")
    cwc_1 = ChildWellfareCase.new("Jane Doe", 13, "8763 Alameda Street, Los Angeles, CA, 90002")
    sw.add_case(cwc_1)

    assert_equal 1, sw.caseload
  end

  def test_adds_two_cases
    sw = SocialWorker.new("Mariko Yamada")
    cwc_1 = ChildWellfareCase.new("Jane Doe", 13, "8763 Alameda Street, Los Angeles, CA, 90002")
    cwc_2 = ChildWellfareCase.new("Juan Lopez", 11, "4663 Hillview Avenue, Los Angeles, CA 91304")
    sw.add_case(cwc_1)
    sw.add_case(cwc_2)

    assert_equal 2, sw.caseload
  end

  def test_gets_average_minor_age
    sw = SocialWorker.new("Mariko Yamada")
    cwc_1 = ChildWellfareCase.new("Jane Doe", 13, "8763 Alameda Street, Los Angeles, CA, 90002")
    cwc_2 = ChildWellfareCase.new("Juan Lopez", 11, "4663 Hillview Avenue, Los Angeles, CA 91304")
    sw.add_case(cwc_1)
    sw.add_case(cwc_2)

    assert_equal 12, sw.avg_minor_age
  end

  def test_cases_is_array_of_wellfare_cases
    sw = SocialWorker.new("Mariko Yamada")
    cwc_1 = ChildWellfareCase.new("Jane Doe", 13, "8763 Alameda Street, Los Angeles, CA, 90002")
    cwc_2 = ChildWellfareCase.new("Juan Lopez", 11, "4663 Hillview Avenue, Los Angeles, CA 91304")
    sw.add_case(cwc_1)
    sw.add_case(cwc_2)

    assert_instance_of ChildWellfareCase, sw.cases[0]
    assert_instance_of ChildWellfareCase, sw.cases[1]
    assert_equal 2, sw.cases.length
  end

end
