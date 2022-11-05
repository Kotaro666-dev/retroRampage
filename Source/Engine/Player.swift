//
// Created by Kotaro Kamashima on 2022/11/05.
// Copyright (c) 2022 Nick Lockwood. All rights reserved.
//

public struct Player {
    public var position: Vector
    public var velocity: Vector

    public init(position: Vector) {
        self.position = position
        self.velocity = Vector(x: 1, y: 1)
    }
}

public extension Player {
    mutating func update(timeStep: Double) {
        position += velocity * timeStep
        position.x.formTruncatingRemainder(dividingBy: 8)
        position.y.formTruncatingRemainder(dividingBy: 8)
    }
}