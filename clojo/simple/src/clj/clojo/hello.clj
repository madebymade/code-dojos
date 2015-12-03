(ns clojo.hello
  (:use clojure.test))

(defn hello
  ([] "hello")
  ([name] (str "hello " name))
  ([name second-name] (str "hello " name " " second-name)))

(deftest test-hello-without-args []
  (is (= (hello) "hello")))

(deftest test-hello-with-name []
  (is (= (hello "luke") "hello luke")))

(deftest test-hello-with-many-names []
  (is (= (hello "luke" "dan") "hello luke dan")))
