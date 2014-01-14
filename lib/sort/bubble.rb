module Sort::Bubble
  def self.sort(array)
    size = array.size

    (0..size).each do |i|
      ((1 + i)..(size - 1)).each do |l|
        array[i], array[l] = array[l], array[i] if array[i] > array[l]
      end
    end

    array
  end
end
