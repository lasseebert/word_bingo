defmodule WordBingo.Board do
  @moduledoc """
  A Board is simply a list of 15 words (5x3)
  """

  @type t :: [String.t()]

  @size 15

  @doc """
  Reads a file of one word or phrase per line. Generates a random board from thos words.
  Empty lines are ignored
  """
  @spec from_file(String.t()) :: t
  def from_file(file_name) do
    file_name
    |> File.read!()
    |> String.split("\n", trim: true)
    |> from_wordlist()
  end

  defp from_wordlist(words) do
    words
    |> Enum.shuffle()
    |> Enum.take(@size)
  end
end
