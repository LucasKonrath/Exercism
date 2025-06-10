const std = @import("std");

pub fn convert(buffer: []u8, n: u32) []const u8 {

    var stream = std.io.fixedBufferStream(buffer);

    if (shouldPrintNumber(n)){
        stream.writer().print("{d}", .{n}) catch unreachable;
        return stream.getWritten();
    }

    if(shouldPling(n)) stream.writer().writeAll("Pling") catch unreachable;
    if(shouldPlang(n)) stream.writer().writeAll("Plang") catch unreachable;
    if(shouldPlong(n)) stream.writer().writeAll("Plong") catch unreachable;

    return stream.getWritten();
}

pub fn shouldPrintNumber(n: u32) bool {
    return !shouldPlang(n) and !shouldPling(n) and !shouldPlong(n);
}

pub fn shouldPling(n: u32) bool {
    return n % 3 == 0;
}

pub fn shouldPlang(n: u32) bool {
    return n % 5 == 0;
}

pub fn shouldPlong(n: u32) bool {
    return n % 7 == 0;
}