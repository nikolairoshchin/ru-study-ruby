module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        index = 0
        while index < length
          block.call(self[index])
          index += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        result = MyArray.new
        my_each do |el|
          result << block.call(el)
        end
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each do |el|
          result << el unless el.nil?
        end
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        index = acc.nil? ? 1 : 0
        acc ||= self[0]
        while index < length
          acc = block.call(acc, self[index])
          index += 1
        end
        acc
      end
    end
  end
end
