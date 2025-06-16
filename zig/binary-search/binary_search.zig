// Take a look at the tests, you might have to change the function arguments
pub fn binarySearch(comptime T: type, target: usize, items: []const T) ?usize {

    var leftPointer: usize = 0;
    var rightPointer: usize = items.len;

    while(leftPointer < rightPointer){

        const mid = (leftPointer + rightPointer) / 2;

        if(items[mid] < target){
            leftPointer = mid + 1;
        } else if (target < items[mid]){
            rightPointer = mid;
        } else if (items[mid] == target){
            return mid;
        }
    }

    return null;

}
