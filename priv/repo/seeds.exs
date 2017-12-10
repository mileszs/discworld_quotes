# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DiscworldQuotes.Repo.insert!(%DiscworldQuotes.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

quotes = [
  %{
    quote: "The whole of life is just like watching a film. Only it’s as though you always get in ten minutes after the big picture has started, and no-one will tell you the plot, so you have to work it out all yourself from the clues.",
    source: "Moving Pictures",
  },
  %{
    quote: "Real stupidity beats artificial intelligence every time.",
    source: "Hogfather",
  },
  %{
    quote: "The presence of those seeking the truth is infinitely to be preferred to the presence of those who think they’ve found it.",
    source: "Monstrous Regiment",
  },
  %{
    quote: "It’s still magic even if you know how it’s done.",
    source: "A Hat Full of Sky",
  },
  %{
    quote: "Goodness is about what you do. Not who you pray to.",
    source: "Snuff",
  },
  %{
    quote: "Some humans would do anything to see if it was possible to do it. If you put a large switch in some cave somewhere, with a sign on it saying 'End-of-the-World Switch. PLEASE DO NOT TOUCH', the paint wouldn't even have time to dry.",
    source: "The Thief of Time",
  },
  %{
    quote: "There are those who, when presented with a glass that is exactly half full, say: this glass is half full.

    And then there are those who say: this glass is half empty.

    The world belongs, however, to those who can look at the glass and say: What’s up with this glass? Excuse me? Excuse me? This is my glass? I don’t think so. My glass was full! And it was a bigger glass!",
    source: "The Truth",
  },
  %{
    quote: "Always remember that the crowd that applauds your coronation is the same crowd that will applaud your beheading. People like a show.",
    source: "Going Postal",
  },
  %{
    quote: "Give a man a fire and he’s warm for a day, but set fire to him and he’s warm for the rest of his life.",
    source: "Jingo",
  },
  %{
    quote: "People’s whole lives do pass in front of their eyes before they die. The process is called 'living'",
    source: "The Last Continent",
  },
  %{
    quote: "The intelligence of that creature known as a crowd is the square root of the number of people in it.",
    source: "Jingo",
  },
  %{
    quote: "The trouble with having an open mind, of course, is that people will insist on coming along and trying to put things in it.",
    source: "Diggers",
  },
  %{
    quote: "'And what would humans be without love?'
    'RARE', said Death.",
    source: "Sourcery",
  },
  %{
    quote: "A good bookshop is just a genteel Black Hole that knows how to read.",
    source: "Guards! Guards!",
  },
  %{
    quote: "Do you not know that a man is not dead while his name is still spoken?",
    source: "Going Postal",
  },
  %{
    quote: "Five exclamation marks, the sure sign of an insane mind.",
    source: "Reaper Man",
  },
  %{
    quote: "They say a little knowledge is a dangerous thing, but it's not one half so bad as a lot of ignorance.",
    source: "Equal Rites",
  },
  %{
    quote: "She was already learning that if you ignore the rules people will, half the time, quietly rewrite them so that they don't apply to you.",
    source: "Equal Rites",
  },
  %{
    quote: "If you trust in yourself.... and believe in your dreams.... and follow your star... you'll still get beaten by people who spent their time working hard and learning things and weren't so lazy.",
    source: "The Wee Free Men",
  },
  %{
    quote: "Always be wary of any helpful item that weighs less than its operating manual.",
    source: "Jingo",
  },
  %{
    quote: "The enemy isn't men, or women, it's bloody stupid people and no one has the right to be stupid.",
    source: "Monstrous Regiment",
  },
  %{
    quote: "Evil begins when you begin to treat people as things.",
    source: "I Shall Wear Midnight",
  },
  %{
    quote: "Humans need fantasy to be human. To be the place where the falling angel meets the rising ape.",
    source: "Hogfather",
  },
]

Enum.map(quotes, fn x -> DiscworldQuotes.Repo.insert!(%DiscworldQuotes.Quotes.Quote{value: x.quote, source: x.source}) end)

