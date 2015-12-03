(ns clojo.hello-test
  (:use clojure.test)
  (:require [clojo.hello :as h]))

(deftest test-hello-without-args []
  (is (= (h/hello) "hello")))

(deftest test-hello-with-name []
  (is (= (h/hello "luke") "hello luke")))

(deftest test-hello-with-many-names []
  (is (= (h/hello "luke" "dan") "hello luke dan")))
