module Exercise
  module Arrays
    class << self
      def replace(array)
        my_max = maximum(array)
        array.map { |item| item.positive? ? my_max : item }
      end

      def maximum(array)
        maxi = array[0]
        array.each do |item|
          maxi = item if item > maxi
        end
        maxi
      end

      def search(array, query, low = 0, high = array.length - 1)
        return -1 if low > high

        mid = (low + high) / 2
        return mid if array[mid] == query

        array[mid] < query ? search(array, query, mid + 1, high) : search(array, query, low, mid - 1)
      end
    end
  end
end
