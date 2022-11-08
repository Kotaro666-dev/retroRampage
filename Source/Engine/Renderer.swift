//
// Created by Kotaro Kamashima on 2022/11/05.
// Copyright (c) 2022 Nick Lockwood. All rights reserved.
//

public struct Renderer {
    public private(set) var bitmap: Bitmap

    public init(width: Int, height: Int) {
        bitmap = Bitmap(width: width, height: height, color: .black)
    }
}

public extension Renderer {
    mutating func draw(_ world: World) {
        let scale = Double(bitmap.height) / world.size.y

        /// Draw map
        for y in 0..<world.map.height {
            for x in 0..<world.map.width where world.map[x, y].isWall {
                let rect = Rect(min: Vector(x: Double(x), y: Double(y)) * scale, max: Vector(x: Double(x + 1), y: Double(y + 1)) * scale)
                bitmap.fill(rect: rect, color: .white)
            }
        }

        /// Draw player
        var rect = world.player.rect
        rect.min *= scale
        rect.max *= scale
        bitmap.fill(rect: rect, color: .blue)
    }
}