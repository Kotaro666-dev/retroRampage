//
// Created by Kotaro Kamashima on 2022/11/05.
// Copyright (c) 2022 Nick Lockwood. All rights reserved.
//

public struct Vector {
    public var x, y: Double

    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

public extension Vector {
    var length: Double {
        return (x * x + y * y).squareRoot()
    }

    static func +(lhs: Vector, rhs: Vector) -> Vector {
        Vector(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    static func -(lhs: Vector, rhs: Vector) -> Vector {
        Vector(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }

    static func *(lhs: Vector, rhs: Double) -> Vector {
        Vector(x: lhs.x * rhs, y: lhs.y * rhs)
    }

    static func /(lhs: Vector, rhs: Double) -> Vector {
        Vector(x: lhs.x / rhs, y: lhs.y / rhs)
    }

    static func *(lhs: Double, rhs: Vector) -> Vector {
        Vector(x: lhs * rhs.x, y: lhs * rhs.y)
    }

    static func /(lhs: Double, rhs: Vector) -> Vector {
        Vector(x: lhs / rhs.x, y: lhs / rhs.y)
    }

    static func +=(lhs: inout Vector, rhs: Vector) {
        lhs.x += rhs.x
        lhs.y += rhs.y
    }

    static func -=(lhs: inout Vector, rhs: Vector) {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
    }

    static func *=(lhs: inout Vector, rhs: Double) {
        lhs.x *= rhs
        lhs.y *= rhs
    }

    static func /=(lhs: inout Vector, rhs: Double) {
        lhs.x /= rhs
        lhs.y /= rhs
    }

    static prefix func -(rhs: Vector) -> Vector {
        Vector(x: -rhs.x, y: -rhs.y)
    }
}