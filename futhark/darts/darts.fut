def score (x: f64) (y: f64): i32 = 
let sqr = x * x + y * y
in if sqr <= 1.0 then 10
    else if sqr <= 25.0 then 5
    else if sqr <= 100.0 then 1
    else 0
