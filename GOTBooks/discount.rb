module Thrones
  class Discount
    def apply(products)
      # eligible_products = products.uniq { |e| [e.name] }
      permutations = [1,1,1,2,3,4].permutation.to_a
      p permutations
      discount_value = products.count * 5 - 5

      products.map do |product|
        if products.include?(product)
          discount_value
        else
          0
        end
      end
    end

    alias_method :discount, :apply

    def total_price(products)
      discount_pc = (discount(products).to_f / 100)
      products.map(&:price).inject(:+).to_f * (1 - discount_pc)
    end

    private

    def discount_percentage(products)

      book_1, book_2, book_1, book_3

      book_1: 2
      book_2: 1
      book_3: 1


    end
  end
end
