import gleam/int.{max}
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    None -> "Mighty Magician"
    Some(name) -> name
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health <= 0 {
    True ->
      case player.level >= 10 {
        True -> Some(Player(player.name, player.level, 100, Some(100)))
        False -> Some(Player(player.name, player.level, 100, player.mana))
      }
    False -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    None -> #(Player(..player, health: player.health - cost |> max(0)), 0)
    Some(mana) ->
      case mana {
        m if m < cost -> #(player, 0)
        m -> #(Player(..player, mana: Some(m - cost)), 2 * cost)
      }
  }
}
