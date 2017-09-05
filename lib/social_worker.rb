class SocialWorker

  attr_reader :name, :cases, :caseload

  def initialize(name)
    @name = name
    @cases = []
    @caseload = 0
  end

  def add_case(child_wellfare_case)
    @caseload += 1
    @cases << child_wellfare_case
  end

  def avg_minor_age
    ages = cases.map do |cw_case|
      cw_case.age
    end
    ages.sum / 2
  end

end
