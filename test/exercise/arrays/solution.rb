module Exercise
  module Arrays
    class << self
      def replace(array)
        y = array.reduce { |max, num| num > max ? num : max }
        array.map { |el| el.positive? ? y : el }
      end

      def search(array, query)
        max_index = array.size - 1
        mid_index = max_index / 2
        if array.empty? || array.first > query || array.last < query
          -1
        elsif array[mid_index] == query
          mid_index
        elsif query < array[mid_index]
          search(array[0, mid_index], query)
        elsif query > array[mid_index]
          new_array = array.slice(mid_index + 1, (array.size / 2))
          result = search(new_array, query)
          result == -1 ? -1 : mid_index + 1 + result
        end
      end
    end
  end
end
