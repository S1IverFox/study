module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        i = 0
        while i < length
          yield(self[i])
          i += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) { |acc, el| acc << yield(el) }
      end

      # Написать свою функцию my_compact
      def my_compact
        new_array = MyArray.new
        my_map { |el| new_array << el unless el.nil? }
        new_array
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each { |el| acc = acc.nil? ? el : yield(acc, el) }
        acc
      end
    end
  end
end
