const std = @import("std");
const mem = std.mem;

pub const ConversionError = error{
    InvalidInputBase,
    InvalidOutputBase,
    InvalidDigit,
};

/// Converts `digits` from `input_base` to `output_base`, returning a slice of digits.
/// Caller owns the returned memory.
pub fn convert(
    allocator: mem.Allocator,
    digits: []const u32,
    input_base: u32,
    output_base: u32,
) (mem.Allocator.Error || ConversionError)![]u32 {
    const number = try to_number(digits, input_base);
    return to_digits(allocator, number, output_base);
}

pub fn to_number(digits: []const u32, base: u32) (mem.Allocator.Error || ConversionError)!u32 {
    if (base < 2) return ConversionError.InvalidInputBase;
    var result: u32 = 0;
    for (digits, 1..) |d, i| {
        if (d >= base) {
            return error.InvalidDigit;
        }
        const mul = std.math.pow(usize, base, digits.len - i);
        result += d * @as(u32, @intCast(mul));
    }
    return result;
}

pub fn to_digits(
    allocator: mem.Allocator,
    number: u32,
    base: u32,
) ![]u32 {
    if (base < 2) return ConversionError.InvalidOutputBase;

    if (number == 0) {
        const zero = try allocator.alloc(u32, 1);
        zero[0] = 0;
        return zero;
    }

    var digits = std.ArrayList(u32).init(allocator);
    defer digits.deinit();

    var n = number;
    while (n > 0) {
        const digit = n % base;
        try digits.append(digit);
        n /= base;
    }
    // Reverse the digits to get the correct order
    std.mem.reverse(u32, digits.items);
    return digits.toOwnedSlice();
}
