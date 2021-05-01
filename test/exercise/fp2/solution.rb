module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        tail = self
        loop do
          head, *tail = tail
          yield head
          break if tail.empty?
        end
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) { |acc, el| acc << yield(el) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |acc, el| el.nil? ? acc : acc << el }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        tail = self
        acc, *tail = tail if acc.nil?
        loop do
          head, *tail = tail
          acc = yield acc, head
          break if tail.empty?
        end
        acc
      end
    end
  end
end
