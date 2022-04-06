// Copyright © 2022 Vertica A/S. All rights reserved.

enum MeetingRoomName: String {
    case lemmings,

         tekken,
         spaceInvaders = "spaceinvaders",
         zelda,
         diablo,
         portal,

         bubbleBobble = "bubblebobble",
         doom,
         fallout,
         worms,
         halfLife = "halflife",

         wolfenstein,
         superMario = "supermario",
         quake,
         hastyHardy = "hastyhardy",
         pacman,
         warcraft,

         unknown

    var description: String {
        switch self {
        case .lemmings:
            return "Lemmings"
        case .tekken:
            return "Tekken"
        case .spaceInvaders:
            return "Space Invaders"
        case .zelda:
            return "Zelda"
        case .diablo:
            return "Diablo"
        case .portal:
            return "Portal"
        case .bubbleBobble:
            return "Bubble Bobble"
        case .doom:
            return "Doom"
        case .fallout:
            return "Fallout"
        case .worms:
            return "Worms"
        case .halfLife:
            return "Half Life"
        case .wolfenstein:
            return "Wolfenstein"
        case .superMario:
            return "Super Mario"
        case .quake:
            return "Quake"
        case .hastyHardy:
            return "Hasty Hardy"
        case .pacman:
            return "Pacman"
        case .warcraft:
            return "Warcraft"
        case .unknown:
            return "Ukendt"
        }
    }

    var imageName: String {
        switch self {
        case .lemmings:
            return "lemmings"
        case .tekken:
            return "tekken"
        case .spaceInvaders:
            return "space-invaders"
        case .zelda:
            return "zelda"
        case .diablo:
            return "diablo"
        case .portal:
            return "portal"
        case .bubbleBobble:
            return "bubble-bobble"
        case .doom:
            return "doom"
        case .fallout:
            return "fallout"
        case .worms:
            return "worms"
        case .halfLife:
            return "half-life"
        case .wolfenstein:
            return "wolfenstein"
        case .superMario:
            return "super-mario"
        case .quake:
            return "quake"
        case .hastyHardy:
            return "hasty-hardy"
        case .pacman:
            return "pacman"
        case .warcraft:
            return "warcraft"
        case .unknown:
            return "ukendt"
        }
    }
}
