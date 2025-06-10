const std = @import("std");

pub fn modifier(score: i8) i8 {
    return @divFloor(score - 10, 2);
}

pub fn ability() i8 {

    const rand = std.crypto.random;
    var die: [4]i8 = undefined;
    for(0 .. 4) |i| {
        die[i] = rand.intRangeAtMost(i8, 1, 6);
    }

    std.mem.sort(i8, &die, {}, std.sort.desc(i8));

    return die[0] + die[1] + die[2];

}

pub const Character = struct {
    strength: i8,
    dexterity: i8,
    constitution: i8,
    intelligence: i8,
    wisdom: i8,
    charisma: i8,
    hitpoints: i8,

    pub fn init() Character {
        var c: Character = undefined;
        for([_]*i8{&c.strength, &c.dexterity, &c.constitution,
                        &c.intelligence, &c.wisdom, &c.charisma}) |ap| {
            ap.* = ability();
        }
        c.hitpoints = 10 + modifier(c.constitution);
        return c;
    }
};
