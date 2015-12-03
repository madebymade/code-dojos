(set-env!
 :source-paths #{"src/clj" "test/clj"}
 :dependencies '[[adzerk/boot-test "1.0.5"]])

(require '[adzerk.boot-test :refer [test]])
