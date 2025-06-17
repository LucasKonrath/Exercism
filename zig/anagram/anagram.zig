const std = @import("std");
const mem = std.mem;


pub fn sortedLowercase(allocator: mem.Allocator, s: []const u8) ![]const u8 {
    const lower = try allocator.alloc(u8, s.len);

    const lowerString = std.ascii.lowerString(lower, s);

    std.sort.heap(u8, lowerString, {}, std.sort.asc(u8));
    return lowerString;
}

pub fn toLowercase(allocator: mem.Allocator, s: []const u8) ![]const u8 {
    const lower: []u8 = try allocator.alloc(u8, s.len);
    _ = std.ascii.lowerString(lower, s);
    return lower;
}

pub fn detectAnagrams(
    allocator: mem.Allocator,
    word: []const u8,
    candidates: []const []const u8,
) !std.BufSet {
    var set = std.BufSet.init(allocator);

    const word_sorted = try sortedLowercase(allocator, word);
    defer allocator.free(word_sorted);


    const word_lower = try toLowercase(allocator, word);
    defer allocator.free(word_lower);

    for(candidates) | candidate | {
        if(candidate.len != word.len) continue;
        const candidate_lower = try toLowercase(allocator, candidate);
        defer allocator.free(candidate_lower);

        if (std.mem.eql(u8, word_lower, candidate_lower)) continue; // discard self comparison

        const candidate_sorted = try sortedLowercase(allocator, candidate);
        defer allocator.free(candidate_sorted);

        if (std.mem.eql(u8, word_sorted, candidate_sorted)) {
            try set.insert(candidate);
        }
    }
    return set;
}