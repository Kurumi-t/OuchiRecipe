module ApplicationHelper
  def rounded_decimel(num)
    ActiveSupport::NumberHelper.number_to_rounded(num, strip_insignificant_zeros: true)
  end
end
