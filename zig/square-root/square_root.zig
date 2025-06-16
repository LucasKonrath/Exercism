pub fn squareRoot(radicand: usize) usize {
    var n: usize = 1;
    while(n * n < radicand) : (n += 1) {
        // do nothing
    }
    return n;
}
