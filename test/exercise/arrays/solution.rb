module Exercise
  module Arrays
    class << self
      def replace(array)
        my_max = maximum(array)
	array.map { |item| item.positive? ? my_max : item  }
      end

      def maximum(array)
        maxi = array[0]
        array.each do |item|
          maxi = item if item > maxi
        end
        maxi
      end

      def search(_array, _query, low = 0, high = _array.length - 1)
	return -1 if low > high
        mid = (low + high) / 2
	return mid if _array[mid] == _query
          if _array[mid] < _query
	     search(_array, _query, mid + 1, high)
          else _array[mid] > _query
	     search(_array, _query, low, mid - 1)
          end
      end

    end
  end
end
