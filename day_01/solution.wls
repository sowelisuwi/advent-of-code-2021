#!/usr/bin/env -S wolframscript -print

Increases[list_] := Count[Differences[list], _?Positive]

SlidingWindowSums[list_, n_] := Map[Total, Partition[list, n, 1]]

input = ReadList[DirectoryName[$InputFileName] <> "input.txt", Number]

{Increases[input], Increases[SlidingWindowSums[input, 3]]}
