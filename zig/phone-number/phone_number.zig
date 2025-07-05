const std = @import("std");

pub fn clean(phrase: []const u8) ?[10]u8 {
    var number: [10]u8 = undefined;
    var digitsUsed: u8 = 0;

    for(std.mem.trim(u8, phrase, " ")) |c| {
        if (digitsUsed >= 10) {
            return null; // More than 10 digits, invalid
        } else if (digitsUsed == 0 or digitsUsed == 3 or digitsUsed == 6) {
            if (c >= '2' and c <= '9') {
                number[digitsUsed] = c;
                digitsUsed += 1;
            }
        } else {
            if (c >= '0' and c <= '9') {
                number[digitsUsed] = c;
                digitsUsed += 1;
            }
        }
    }
    return if (digitsUsed == 10) number else null;
}
