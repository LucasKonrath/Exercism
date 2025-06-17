const std = @import("std");

fn isQuestion(s: []const u8) bool {
    return s.len > 0 and s[s.len - 1] == '?';
}

fn isYelling(s: []const u8) bool {
    var allUpper = false;
    for (s) |c| {
        if (std.ascii.isAlphabetic(c)) {
            allUpper = true;
            if (std.ascii.isLower(c)) {
                return false;
            }
        }
    }
    return allUpper;
}

pub fn response(s: []const u8) []const u8 {
    const trim = std.mem.trim(u8, s, " \t\n\r");
    if (trim.len == 0) {
        return "Fine. Be that way!";
    }

    const question = isQuestion(trim);
    const yelling = isYelling(trim);

    if(question and yelling) return "Calm down, I know what I'm doing!";
    if(yelling) return "Whoa, chill out!";
    if(question) return "Sure.";

    return "Whatever.";
}
