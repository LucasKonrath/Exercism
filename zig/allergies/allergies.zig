const std = @import("std");
const EnumSet = std.EnumSet;

pub const Allergen = enum(u8) {
    eggs = 1,
    peanuts = 2,
    shellfish = 4,
    strawberries = 8,
    tomatoes = 16,
    chocolate = 32,
    pollen = 64,
    cats = 128,
};

pub fn isAllergicTo(score: u8, allergen: Allergen) bool {
    return @intFromEnum(allergen) & score  > 0;
}

pub fn initAllergenSet(score: usize) EnumSet(Allergen) {
    var set = EnumSet(Allergen) {};
    // lower from usize to u8
    const score_u8: u8 = @truncate(score);

    for(std.enums.values(Allergen)) |allergen| {
        if(isAllergicTo(score_u8, allergen)){
            set.insert(allergen);
        }
    }
    return set;
}
