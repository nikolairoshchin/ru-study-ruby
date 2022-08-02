module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        arr = array.map do |film|
	  film_rating = film['rating_kinopoisk'].to_f
          film_rating if film_2_more_country?(film) && film_rating > 0
        end.compact
        arr.reduce(:+) / arr.length
      end

      def film_2_more_country?(film)
	!film['country'].nil? && film['country'].split(',').length >= 2
      end

      def chars_count(films, threshold)
        arr = films.map do |film|
          film['rating_kinopoisk'].to_f >= threshold ? film['name'] : 'o'
        end.map(&:chars).flatten
        arr.reduce(0) do |memo, letter|
          memo += letter == 'и' ? 1 : 0
        end
      end
    end
  end
end
