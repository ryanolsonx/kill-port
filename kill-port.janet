(use /src/kill-port)

(def usage (fn []
  (print "Usage: kill-port [port]")))

(def main (fn [& args]
  (if (not (port? args))
    (do
      (usage)
      (os/exit 1)))
  (let [port (port args)
        pids (pids port)]
    (kill pids))))

# (def main (fn [& args]
#   (if (not (args-port? args))
#     (do
#       (usage)
#       (os/exit 1)))
#   (def port (args-port args))
#   (def pid (get-pid port))))
  # (pp pid)))