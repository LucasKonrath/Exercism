import gleam/list
import gleam/string

pub fn first_letter(name: String) {
  name |> string.trim |> string.slice(0, 1)
}

pub fn initial(name: String) {
  first_letter(name) |> string.uppercase |> string.append(".")
}

pub fn initials(full_name: String) {
  full_name |> string.split(" ") |> list.map(initial) |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) {
  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     " <> initials(full_name1) <> "  +  " <> initials(full_name2) <> "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}
