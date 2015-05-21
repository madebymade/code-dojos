![Made](../img/stream_logo.png)

#Twitter Top Trumps

## Features

- With a given username, hit up the [Twitter API](https://dev.twitter.com/rest/reference/get/followers/list) to return info on 100 followers
  - We'll call these 100 followers "decks"

- Build method that generates a value for each follower
  - Extract the following/followers counts from each follower in the JSON response
  - Assign a value to each follower based on their ratio of followers to following
  - We'll call these "cards"

- Build method that determines a winner given two cards
  - The card with the highest value wins
  - Two cards of equal value draw
  - 2 points for a win
  - 1 point each for a draw
  - 0 points for a loss

- Run the game
  - Create form that submits the two usernames
  - With the decks in a random order, automatically pit the decks against each other

- Build view that presents the results
  - Blow-by-blow results
  - Overall score
