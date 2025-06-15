const std = @import("std");
const mem = std.mem;

pub fn rotate(allocator: mem.Allocator, text: []const u8, shiftKey: u5) mem.Allocator.Error![]u8 {
    const encrypted = try allocator.alloc(u8, text.len);

    for(0..text.len) |curr| {
        const currChar = text[curr];
        if(currChar >= 'A' and currChar <= 'Z'){
            encrypted[curr] = (currChar - 'A' + shiftKey) % 26 + 'A';
        } else if (currChar >= 'a' and currChar <= 'z'){
            encrypted[curr] = (currChar - 'a' + shiftKey) % 26 + 'a';
        } else {
            encrypted[curr] = currChar;
        }
    }

    return encrypted;
}
