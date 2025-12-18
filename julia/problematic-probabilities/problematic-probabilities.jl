function rationalize(successes, trials)
    vec = Rational{Int64}[]
    for i = 0; i <= trials; i += 1
        push!(vec, Rational(successes, trials))
    end
    return vec  
end

function probabilities(successes, trials)

end

function checkmean(successes, trials)

end

function checkprob(successes, trials)

end
