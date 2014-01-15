module Sort::Selection
  def self.sort(a)
    l = a.length

    return a if l <= 1

    0.upto(l - 1) do |t|
      min = t

      (t + 1).upto(l - 1) do |i|
        if a[min] > a[i]
          min = i
        end
      end

      if min != t
        a[t], a[min] = a[min], a[t]
      end
    end

    a
  end
end
