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
  end
end
