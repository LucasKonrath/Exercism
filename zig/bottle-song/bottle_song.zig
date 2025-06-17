const std = @import("std");

fn bottleCount(n: u32) []const u8{
    return switch(n) {
        0 => "No green bottles",
        1 => "One green bottle",
        2 => "Two green bottles",
        3 => "Three green bottles",
        4 => "Four green bottles",
        5 => "Five green bottles",
        6 => "Six green bottles",
        7 => "Seven green bottles",
        8 => "Eight green bottles",
        9 => "Nine green bottles",
        10 => "Ten green bottles",
        else => "many bottles",
    };
}

fn lowerFirst(s: []const u8, buf: []u8) []const u8 {
    if(s.len == 0) return s;
    buf[0] = std.ascii.toLower(s[0]);
    std.mem.copyForwards(u8, buf[1..], s[1..]);
    return buf[0..s.len];
}

pub fn recite(buffer: []u8, start_bottles: u32, take_down: u32) []const u8 {
    var buf = buffer;
    var iter: usize = 0;
    var bottles = start_bottles;
    var lower_buf: [32]u8 = undefined;

    for(0..take_down) | i | {
        if(bottles == 0) break;
        const next = if (bottles > 0) bottles - 1 else 0;

        const filledVerse = std.fmt.bufPrint(
            buf,
            "{s} hanging on the wall,\n{s} hanging on the wall,\nAnd if one green bottle should accidentally fall,\nThere'll be {s} hanging on the wall",
            .{ bottleCount(bottles), bottleCount(bottles), lowerFirst(bottleCount(next), &lower_buf) },
        ) catch return buffer[0..iter];

        iter += filledVerse.len;
        buf = buf[filledVerse.len..];

        if (buf.len > 0) {
            buf[0] = '.';
            iter += 1;
            buf = buf[1..];
        }

        if (i != take_down - 1 and next != 0) {
            if (buf.len > 0) {
                buf[0] = '\n';
                iter += 1;
                buf = buf[1..];

                if (buf.len > 0) {
                    buf[0] = '\n';
                    iter += 1;
                    buf = buf[1..];
                }
            }
        }

        bottles = next;
    }

    return buffer[0..iter];
}
