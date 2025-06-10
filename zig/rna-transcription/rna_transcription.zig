// Import the appropriate standard library and modules
const std = @import("std");
const mem = std.mem;
const RnaError = error{OutOfMemory};

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    const result = try allocator.alloc(u8, dna.len);
    var index: usize = 0;
    for(dna) |character| {
        const rnaComplement: u8 = switch(character) {
            'G' => 'C',
            'C' => 'G',
            'T' => 'A',
            'A' => 'U',
            else => return mem.Allocator.Error.OutOfMemory,
        };
        result[index] = rnaComplement;
        index += 1;
    }
    return result;
}