module Exercise
  module Arrays
    class << self
      def replace(array)
        my_max = maximum(array)
	array.map { |item| item.positive? ? my_max : item  }
      end

      def maximum(array)
        my_maxi = array[0]
        array.each do |arr|
          my_maxi = arr if arr > my_maxi
        end
        my_maxi
      end

      def search(_array, _query)
        high = _array.length - 1
        low = 0
        recur_search(_array, _query, low, high)
      end

      def recur_search(_array, _query, low, high)
        if low <= high
          mid = (low + high) / 2
          if _array[mid] < _query
            recur_search(_array, _query, mid + 1, high)
          elsif _array[mid] > _query
            recur_search(_array, _query, low, mid - 1)
          else
            mid
          end
        else
          -1
        end
      end
    end
  end
end
