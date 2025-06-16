const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var acronym = std.ArrayList(u8).init(allocator);
    var wordsTokenized = std.mem.tokenizeAny(u8, words, " _-");
    while (wordsTokenized.next()) |word| {
        try acronym.append(word[0] & '_');
    }
    return acronym.toOwnedSlice();
}