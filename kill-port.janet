(use sh)

#(def output @"")

(def nth (fn [xs i]
  (if (<= (+ i 1) (length xs))
    (first (slice xs i))
    nil)))

# TODO: detect NaN
(def atoi (fn [s]
  (do
    (var n 0)
    (each i (range (length s))
      (set n (+ (* 10 n) (- (s i) 48))))
    n)))

(def usage (fn []
  (print "Usage: kill-port [port]")))

(def get-port (fn [args]
  (atoi (last args))))

(def has-port? (fn [args]
  (and (= (length args) 2) (not= (get-port args) nil))))

(def main (fn [& args]
  (if (not (has-port? args))
    (usage)
    (os/exit 1))))
  #($ lsof -i -P >,output)
  #(print output))
