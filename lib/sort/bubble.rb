module Sort::Bubble
  def self.sort(a)
    l = a.length

    return a if l <= 1

    0.upto(l - 1) do |t|
      0.upto(l - 2 - t) do |i|
        if a[i] > a[i + 1]
          a[i], a[i + 1] = a[i + 1], a[i]
        end
      end
    end

    a
  end
end
