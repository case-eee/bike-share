module DateFormat
  def self.parse(date)
    date.strftime("%a, %d %b %Y")
  end
end