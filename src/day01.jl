countdelta_helper(op) =
    ((count, prev), cur) -> (count + op(cur, prev), cur)

countdelta(op, (head, tail...)) =
    first(foldl(countdelta_helper(op), tail; init=(0, head)))

countinc(xs) = countdelta(>, xs)

data = map(s -> parse(Int, s), readlines())

println(countinc(data))

using Base.Iterators

function partition(xs; size, step=size)
    @assert size > 0
    @assert step > 0

    acc = []

    while length(xs) >= size
        push!(acc, take(xs, size))
        xs = drop(xs, step)
    end

    acc
end

println(countinc(map(sum, partition(data; size=3, step=1))))