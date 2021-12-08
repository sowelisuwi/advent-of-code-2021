Distances[xs_, y_] := Map[Abs[y - #] &, xs]

Fuel1[xs_] = Total @ Distances[xs, Median[xs]]

Fuel2[xs_, f_] := Total @ PolygonalNumber @ Distances[xs, f @ Mean[xs]]
Fuel2[xs_] := Min[Fuel2[xs, Floor], Fuel2[xs, Ceiling]]

input = First[Import[DirectoryName[$InputFileName] <> "input.txt", "CSV"]]

Print[Fuel1[input]] # part 1
Print[Fuel2[input]] # part 2
