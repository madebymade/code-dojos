(ns clojo.fizzbuzz
  (:use clojure.test))

(defn fizzbuzz [number]
  (if (= number 0)
    (str number)
    (if (and (= (mod number 5) 0 (mod number 3) 0))
      (str "fizzbuzz")
      (if (= (mod number 3) 0)
        (str "fizz")
        (if (= (mod number 5) 0)
          (str "buzz")
          (str number))))))

(dotimes [n 101] (println (fizzbuzz n)))

(deftest test-is-fizz-on-three []
  (is (= "fizz" (fizzbuzz 3))))

(deftest test-is-buzz-on-five []
  (is (= "buzz" (fizzbuzz 5))))

(deftest test-is-fizzbuzz-on-fifteen []
  (is (= "fizzbuzz" (fizzbuzz 15))))

(deftest test-is-four-on-four []
  (is (= "4" (fizzbuzz 4))))
