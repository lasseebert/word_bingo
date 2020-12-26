defmodule WordBingo do
  @moduledoc """
  Generates bingo boards in HTML, ready to print
  """

  alias WordBingo.Board
  alias WordBingo.Renderer

  @doc """
  Generates the given number of bingo boards and renders it to bingo.html.
  Open the HTML file in a browser and print it.
  """
  @spec from_file(String.t(), pos_integer) :: :ok
  def from_file(file_name, count) do
    Stream.repeatedly(fn -> Board.from_file(file_name) end)
    |> Enum.take(count)
    |> Renderer.html()
    |> (&File.write!("bingo.html", &1)).()
  end
end
