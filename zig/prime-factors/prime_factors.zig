const std = @import("std");
const mem = std.mem;

pub fn factors(allocator: mem.Allocator, value: u64) mem.Allocator.Error![]u64 {
    var result = std.ArrayList(u64).init(allocator);
    defer result.deinit();

    var n = value;

    var divisor: u64 = 2;

    while (n % divisor == 0) {
        try result.append(2);
        n /= 2;
    }

    divisor = 3;

    while (divisor * divisor <= n) {
        while (n % divisor == 0) {
            try result.append(divisor);
            n /= divisor;
        }
        divisor += 2;
    }

    if(n > 1) {
        try result.append(n);
    }

    return result.toOwnedSlice();
}
