pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

/// Asserts that `n` is nonzero.
pub fn classify(n: u64) Classification {
    if(n == 1 ) return .deficient;

    var sum: u64 = 0;
    var i: u64 = 1;

    while(i <= n / 2 ) : (i += 1){
        if(n % i == 0) {
            sum += i;
        }
    }

    if(sum < n) {
        return .deficient;
    } else if(sum == n) {
        return .perfect;
    } else {
        return .abundant;
    }
}
