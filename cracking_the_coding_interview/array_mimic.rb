class SpecialArray < Array
  def [](index)
    fetch(index) {false}
  end
end
