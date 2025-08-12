;; Chain-Based Leaderboard Contract
;; Tracks top scores submitted by players on-chain

(define-map scores principal uint)

;; Error constants
(define-constant err-invalid-score (err u100))

;; Submit or update player's score
(define-public (submit-score (new-score uint))
  (let (
    (current-score (default-to u0 (map-get? scores tx-sender)))
  )
    (if (> new-score current-score)
        (begin
          (map-set scores tx-sender new-score)
          (ok { updated: true, old-score: current-score, new-score: new-score })
        )
        (err err-invalid-score)
    )
  )
)

;; Read-only function to get a player's score
(define-read-only (get-score (player principal))
  (ok (default-to u0 (map-get? scores player)))
)
