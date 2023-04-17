(use /src/kill-port)

(assert (= (nth [1 2 3] 0) 1))
(assert (= (nth [1 2 3] 1) 2))
(assert (= (nth [1 2 3] 2) 3))
(assert (= (nth [1 2 3] 4) nil))

(assert (= (to-int "1") 1))
(assert (= (to-int "2") 2))
(assert (= (to-int "3") 3))
(assert (= (to-int "9") 9))
(assert (= (to-int "27") 27))
(assert (= (to-int "8080") 8080))

(assert (port? ["kill-port.janet" "2"]))
(assert (not (port? [])))
(assert (not (port? ["kill-port.janet"])))
(assert (not (port? ["kill-port.janet" "2" "5"])))

(assert (= (port ["kill-port.janet" "2"]) 2))

(assert (deep= (uniq [1 2 2]) @[1 2]))

(assert (is-localhost-line "node      38767 ryan   29u  IPv6 0x1416b22c17bf60ad      0t0  TCP localhost:51565 (LISTEN)"))
(assert (not (is-localhost-line "Code\x20H 41462 ryan   37u  IPv4 0x1416b22c18e19e15      0t0  TCP 192.168.1.13:61818->40.125.67.49:443 (CLOSED)")))