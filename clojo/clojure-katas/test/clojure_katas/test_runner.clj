(ns clojure-katas.test-runner
  (:require [clojure.test :as t]))

(def problems
  '[clojure-katas.count-coin-change-test
    clojure-katas.max-prime-factor-test
    clojure-katas.nth-fibonacci-test
    clojure-katas.sine-angle-test
    clojure-katas.arranged-prob-test
    clojure-katas.exponential-test
    clojure-katas.greatest-common-divisor-test
    clojure-katas.reverse-binary-test
    clojure-katas.pascal-triangle-test
    clojure-katas.procedural-sum-test
    clojure-katas.square-root-test
    clojure-katas.integral-test
    clojure-katas.fixed-point-test
    clojure-katas.roman-to-arabic-test
    clojure-katas.levenshtein-test])

(defn run-tests
  []
  (try
    (loop [nses problems]
      (when-let [[ns & more] nses]
        (and (try
               (require ns)
               true ; continue
               (catch clojure.lang.ExceptionInfo e
                 (if (contains? (ex-data e) :symbol)
                   (let [sym (-> e ex-data :symbol)]
                     (println "Current kata to tackle: " sym)
                     false ; don't continue
                     )
                   (throw e))))
             (let [{:keys [error fail]} (t/run-tests ns)]
               (= 0 error fail))
             (recur more))))))
