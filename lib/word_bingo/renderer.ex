defmodule WordBingo.Renderer do
  @moduledoc """
  Renders a Board into a human readable format
  """

  alias WordBingo.Board

  @doc """
  Renders a list of boards to html
  """
  @spec html([Board.t()]) :: String.t()
  def html(boards) do
    [
      "<html>",
      "<head>",
      ~s{<link href="bingo.css" rel="stylesheet"/>},
      "</head>",
      Enum.map(boards, fn board ->
        15 = length(board)

        [
          "<table>",
          board
          |> Enum.chunk_every(5)
          |> Enum.map(fn row ->
            [
              "<tr>",
              Enum.map(row, &["<td>", &1, "</td>"]),
              "</tr>"
            ]
          end),
          "</table>"
        ]
      end),
      "</html>"
    ]
    |> IO.iodata_to_binary()
  end
end
