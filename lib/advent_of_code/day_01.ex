defmodule AdventOfCode.Day01 do
  def part1(args) do
    Enum.with_index(args, fn element, index -> {element, Enum.at(args, index + 1)} end)
    |> Enum.filter(&is_tuple(&1))
    |> Enum.filter(fn v -> is_number(elem(v, 1)) end)
    |> Enum.count(fn v -> elem(v, 0) < elem(v, 1) end)
  end

  def part2(args) do
    Enum.with_index(args, fn element, index ->
      {element, Enum.at(args, index + 1), Enum.at(args, index + 2)}
    end)
    |> Enum.filter(&is_tuple(&1))
    |> Enum.filter(fn v -> is_number(elem(v, 1)) && is_number(elem(v, 2)) end)
    |> Enum.map(fn v -> Enum.sum(Tuple.to_list(v)) end)
    |> part1
  end
end
