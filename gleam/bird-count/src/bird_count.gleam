import gleam/bool
import gleam/list
import gleam/option.{None, Some}

pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [day, ..] -> day
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [day, ..rest] -> [day + 1, ..rest]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [] -> False
    [0, ..] -> True
    [_, ..rest] -> has_day_without_birds(rest)
  }
}

pub fn total(days: List(Int)) -> Int {
  list.fold(days, 0, fn(acc, day) { acc + day })
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [today, ..rest] if today >= 5 -> 1 + busy_days(rest)
    [_, ..rest] -> busy_days(rest)
  }
}
