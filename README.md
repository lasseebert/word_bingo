# word_bingo

word_bingo is a small script to generate bingo boards with words instead of numbers

## Usage

Run this in IEx and generate a HTML file, which can be opened in a browser to either print it or convert to PDF.

```
➤ iex -S mix
iex(1)> WordBingo.from_file("input_files/new_years_eve_2019.danish.wordlist", 35)
:ok
```

This produces the `bingo.html` file in the root of the folder.
