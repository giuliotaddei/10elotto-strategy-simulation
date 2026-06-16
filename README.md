# 10eLotto Strategy Simulation

Monte Carlo simulation in R developed as part of my Bachelor's thesis to analyze and compare different betting strategies in the Italian 10eLotto lottery.

## Project Overview

The objective of this project is to study how different betting strategies affect the evolution of a player's bankroll over time.

The simulation models a player selecting 10 numbers out of 90 and compares three distinct betting strategies under identical initial conditions.

Rather than searching for a "winning system", the goal is to quantitatively evaluate risk, volatility, and long-term outcomes associated with different staking rules.

---

## Simulation Setup

All players start with the same initial bankroll:

* Initial capital: **€1000**
* Number of simulations per strategy: **1000**
* Maximum number of bets per simulation: **550**
* No borrowing allowed

Each simulation stops when one of the following conditions is met:

* The bankroll reaches **€0**
* The bankroll exceeds the upper threshold defined in the model
* The player completes **550 bets**

The limit of 550 bets was chosen because a €5 bet has an expected loss of approximately €1.83. Starting from €1000, a player using a fixed €5 stake is therefore expected to exhaust their bankroll after roughly 550 bets.

---

## Lottery Model

For each draw:

1. The player selects 10 numbers out of 90.
2. Twenty numbers are randomly extracted.
3. The number of matches is computed.
4. Prizes are assigned according to the official payout table used in the thesis.

The probability distribution of the number of matches follows a hypergeometric distribution and is used to compute expected winnings.

---

## Strategies Compared

### Strategy 1: Fixed Stake

The player always bets:

* **€5 per draw**

The stake never changes regardless of previous wins or losses.

This strategy serves as a baseline for comparison.

---

### Strategy 2: Adaptive Doubling Strategy

The player starts with a stake of:

* **€5**

The stake is then modified according to previous outcomes:

* After a losing bet, the next stake is doubled (subject to the available bankroll).
* After a small win (between €1 and €100), the player stakes the entire amount won in the next draw.
* If a loss occurs immediately after reinvesting a small win, the player returns to the previous stake instead of doubling.
* After a large win (greater than €100), the stake is reset to €5.

This strategy is inspired by Martingale-style betting systems while incorporating additional rules for handling intermediate winnings.

---

### Strategy 3: Fair Game Strategy

The third player also uses a constant stake strategy, but the game mechanics are modified to create a fair game.

The stake is set equal to the theoretical expected payout:

```r
sum(vincite * dhyper(punti, 10, 80, 20))
```

Unlike the first two strategies:

* prizes are not multiplied by the amount wagered;
* the cost of a ticket equals its expected value.

Under this setup, the expected net gain is theoretically equal to zero.

This strategy acts as a benchmark for comparison with the real lottery payout structure.

---

## Collected Metrics

For each simulation, the following statistics are recorded:

* Final bankroll
* Net profit/loss
* Number of bets played
* Average net winning per bet
* Maximum net winning achieved

---

## Visualizations

The script generates several graphical summaries, including:

* Histograms of final bankrolls
* Histograms of profits and losses
* Boxplots comparing the three strategies
* Distribution of the number of bets played
* Maximum and average net winnings
* Final bankroll trajectories across simulations

---

## Technologies

* R
* Monte Carlo simulation
* Hypergeometric distribution (`dhyper`)
* Base R graphics

---

## Main Finding

The project highlights how bankroll dynamics can differ substantially even when players face exactly the same lottery probabilities.

While betting strategies may alter volatility and the distribution of outcomes, they do not change the underlying probabilistic structure of the game.
