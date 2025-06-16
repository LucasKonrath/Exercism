const std = @import("std");

pub fn primes(buffer: []u32, comptime limit: u32) []u32 {
    var sieve = std.StaticBitSet(limit + 1).initEmpty();
    sieve.set(0);
    sieve.set(1);

    var index: u32 = 0;
    var currentNumber: u32 = 2;

    while(currentNumber <= limit) : (currentNumber += 1){
        if(!sieve.isSet(currentNumber)){
            buffer[index] = currentNumber;
            index += 1;
            var squared = currentNumber * currentNumber;
            while(squared <= limit) : (squared += currentNumber) {
                sieve.set(squared);
            }
        }
    }
    return buffer[0..index];
}
