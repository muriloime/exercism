class FlattenArray
  def self.flatten(arr)
    arr.map{|v| v.class == Array ?  : v }
  end
end
