//
// Created by Kotaro Kamashima on 2022/11/05.
// Copyright (c) 2022 Nick Lockwood. All rights reserved.
//

import Foundation

public struct Bitmap {
    public private(set) var pixels: [Color]
    public let width: Int

    public init(width: Int, pixels: [Color]) {
        self.pixels = pixels
        self.width = width
    }
}

public extension Bitmap {
    var height: Int {
        return pixels.count / width
    }

    subscript(x: Int, y: Int) -> Color {
        get {
            return pixels[y * width + x]
        }
        set {
            pixels[y * width + x] = newValue
        }
    }

    init(width: Int, height: Int, color: Color) {
        self.pixels = Array(repeating: color, count: width * height)
        self.width = width
    }
}