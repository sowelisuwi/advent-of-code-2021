CountIncreases[list_] := Count[Differences[list], _?Positive]

SlidingWindowSums[list_, n_] := Map[Total, Partition[list, n, 1]]

input = ReadList["input.txt", Number]

Print[CountIncreases[input]] # part 1
Print[CountIncreases[SlidingWindowSums[input, 3]]] # part 2
