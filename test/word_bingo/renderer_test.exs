defmodule WordBingo.RendererTest do
  use ExUnit.Case, async: true

  alias WordBingo.Renderer

  describe "html" do
    test "render a single board to html" do
      board = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o"]
      html = Renderer.html([board])

      assert html =~ "<td>h</td>"
      assert html =~ "<tr><td>f"
      assert html =~ "<table><tr><td>a"
    end

    test "renders two boards to html" do
      boards = [
        List.duplicate("a", 15),
        List.duplicate("b", 15)
      ]

      html = Renderer.html(boards)

      assert html =~ "<td>a</td>"
      assert html =~ "<td>b</td>"
      assert html =~ "</table><table>"
    end
  end
end
