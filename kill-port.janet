(def kill (fn [pids]
  (each pid (map string pids)
    (os/shell (string/format "kill -9 %s" pid)))))

(def uniq (fn [arr]
  (do
    (def res @[])
    (each i (range (length arr))
      (if (= (index-of (arr i) arr) i)
        (array/push res (arr i))))
    res)))

(def pids (fn [port]
  (let [cmd ["lsof" "-t" "-i" (string/format ":%s" port)]
        proc (os/spawn cmd :p { :out :pipe })
        output (:read (proc :out) :all)
        pids (string/split "\n" output)]
    (uniq (take (- (length pids) 1) pids)))))

(def usage (fn []
  (print "Usage: kill-port [port]")))

(def main (fn [& args]
  (if (not= (length args) 2)
    (do
      (usage)
      (os/exit 1)))
  (let [port (last args)]
    (kill (pids port)))))
