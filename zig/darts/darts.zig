const std = @import("std");

pub const Coordinate = struct {
    // This struct, as well as its fields and methods, needs to be implemented.
    x: f32,
    y: f32,
    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate {.x = x_coord, .y = y_coord };
    }
    pub fn score(self: Coordinate) usize {
        const radius = @sqrt((self.x * self.x) + (self.y * self.y));
        if (radius <= 1) {
            return 10;
        } else if (radius <= 5){
            return 5;
        } else if (radius <= 10){
            return 1;
        } else {
            return 0;
        }
    }
};
