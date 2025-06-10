pub fn colorCode(colors: [2]ColorBand) usize {
    const first = @intFromEnum(colors[0]);
    const second = @intFromEnum(colors[1]);
    return first * 10 + second;
}


pub const ColorBand = enum(usize){
    black = 0,
    brown = 1,
    red = 2,
    orange = 3,
    yellow = 4,
    green = 5,
    blue = 6,
    violet = 7,
    grey = 8,
    white = 9
};