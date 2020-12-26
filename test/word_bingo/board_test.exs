defmodule WordBingo.BoardTest do
  use ExUnit.Case, async: true

  alias WordBingo.Board

  describe "from_file" do
    test "generates a board" do
      board = Board.from_file("input_files/new_years_eve_2019.danish.wordlist")

      assert length(board) == 15
      assert board |> hd() |> is_binary()
    end
  end
end
