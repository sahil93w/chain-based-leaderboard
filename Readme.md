# Chain-Based Leaderboard Contract

## 1. Project Title:
**Chain-Based Leaderboard Contract**

## 2. Project Description:
The Chain-Based Leaderboard Contract is a simple Clarity contract designed to store and manage player scores on a decentralized leaderboard. It allows the addition of scores for players and retrieval of player scores. The data is immutable and transparent, providing a trustless environment for ranking players or users.

This contract is ideal for applications like gaming, quizzes, or competitions where users’ performance needs to be ranked and stored securely on the blockchain.

## 3. Project Vision:
The vision for this project is to create a decentralized, immutable, and transparent leaderboard for ranking players based on their performance. It aims to provide an easy-to-use, scalable solution for applications that need a secure leaderboard system. By using blockchain technology, this system ensures that scores are tamper-proof and transparent.

## 4. Future Scope:
- **Sorting and Ranking:** Implement functions to retrieve top N players in descending order based on their scores.
- **Leaderboard Tiers:** Support multiple types of leaderboards, such as daily, weekly, or regional.
- **Time-based Restrictions:** Introduce features like score expiry or periodic leaderboard resets.
- **Player Profile Information:** Extend the contract to store player metadata, such as name, avatar URL, or achievements.
- **Multi-Game Support:** Allow users to store scores from multiple games or activities within the same contract.
  
This contract can serve as the foundation for a wide range of applications that require a leaderboard system.

## 5. Contract Add:
The contract contains two core functions:

### **1. `add-player-score`**:
   - **Purpose:** Allows adding or updating a player's score.
   - **Inputs:**
     - `player (principal)`: The unique identifier (principal) for the player.
     - `score (uint)`: The score to be added for the player (must be a positive integer).
   - **Outputs:** Returns `true` if the score was successfully added.

### **2. `get-player-score`**:
   - **Purpose:** Retrieves the score of a specific player.
   - **Inputs:**
     - `player (principal)`: The unique identifier (principal) for the player.
   - **Outputs:** Returns the score of the player, or an error if no score is found for that player.

```lisp
;; Chain-Based Leaderboard Contract
;; A simple contract for storing player scores on a leaderboard.

;; Define the leaderboard
(define-map leaderboard principal uint)

;; Error Codes
(define-constant err-invalid-score (err u100))
(define-constant err-score-not-found (err u101))

;; Add Player Score
(define-public (add-player-score (player principal) (score uint))
  (begin
    (asserts! (> score u0) err-invalid-score)
    (map-set leaderboard player score)
    (ok true)))

;; Get Player Score
(define-read-only (get-player-score (player principal))
  (match (map-get? leaderboard player)
    some (ok (unwrap! (map-get? leaderboard player) err-score-not-found))
    none (err err-score-not-found)))


## Contract Address
<img width="1889" height="887" alt="image" src="https://github.com/user-attachments/assets/87b71309-8efb-4c70-8974-ea601e00b6f5" />
Contract Address: ST3E04T7RM3CFTP5MCET086X4M0KGK89S935E6222.chainbased
