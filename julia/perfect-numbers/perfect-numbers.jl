function isperfect(n)
    return !isabundant(n) && !isdeficient(n)
end

function isabundant(n)
    sum_divisors = sum(i for i in 1:div(n,2) if n % i == 0)
    return sum_divisors > n
end

function isdeficient(n)
    sum_divisors = sum(i for i in 1:div(n,2) if n % i == 0)
    return sum_divisors < n
end
