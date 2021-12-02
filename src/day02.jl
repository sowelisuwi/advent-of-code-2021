@enum CommandKind begin
    Forward
    Down
    Up
end

CommandKind(s) = Dict(
    "forward" => Forward,
    "up" => Up,
    "down" => Down
)[s]

struct Command
    kind::CommandKind
    n::UInt
end

function Command(s)
    kind, n = split(s, ' ')
    Command(CommandKind(kind), parse(UInt, n))
end

data = map(Command, readlines())

function part1(data)
    h = 0
    v = 0

    for cmd in data
        if cmd.kind == Forward
            h += cmd.n
        elseif cmd.kind == Down
            v += cmd.n
        elseif cmd.kind == Up
            v -= cmd.n
        end
    end

    h * v
end

println(part1(data))

function part2(data)
    aim = 0
    h = 0
    v = 0

    for cmd in data
        if cmd.kind == Forward
            h += cmd.n
            v += aim * cmd.n
        elseif cmd.kind == Down
            aim += cmd.n
        elseif cmd.kind == Up
            aim -= cmd.n
        end
    end

    h * v
end

println(part2(data))
