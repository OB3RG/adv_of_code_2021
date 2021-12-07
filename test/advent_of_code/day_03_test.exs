defmodule AdventOfCode.Day03Test do
  use ExUnit.Case

  import AdventOfCode.Day03

  @tag :skip
  test "part1" do
    input = "00100\n11110\n10110\n10111\n10101\n01111\n00111\n11100\n10000\n11001\n00010\n01010\n"
    result = part1(input)

    assert result == 198
  end

  @tag :skip
  test "part2" do
    input =
      """
      00100
      11110
      10110
      10111
      10101
      01111
      00111
      11100
      10000
      11001
      00010
      01010
      """
      |> String.split("\n", trim: true)

    result = part2(input)

    assert result == 230
  end
end
