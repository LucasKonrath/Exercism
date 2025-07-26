// TODO: please define the 'Approval' custom type
pub type Approval {
  Yes
  No
  Maybe
}

// TODO: please define the 'Cuisine' custom type
pub type Cuisine {
  Korean
  Turkish
}

// TODO: please define the 'Genre' custom type

pub type Genre {
  Romance
  Thriller
  Horror
  Crime
}

// TODO: please define the 'Activity' custom type

pub type Activity {
  BoardGame
  Chill
  Movie(Genre)
  Restaurant(Cuisine)
  Walk(Int)
}

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
    Movie(genre) if genre == Romance -> Yes
    Restaurant(Korean) -> Yes
    Restaurant(Turkish) -> Maybe
    Walk(time) if time > 11 -> Yes
    Walk(time) if time > 6 -> Maybe
    _ -> No
  }
}
