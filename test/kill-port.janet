(use /kill-port)

(assert (has-port? '("kill-port.janet", "2")))
(assert (not (has-port? '())))
(assert (not (has-port? '("kill-port.janet"))))
(assert (not (has-port? '("kill-port.janet", "2", "a"))))