pub const Category = enum {
    ones,
    twos,
    threes,
    fours,
    fives,
    sixes,
    full_house,
    four_of_a_kind,
    little_straight,
    big_straight,
    choice,
    yacht,
};

pub fn score(dice: [5]u3, category: Category) u32 {
    var counts = [_]u32{0} ** 7;
    for (dice) |die| {
        counts[die] += 1;
    }

    return switch (category) {
        .ones => counts[1] * 1,
        .twos => counts[2] * 2,
        .threes => counts[3] * 3,
        .fours => counts[4] * 4,
        .fives => counts[5] * 5,
        .sixes => counts[6] * 6,
        .four_of_a_kind => blk: {
            for (1..7) |i| {
                if (counts[i] >= 4) {
                    break :blk @as(u32, @intCast(i)) * 4;
                }
            }
            break :blk 0;
        },
        .full_house => blk: {
            var has_three = false;
            var has_two = false;
            for (1..7) |i| {
                if (counts[i] == 3) has_three = true;
                if (counts[i] == 2) has_two = true;
            }
            if (has_three and has_two) {
                var sum: u32 = 0;
                for (dice) |d| sum += d;
                break :blk sum;
            }
            break :blk 0;
        },
        .little_straight => blk: {
            if (counts[1] == 1 and counts[2] == 1 and counts[3] == 1 and
                counts[4] == 1 and counts[5] == 1) {
                break :blk 30;
            }
            break :blk 0;
        },
        .big_straight => blk: {
            if (counts[2] == 1 and counts[3] == 1 and counts[4] == 1 and
                counts[5] == 1 and counts[6] == 1) {
                break :blk 30;
            }
            break :blk 0;
        },
        .choice => blk: {
            var sum: u32 = 0;
            for (dice) |d| sum += d;
            break :blk sum;
        },
        .yacht => blk: {
            for (1..7) |i| {
                if (counts[i] == 5) {
                    break :blk 50;
                }
            }
            break :blk 0;
        },
    };
}