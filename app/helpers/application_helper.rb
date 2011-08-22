module ApplicationHelper
  def format_price(price)
    ("%.2f" % price).gsub(".",",")
  end
end
