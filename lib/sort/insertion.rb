module Sort::Insertion
  def self.sort(a)
    1.upto(a.length - 1) do |j|
      key = a[j]
      i = j - 1

      while i >= 0 && a[i] > key
        a[i + 1] = a[i]
        i -= 1
      end

      a[i + 1] = key
    end

    a
  end
end
