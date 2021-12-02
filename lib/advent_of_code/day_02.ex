defmodule AdventOfCode.Day02 do
  def part1(args) do
    list = String.split(args, "\n", trim: true)
    parsed = Enum.map(list, &String.split(&1, " "))

    {depth, horizontal} =
      Enum.reduce(parsed, {0, 0}, fn v, {depth, horizontal} ->
        case Enum.at(v, 0) do
          "forward" -> {depth, horizontal + String.to_integer(Enum.at(v, 1))}
          "down" -> {depth + String.to_integer(Enum.at(v, 1)), horizontal}
          "up" -> {depth - String.to_integer(Enum.at(v, 1)), horizontal}
        end
      end)

    depth * horizontal
  end

  def part2(args) do
    list = String.split(args, "\n", trim: true)
    parsed = Enum.map(list, &String.split(&1, " "))

    {depth, horizontal, _aim} =
      Enum.reduce(parsed, {0, 0, 0}, fn v, {depth, horizontal, aim} ->
        case Enum.at(v, 0) do
          "forward" ->
            {aim * String.to_integer(Enum.at(v, 1)) + depth,
             horizontal + String.to_integer(Enum.at(v, 1)), aim}

          "down" ->
            {depth, horizontal, aim + String.to_integer(Enum.at(v, 1))}

          "up" ->
            {depth, horizontal, aim - String.to_integer(Enum.at(v, 1))}
        end
      end)

    depth * horizontal
  end
end
