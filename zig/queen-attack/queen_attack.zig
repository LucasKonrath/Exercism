pub const QueenError = error{
    InitializationFailure,
};

pub const Queen = struct {
    x: i8,
    y: i8,

    pub fn init(row: i8, col: i8) QueenError!Queen {

        if((row < 0 or row >= 8) or (col < 0 or col >= 8)){
            return QueenError.InitializationFailure;
        }

        return Queen { .x = row, .y = col };
    }

    pub fn canAttack(self: Queen, other: Queen) QueenError!bool {
        const sameCol: bool = (self.x == other.x);
        const sameRow: bool = (self.y == other.y);
        const upperDiagonal = ((self.x - other.x) == (self.y - other.y));
        const lowerDiagonal = ((self.x - other.x) == (other.y - self.y));
        return sameRow or sameCol or upperDiagonal or lowerDiagonal;
    }
};
