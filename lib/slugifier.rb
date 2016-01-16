class Slugifier
  def slugify(string)
    string.downcase.downcase.gsub(/(\s|_)/, '-')
  end
end
