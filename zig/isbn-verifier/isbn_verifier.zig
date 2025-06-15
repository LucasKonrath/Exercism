pub fn isValidIsbn10(s: []const u8) bool {
    var digitsUsed: u8 = 0;
    var sum: u32 = 0;

    for(s) |digit|{
        if(digitsUsed == 10){
            return false;
        }

        if(digit == '-'){
            continue;
        }

        if(digit == 'X' and digitsUsed == 9){
            sum += 10;
            digitsUsed += 1;
            continue;
        }

        if(digit >= '0' and digit <= '9'){
            sum += (digit - '0') * (10 - digitsUsed);
            digitsUsed += 1;
            continue;
        }
        return false;
    }
    return digitsUsed == 10 and sum % 11 == 0;
}
