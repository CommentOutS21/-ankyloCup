//
//  Untitled.swift
//  SampleApp
//
//  Created by 野崎政多 on 2024/12/14.
//
import SpriteKit
final class GameScene: SKScene {

    private let player = SKSpriteNode(texture: .init(imageNamed: "player"), size: .init(width: 32, height: 32))
    override func didMove(to view: SKView) {
        backgroundColor = .init(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)

        player.position = .init(x: frame.midX, y: frame.midY)
        player.physicsBody = .init(texture: player.texture!, size: player.size)
        // ころがらないように設定
        player.physicsBody?.allowsRotation = false
        addChild(player)
    }
}

