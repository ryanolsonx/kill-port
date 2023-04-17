(use sh)

(def nth (fn [xs i]
  (if (<= (+ i 1) (length xs))
    (first (slice xs i))
    nil)))

(def to-int (fn [s]
  (do
    (var n 0)
    (each i (range (length s))
      (set n (+ (* 10 n) (- (s i) 48))))
    n)))

(def kill (fn [pids]
  (each pid (map string pids)
    ($ kill -9 ,pid))))

(def is-localhost-line (fn [line]
  (not= (string/find "localhost" line) nil)))

(def get-localhost-lines (fn [lines]
  (filter is-localhost-line lines)))

(def get-port-from-line (fn [line]
  (to-int (first (filter (fn [v] (not= "" v)) (drop 1 (string/split " " line)))))))  

(def has-port (fn [port]
  (fn [line]
    (not= (string/find (string/format "localhost:%d (LISTEN)" port) line) nil))))

(def open-files (fn []
  (do
    (var out @"")
    ($ lsof -i -P >,out)
    (drop 1 (string/split "\n" out)))))

(def uniq (fn [arr]
  (do
    (def res @[])
    (each i (range (length arr))
      (if (= (index-of (arr i) arr) i)
        (array/push res (arr i))))
    res)))

(def pids (fn [port]
  (def fs (get-localhost-lines (open-files)))
  (def lines (filter (has-port port) fs))
  (uniq (map get-port-from-line lines))))
  
(def port (fn [args]
  (to-int (last args))))

(def port? (fn [args]
  (and (= (length args) 2) (not= (port args) nil))))