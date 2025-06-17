const std = @import("std");

pub const Plant = enum {
    clover,
    grass,
    radishes,
    violets,
};

pub const Student = enum { Alice, Bob, Charlie, David, Eve, Fred, Ginny, Harriet, Ileana, Joseph, Kincaid, Larry };


pub fn plants(diagram: []const u8, student: []const u8) [4]Plant {
    var result: [4]Plant = undefined;
    const index: usize = @intFromEnum(std.meta.stringToEnum(Student, student).?);
    const first = index * 2;
    const second = first + (diagram.len / 2) + 1;

    const values = &[4]u8{
        diagram[first],
        diagram[first + 1],
        diagram[second],
        diagram[second + 1],
    };

    for (values, 0..) |value, i| {
        result[i] = switch (value) {
            'C' => .clover,
            'G' => .grass,
            'R' => .radishes,
            'V' => .violets,
            else => unreachable,
        };
    }

    return result;

}
