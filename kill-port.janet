(use sh)

(def output @"")

(def usage (fn []
  (print "Usage: kill-port [port]")))

(def has-port? (fn [args]
  (= (length args) 2)))

(def main (fn [& args]
  (if (not (has-port? args))
    (usage)
    (os/exit 1))))
  #($ lsof -i -P >,output)
  #(print output))
