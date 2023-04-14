(use /kill-port)

(assert (= (nth [1 2 3] 0) 1))
(assert (= (nth [1 2 3] 1) 2))
(assert (= (nth [1 2 3] 2) 3))
(assert (= (nth [1 2 3] 4) nil))

(assert (= (atoi "1") 1))
(assert (= (atoi "2") 2))
(assert (= (atoi "3") 3))
(assert (= (atoi "9") 9))
(assert (= (atoi "27") 27))
(assert (= (atoi "8080") 8080))

(assert (has-port? ["kill-port.janet" "2"]))
(assert (not (has-port? [])))
(assert (not (has-port? ["kill-port.janet"])))
(assert (not (has-port? ["kill-port.janet" "2" "5"])))

(assert (= (get-port ["kill-port.janet" "2"]) 2))