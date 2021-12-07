defmodule AdventOfCode.Day03 do
  def count(list) do
    Enum.reduce(list, List.duplicate(0, 12), fn input, acc ->
      for {value, counter} <- Enum.zip(input, acc) do
        case value do
          ?1 -> counter + 1
          ?0 -> counter
        end
      end
    end)
  end

  def part1(args) do
    list =
      String.split(args, "\n", trim: true)
      |> Enum.map(&String.to_charlist/1)

    half = div(length(list), 2)

    {a, b} =
      list
      |> count
      |> Enum.reduce({0, 0}, fn elem, {a, b} ->
        if elem > half do
          {a * 2 + 1, b * 2}
        else
          {a * 2, b * 2 + 1}
        end
      end)

    a * b
  end

  def part2(args) do
    input =
      String.split(args, "\n", trim: true)
      |> parse

    oxygen = get_rating(input, :oxygen)
    co2 = get_rating(input, :co2)

    oxygen * co2
  end

  defp get_rating(samples, value) do
    get_rating(samples, 0, value)
  end

  defp get_rating([sample], _position, _value) do
    Enum.reduce(sample, 0, &(&2 * 2 + &1))
  end

  defp get_rating(samples, position, value) do
    map =
      Enum.group_by(samples, fn sample ->
        Enum.at(sample, position)
      end)

    zeroes = Map.get(map, 0)
    ones = Map.get(map, 1)

    samples =
      if length(ones) >= length(zeroes) do
        case value do
          :oxygen -> ones
          :co2 -> zeroes
        end
      else
        case value do
          :oxygen -> zeroes
          :co2 -> ones
        end
      end

    get_rating(samples, position + 1, value)
  end

  defp parse(input) do
    Enum.map(input, &to_charlist/1)
    |> Enum.map(fn line ->
      Enum.map(line, &(&1 - ?0))
    end)
  end
end
