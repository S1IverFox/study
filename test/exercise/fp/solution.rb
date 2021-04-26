module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        a = array.reject { |film| film['country'].nil? || film['rating_kinopoisk'].nil? }
        filtered_array = a.select { |film| film['country'].to_s.split(',').length >= 2 && film['rating_kinopoisk'].to_f.positive? }
        sum_of_rating = filtered_array.reduce(0) { |sum, film| sum + film['rating_kinopoisk'].to_f }
        sum_of_rating / filtered_array.length
      end

      def chars_count(films, threshold)
        a = films.reject { |film| film['rating_kinopoisk'].nil? }
        filtered_array = a.select { |film| film['rating_kinopoisk'].to_f >= threshold }
        filtered_array.reduce(0) { |sum, film| sum + film['name'].count('и') }
      end
    end
  end
end
