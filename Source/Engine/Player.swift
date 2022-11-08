//
// Created by Kotaro Kamashima on 2022/11/05.
// Copyright (c) 2022 Nick Lockwood. All rights reserved.
//

public struct Player {
    public var position: Vector
    public var velocity: Vector
    public let speed: Double = 2
    public let radius = 0.25

    public init(position: Vector) {
        self.position = position
        self.velocity = Vector(x: 0, y: 0)
    }
}

public extension Player {
    var rect: Rect {
        let halfSize = Vector(x: radius, y: radius)
        return Rect(min: position - halfSize, max: position + halfSize)
    }

    func isIntersection(map: Tilemap) -> Bool {
        let minX = Int(rect.min.x), maxX = Int(rect.max.x)
        let minY = Int(rect.min.y), maxY = Int(rect.max.y)
        for y in minY...maxY {
            for x in minX...maxX {
                if map[x, y].isWall {
                    return true
                }
            }
        }
        return false
    }
}