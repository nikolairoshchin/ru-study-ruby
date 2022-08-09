module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(array = self, &block)
	head, *rest = array
	return block.call(head) if rest.empty?
	block.call(head)
	my_each(rest, &block)
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
      def my_reduce(acc = nil, array = self, &block)
	head, *rest = array
	if acc.nil?
	  acc = head
	  head, *rest = rest
	end
	return block.call(acc, head) if rest.empty?
	acc = block.call(acc, head)
	acc = my_reduce(acc, rest, &block)
     end

    end
  end
end
