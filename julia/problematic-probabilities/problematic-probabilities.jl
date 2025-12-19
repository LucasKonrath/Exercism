using Statistics

function rationalize(successes, trials)
    successes .// trials
end

function probabilities(successes, trials)
    successes ./ trials
end

function checkmean(successes, trials)
    rational = mean(rationalize(successes, trials))
    real = mean(probabilities(successes, trials))
    if float(rational) == real
        true
    else
        rational
    end    
end

function checkprob(successes, trials)
    rational = prod(rationalize(successes, trials))
    real = prod(probabilities(successes, trials))
    if float(rational) == real
        true
    else
        rational
    end
end
