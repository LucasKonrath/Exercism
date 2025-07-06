pub fn LinkedList(comptime T: type) type {
    return struct {

        const Self = @This();

        // Please implement the doubly linked `Node` (replacing each `void`).
        pub const Node = struct {
            prev: ?*Node = null,
            next: ?*Node=null,
            data: T,
        };

        // Please implement the fields of the linked list (replacing each `void`).
        first: ?*Node=null,
        last: ?*Node=null,
        len: usize = 0,

        // Please implement the below methods.
        // You need to add the parameters to each method.

        pub fn push(self: *Self, new: *Node) void {
            if(self.first) |f| {
                // List is not empty
                f.next = new;
                new.prev = f;
            } else {
                // List is empty
                self.first = new;
            }

            self.first = new;
            if(self.last == null) {
                self.last = new;
            }

            self.len += 1;
        }

        pub fn pop(self: *Self) ?*Node {
            if(self.first) |f| {
                self.len -= 1;
                const second = f.prev;
                if (second) |s| {
                    s.next = null;
                }
                self.first = second;
                if(self.last == f){
                    self.last = null;
                }
                f.prev = null;
                return f;
            } else {
                return null; // List is empty
            }
        }

        pub fn shift(self: *Self) ?*Node {
            if(self.last) |l| {
                self.len -= 1;
                const second = l.next;
                if (second) |s| {
                    s.prev = null;
                }
                self.last = second;
                if(self.first == l){
                    self.first = null;
                }
                l.next = null;
                return l;
            } else {
                return null; // List is empty
            }
        }

        pub fn unshift(self: *Self, new: *Node) void {
            self.len += 1;
            if(self.last) |l| {
                l.prev = new;
                new.next = l;
            }
            self.last = new;
            if(self.first == null){
                self.first = new; // Handle empty list
            }
        }

        pub fn delete(self: *Self, toDelete: *Node) void {
            const prev = toDelete.prev;
            const next = toDelete.next;
            if (prev) |p| {
                p.next = next;
            }
            if (next) |n| {
                n.prev = prev;
            }

            if(prev != null or next != null or self.first == toDelete){
                self.len -= 1; // Only decrement if the node is actually in the list
            }

            if(self.first == toDelete){
                self.first = prev;
            }
            if(self.last == toDelete){
                self.last = next;
            }
        }
    };
}
