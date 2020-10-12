class Player < ApplicationRecord
  belongs_to :room
  COLORS = [
    "#FF00FF",
    "#FFD700",
    "#DC143C",
    "#32CD32",
    "#00FF7F",
    "#9ACD32",
    "#20B2AA",
    "#00FFFF",
    "#7FFFD4",
    "#7B68EE",
    "#A52A2A",
    "#FFFAFA",
    "#BDB76B",
    "#FF6347",
    "#FF8C00",
    "#9400D3",
    "#483D8B",
    "#ADFF2F",
    "#228B22",
  ]
  attribute :color, default: -> { COLORS.sample }
end
