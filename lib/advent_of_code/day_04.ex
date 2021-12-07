defmodule AdventOfCode.Day04 do
  def parse_draw(draw) do
    String.split(draw, ",")
  end

  def parse_brick(brick) do
    String.split(brick, "\n", trim: true)
    |> Enum.join()
    |> String.split(" ", trim: true)
    |> Enum.chunk_every(5)
    |> IO.inspect()

    # |> Enum.at(0)
    # |> IO.puts()
  end

  def part1(args) do
    input = String.split(args, "\n\n", trim: true)

    Enum.at(input, 0)
    |> parse_draw

    Enum.at(input, 1)
    |> parse_brick
  end

  def part2(_args) do
  end
end
