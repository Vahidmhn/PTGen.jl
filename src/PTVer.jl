function PTVer(A,b; inf = 1e9)
    # Ax <= b
    (m,n) = size(A)

    # Initial big space
    Ver = [VerticeType(-inf*ones(n),GenNeighbor(zeros(n)),GenCuts(zeros(n)))]
    for i = 1:2^n-1
        P = zeros(n);
        point = Int2Bin(i,n)
        P[point .== 1] = inf
        P[point .== 0] = -inf
        push!(Ver,VerticeType(P,GenNeighbor(point),GenCuts(point)))
    end
    # The polytope
    CutNum = 2*n + 1
    for i = 1:m
        Cut = A[i,:]
        push!(Cut, -b[i])
        Ver = Vert(deepcopy(Ver),Cut,CutNum)
        CutNum += 1
    end

    # Removing infinity corners
    i = 1
    while i<=length(Ver)
        if any(Ver[i].Point .== inf) || any(Ver[i].Point .== -inf)
            deleteat!(Ver,i)
        else
            i += 1
        end
    end
    ver = zeros(length(Ver),n)
    for i = 1:length(Ver)
        ver[i,:] = Ver[i].Point
    end
    ver
end
