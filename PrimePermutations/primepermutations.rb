require 'prime'

class PrimeNumber
  def self.range(first, last)
    (first..last).collect { |i| i if Prime.prime?(i) }.compact
  end

  def self.permutation(seed)
    seed.to_s.chars.to_a.permutation.map(&:join).map(&:to_i).uniq
  end

  def self.prime_permutation(seed)
    permutations = self.permutation(seed)
    permutations.collect { |i| i if Prime.prime?(i) }.compact.sort
  end

  def self.prime_permutation_sequence(seed)
  end

  def self.prime_permutation_sequence_deltas(primes)
    reduced = primes.reduce({:sequence => []}) do |reduced, n|
      unless reduced[:last].nil?
        delta = n - reduced[:last]
      end



        unless reduced[:last_delta].nil?
          reduced[:sequence] << n
          reduced[:sequence] << reduced[:last]

          unless delta == reduced[:last_delta]
            reduced[:sequence] = []
          end
        end

        reduced[:last_delta] = delta

      reduced.merge(:last => n)
    end

    reduced[:sequence]
  end
end