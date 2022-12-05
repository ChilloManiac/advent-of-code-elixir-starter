defmodule Mix.Tasks.D05.P1 do
  use Mix.Task

  import AdventOfCode.Day05

  @shortdoc "Day 05 Part 1"
  def run(args) do
    stacks = ["PGRN", "CDGFLBTJ", "VSM", "PZCRSL", "QDWCVLSP", "SMDWNTC", "PWGDH", "VMCSHPLZ", "ZGWLFPR"]

    moves = 
      [ 2, 4, 6,
        4, 5, 3,
        6, 6, 1,
        4, 1, 4,
        4, 9, 4,
        7, 2, 4,
        1, 9, 3,
        1, 2, 6,
        2, 9, 5,
        2, 6, 8,
        5, 8, 1,
        2, 6, 9,
        5, 8, 3,
        1, 5, 4,
        3, 7, 2,
        10, 4, 7,
        7, 4, 3,
        1, 4, 7,
        1, 7, 9,
        1, 2, 3,
        11, 1, 7,
        12, 3, 7,
        8, 3, 8,
        29, 7, 2,
        3, 7, 3,
        3, 9, 2,
        4, 5, 3,
        7, 3, 5,
        28, 2, 3,
        1, 7, 5,
        2, 8, 5,
        2, 4, 1,
        2, 1, 4,
        1, 7, 6,
        1, 7, 1,
        3, 2, 8,
        1, 1, 7,
        9, 5, 3,
        12, 3, 1,
        1, 4, 3,
        1, 6, 4,
        3, 2, 9,
        16, 3, 7,
        2, 9, 6,
        5, 7, 2,
        1, 9, 7,
        1, 4, 2,
        13, 7, 2,
        13, 2, 7,
        12, 7, 8,
        2, 6, 4,
        16, 8, 1,
        4, 3, 1,
        3, 3, 2,
        1, 5, 7,
        1, 5, 3,
        3, 4, 6,
        19, 1, 3,
        5, 8, 4,
        6, 3, 2,
        5, 4, 2,
        1, 7, 4,
        1, 4, 9,
        3, 6, 7,
        1, 9, 2,
        16, 2, 4,
        9, 1, 8,
        10, 4, 2,
        2, 7, 5,
        5, 8, 4,
        12, 2, 9,
        2, 7, 4,
        12, 9, 5,
        11, 5, 6,
        3, 1, 9,
        1, 5, 7,
        2, 9, 2,
        10, 3, 2,
        1, 9, 2,
        2, 8, 9,
        1, 7, 8,
        1, 8, 4,
        7, 2, 6,
        1, 1, 5,
        5, 3, 1,
        1, 5, 1,
        2, 3, 9,
        2, 1, 6,
        3, 9, 8,
        14, 6, 1,
        1, 3, 5,
        5, 4, 6,
        1, 9, 6,
        7, 6, 9,
        1, 6, 2,
        8, 1, 4,
        7, 1, 7,
        10, 2, 1,
        4, 7, 6,
        10, 4, 6,
        5, 8, 2,
        1, 5, 9,
        2, 2, 6,
        2, 4, 7,
        1, 2, 7,
        5, 9, 2,
        1, 2, 9,
        14, 6, 8,
        2, 8, 4,
        1, 2, 6,
        4, 9, 3,
        2, 6, 8,
        5, 4, 5,
        5, 8, 3,
        1, 2, 4,
        3, 7, 1,
        2, 2, 7,
        1, 4, 7,
        1, 4, 5,
        1, 2, 8,
        1, 4, 9,
        8, 8, 2,
        3, 1, 5,
        7, 2, 9,
        8, 1, 6,
        6, 7, 2,
        2, 2, 8,
        5, 1, 8,
        3, 6, 8,
        4, 3, 6,
        3, 6, 2,
        8, 9, 2,
        11, 5, 7,
        12, 2, 6,
        2, 3, 7,
        12, 7, 2,
        10, 6, 9,
        1, 7, 1,
        12, 8, 7,
        2, 3, 2,
        8, 9, 7,
        6, 2, 5,
        1, 1, 6,
        3, 2, 6,
        1, 3, 7,
        5, 5, 3,
        10, 7, 2,
        2, 3, 7,
        8, 7, 6,
        20, 2, 8,
        5, 8, 1,
        5, 8, 6,
        1, 5, 7,
        1, 1, 4,
        4, 1, 2,
        1, 9, 6,
        3, 3, 1,
        4, 7, 5,
        1, 9, 8,
        11, 8, 7,
        1, 4, 9,
        2, 7, 5,
        31, 6, 9,
        4, 2, 3,
        6, 5, 1,
        4, 1, 2,
        7, 7, 8,
        1, 7, 6,
        1, 1, 7,
        24, 9, 4,
        2, 7, 8,
        2, 9, 2,
        2, 7, 5,
        2, 5, 9,
        3, 4, 1,
        20, 4, 2,
        1, 6, 1,
        16, 2, 1,
        4, 3, 1,
        1, 4, 8,
        5, 8, 5,
        5, 8, 1,
        1, 5, 2,
        3, 5, 6,
        33, 1, 6,
        6, 9, 4,
        15, 6, 7,
        6, 4, 3,
        1, 5, 3,
        7, 3, 9,
        11, 7, 5,
        10, 5, 8,
        2, 7, 3,
        5, 8, 9,
        1, 7, 5,
        1, 5, 8,
        1, 5, 7,
        2, 3, 8,
        2, 7, 5,
        2, 8, 7,
        1, 5, 9,
        1, 7, 6,
        3, 8, 6,
        22, 6, 9,
        1, 7, 6,
        27, 9, 4,
        18, 4, 8,
        5, 4, 1,
        1, 5, 1,
        3, 6, 3,
        2, 3, 5,
        2, 5, 2,
        1, 2, 6,
        1, 6, 3,
        9, 8, 6,
        3, 9, 8,
        9, 6, 5,
        1, 6, 9,
        15, 8, 5,
        1, 3, 4,
        6, 1, 8,
        1, 3, 7,
        8, 5, 8,
        2, 5, 6,
        3, 4, 6,
        1, 7, 6,
        2, 5, 3,
        5, 5, 1,
        2, 3, 7,
        1, 8, 1,
        10, 2, 9,
        5, 6, 3,
        7, 8, 5,
        4, 3, 5,
        1, 2, 1,
        2, 7, 6,
        5, 1, 5,
        1, 3, 7,
        1, 7, 6,
        3, 8, 5,
        4, 6, 4,
        1, 2, 9,
        5, 4, 6,
        21, 5, 3,
        2, 8, 4,
        3, 4, 1,
        1, 8, 4,
        18, 3, 5,
        2, 3, 6,
        2, 6, 9,
        2, 6, 2,
        1, 2, 9,
        19, 9, 4,
        3, 6, 3,
        2, 9, 4,
        1, 1, 2,
        1, 3, 7,
        16, 5, 2,
        4, 1, 9,
        3, 3, 4,
        4, 9, 8,
        3, 5, 1,
        22, 4, 5,
        1, 7, 2,
        22, 5, 9,
        2, 5, 2,
        2, 4, 6,
        10, 9, 5,
        1, 8, 3,
        13, 9, 2,
        1, 6, 3,
        19, 2, 7,
        2, 7, 4,
        1, 8, 4,
        1, 8, 2,
        11, 5, 7,
        3, 1, 7,
        8, 7, 8,
        1, 3, 5,
        1, 8, 3,
        1, 5, 3,
        6, 2, 3,
        1, 8, 7,
        1, 6, 1,
        1, 1, 8,
        4, 8, 1,
        1, 4, 6,
        8, 3, 9,
        2, 2, 3,
        3, 8, 5,
        1, 8, 2,
        4, 2, 7,
        5, 9, 7,
        1, 6, 3,
        4, 2, 4,
        23, 7, 5,
        4, 1, 2,
        3, 9, 6,
        2, 4, 8,
        2, 8, 3,
        2, 6, 1,
        1, 6, 8,
        8, 5, 3,
        5, 2, 6,
        5, 6, 3,
        1, 8, 3,
        4, 4, 7,
        15, 5, 2,
        1, 1, 9,
        2, 5, 1,
        4, 3, 7,
        1, 4, 9,
        4, 7, 1,
        2, 5, 6,
        7, 1, 2,
        6, 2, 3,
        16, 2, 5,
        1, 6, 3,
        1, 6, 3,
        9, 7, 4,
        6, 4, 6,
        1, 9, 8,
        23, 3, 9,
        1, 3, 4,
        3, 4, 5,
        9, 5, 2,
        6, 9, 7,
        7, 7, 5,
        5, 5, 3,
        1, 4, 6,
        3, 3, 8,
        6, 2, 1,
        3, 5, 6,
        4, 7, 1,
        2, 3, 9,
        5, 6, 8,
        19, 9, 6,
        1, 9, 2,
        9, 5, 9,
        4, 8, 3,
        5, 6, 1,
        4, 6, 1,
        2, 3, 8,
        17, 1, 7,
        2, 1, 2,
        6, 6, 9,
        4, 8, 5,
        3, 8, 2,
        3, 5, 6,
        4, 6, 8,
        2, 6, 9,
        4, 8, 7,
        9, 9, 5,
        5, 9, 4,
        7, 2, 8,
        1, 2, 1,
        3, 6, 5,
        6, 8, 5,
        1, 3, 4,
        1, 3, 1,
        12, 7, 2,
        5, 2, 7,
        8, 7, 5,
        1, 9, 3,
        5, 2, 8,
        3, 6, 3,
        2, 2, 3,
        1, 2, 4,
        2, 3, 4,
        1, 1, 6,
        14, 5, 6,
        1, 8, 6,
        3, 3, 7,
        4, 7, 1,
        9, 4, 3,
        3, 1, 4,
        1, 1, 2,
        1, 8, 4,
        8, 3, 1,
        1, 3, 2,
        5, 7, 6,
        3, 1, 6,
        2, 2, 8,
        13, 5, 3,
        5, 1, 3,
        3, 4, 5,
        1, 9, 2,
        4, 3, 9,
        1, 1, 7,
        2, 5, 8,
        1, 7, 5,
        2, 5, 4,
        1, 2, 6,
        1, 4, 5,
        7, 3, 6,
        31, 6, 1,
        25, 1, 7,
        2, 3, 2,
        13, 7, 9,
        1, 1, 6,
        1, 4, 1,
        2, 2, 9,
        1, 4, 6,
        3, 7, 1,
        7, 8, 3,
        1, 8, 2,
        1, 2, 8,
        4, 3, 4,
        1, 8, 7,
        3, 6, 9,
        5, 7, 6,
        1, 4, 7,
        5, 7, 9,
        5, 3, 6,
        3, 4, 7,
        1, 5, 4,
        4, 7, 9,
        32, 9, 1,
        1, 6, 5,
        1, 5, 9,
        4, 3, 8,
        5, 1, 4,
        4, 4, 9,
        6, 1, 7,
        4, 9, 8,
        4, 7, 8,
        1, 7, 1,
        1, 7, 6,
        7, 6, 3,
        1, 9, 5,
        2, 4, 7,
        25, 1, 6,
        1, 7, 1,
        1, 3, 4,
        18, 6, 8,
        1, 5, 1,
        3, 1, 6,
        21, 8, 3,
        1, 8, 4,
        2, 4, 2,
        1, 8, 1,
        1, 7, 6,
        5, 6, 3,
        30, 3, 1,
        4, 8, 6,
        1, 2, 9,
        1, 8, 5,
        9, 6, 5,
        2, 8, 7,
        3, 5, 9,
        2, 3, 4,
        1, 2, 1,
        1, 5, 8,
        1, 8, 3,
        2, 4, 6,
        1, 3, 1,
        1, 5, 6,
        5, 5, 7,
        4, 6, 8,
        3, 8, 2,
        1, 1, 5,
        1, 8, 7,
        4, 9, 6,
        1, 5, 1,
        4, 6, 8,
        6, 7, 3,
        4, 3, 9,
        2, 2, 7,
        1, 3, 5,
        3, 7, 6,
        2, 9, 8,
        1, 2, 4,
        1, 3, 4,
        5, 8, 4,
        1, 9, 2,
        1, 7, 5,
        3, 4, 5,
        1, 9, 1,
        1, 2, 7,
        1, 7, 1,
        5, 5, 4,
        4, 1, 4,
        19, 1, 9,
        6, 6, 2,
        12, 9, 1,
        1, 8, 6,
        1, 9, 4,
        4, 4, 8,
        1, 6, 5,
        1, 5, 3,
        2, 8, 9,
        5, 4, 6,
        5, 9, 4,
        1, 4, 3,
        2, 2, 9,
        1, 6, 5,
        1, 6, 9,
        7, 1, 5,
        1, 3, 1,
        2, 8, 3,
        1, 5, 7,
        2, 9, 8,
        ]


    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> part1(stacks, moves) end}),
      else:
        part1(stacks, moves)
        |> IO.inspect(label: "Part 1 Results")
  end
end
