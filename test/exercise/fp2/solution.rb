module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
	each_recur(0, &block)
	self
      end

      def each_recur(index, &block)
	return block.call(self[index]) if index == length - 1
	block.call(self[index])
	each_recur(index += 1, &block)
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
	acc = reduce_recur(acc, index, &block) 
      end

      def reduce_recur(acc, index, &block)
	return acc if index == length
	acc = block.call(acc, self[index])
	reduce_recur(acc, index += 1, &block)
      end

    end
  end
end
