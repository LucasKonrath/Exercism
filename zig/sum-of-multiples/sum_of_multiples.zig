const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {

    // declare set for unique mappings
    var set = try std.DynamicBitSet.initEmpty(allocator, limit + 1);
    defer set.deinit();

    for(factors) | factor | if(factor > 0) {
        var multiple = factor;
        while (multiple < limit) : (multiple += factor) set.set(multiple);
    };

    var sumFactors: u64 = 0;

    var iter = set.iterator(.{});
    while(iter.next()) |value| {
        sumFactors += value;
    }

    return sumFactors;
}
