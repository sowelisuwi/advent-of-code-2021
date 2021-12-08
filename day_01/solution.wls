#!/usr/bin/env wolframscript

Increases[list_] := Count[Differences[list], _?Positive]

SlidingWindowSums[list_, n_] := Map[Total, Partition[list, n, 1]]

input = ReadList[DirectoryName[$InputFileName] <> "input.txt", Number]

Print[Increases[input]] (* part 1 *)
Print[Increases[SlidingWindowSums[input, 3]]] (* part 2 *)
