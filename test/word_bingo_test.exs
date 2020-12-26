defmodule WordBingoTest do
  use ExUnit.Case
  doctest WordBingo

  test "greets the world" do
    assert WordBingo.hello() == :world
  end
end
