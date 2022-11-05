//
//  ViewController.swift
//  Rampage
//
//  Created by Nick Lockwood on 17/05/2019.
//  Copyright © 2019 Nick Lockwood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let imageView = UIImageView()
    private var player = Player(position: Vector(x: 4, y: 4))

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImageView()

        let displayLink = CADisplayLink(target: self, selector: #selector((update)))
        displayLink.add(to: .main, forMode: .common)
    }

    func setUpImageView() -> Void {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.layer.magnificationFilter = .nearest
    }

    @objc func update(_ displayLin: CADisplayLink) {
        var renderer = Renderer(width: 8, height: 8)
        renderer.draw(player)

        imageView.image = UIImage(bitmap: renderer.bitmap)
    }
}
