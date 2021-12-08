#!/usr/bin/env -S wolframscript -print

PositionDelta1[{"forward", n_}] := {n, 0}
PositionDelta1[{"down", n_}] := {0, n}
PositionDelta1[{"up", n_}] := {0, -n}

Position1[commands_] := Total @ Map[PositionDelta1, commands]

PositionDelta2[{{x_, y_}, aim_}, {"forward", n_}] := {{x + n, y + aim * n}, aim}
PositionDelta2[{pos_, aim_}, {"down", n_}] := {pos, aim + n}
PositionDelta2[{pos_, aim_}, {"up", n_}] := {pos, aim - n}

Position2[commands_] := First @ Fold[PositionDelta2, {{0, 0}, 0}, commands]

input = Import[DirectoryName[$InputFileName] <> "input.txt", "Data"]

{Times @@ Position1[input], Times @@ Position2[input]}
