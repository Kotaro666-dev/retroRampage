//
// Created by Kotaro Kamashima on 2022/11/08.
// Copyright (c) 2022 Nick Lockwood. All rights reserved.
//

public enum Tile: Int, Decodable {
    case floor
    case wall
}

public extension Tile {
    var isWall: Bool {
        switch self {
        case .floor:
            return false
        case .wall:
            return true
        }
    }
}

public struct Tilemap: Decodable {
    private let tiles: [Tile]
    public let things: [Thing]
    public let width: Int
}

public extension Tilemap {
    var height: Int {
        return tiles.count / width
    }

    var size: Vector {
        return Vector(x: Double(width), y: Double(height))
    }

    subscript(x: Int, y: Int) -> Tile {
        return tiles[y * self.width + x]
    }
}