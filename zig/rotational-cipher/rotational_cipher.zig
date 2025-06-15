const std = @import("std");
const mem = std.mem;

pub fn rotate(allocator: mem.Allocator, text: []const u8, shiftKey: u5) mem.Allocator.Error![]u8 {
    const encrypted = try allocator.alloc(u8, text.len);

    for(text, 0..) |curr, i| {
        encrypted[i] = switch (curr) {
            'A'...'Z' => (curr - 'A' + shiftKey) % 26 + 'A',
            'a'...'z' => (curr - 'a' + shiftKey) % 26 + 'a',
            else => curr
        };
    }

    return encrypted;
}
