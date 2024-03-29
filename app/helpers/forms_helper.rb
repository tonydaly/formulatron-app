module FormsHelper
  def percentage(total, count)
    return "0" if total.zero?
    "%.0f" % ((count.to_f / total.to_f) * 100)
  end

  def total(count, element)
    if element.check_box?
      "Total Entries: #{count}"
    else
      "Total: #{count}"
    end
  end
end
