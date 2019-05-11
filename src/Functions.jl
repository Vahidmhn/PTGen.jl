function Point2ID(X)
    Y = 0
    for ii = 1:length(X)
        Y += X[ii]*2^(ii-1);
    end
    Y
end

function GenNeighbor(X)
    N = length(X)
    Y = zeros(N)
    for ii = 1:N
        temp = copy(X)
        temp[ii] = 1-temp[ii]
        Y[ii] = Point2ID(temp) + 1
    end
    sort!(Y)
    Y
end

function GenCuts(X)
    N = length(X)
    Y = zeros(N)
    for ii = 1:N
        Y[ii] = ii + X[ii]*N
    end
    sort!(Y)
end


function Int2Bin(X,N)
    Y = zeros(N)
    for ii = N:-1:1
        Y[ii] = floor(X/2^(ii-1))
        X = X - Y[ii]*2^(ii-1)
    end
    Y
end
include("FindIntersectingPoint.jl")
include("Vert.jl")
include("PTVer.jl")
