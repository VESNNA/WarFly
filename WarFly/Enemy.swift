//
//  Enemy.swift
//  WarFly
//
//  Created by Nikita Vesna on 08.03.2021.
//

import SpriteKit

class Enemy: SKSpriteNode {
    static var textureAtlas: SKTextureAtlas?
    
    init() {
        let enemyTexture = Enemy.textureAtlas?.textureNamed("airplane_4ver2_13")
        super.init(texture: enemyTexture, color: .clear, size: CGSize(width: 221, height: 204))
        self.xScale = 0.5
        self.yScale = -0.5
        self.zPosition = 20
        self.name = "removableSprite"
    }
    
    func flyEnemy() {
        let screenSize = UIScreen.main.bounds
        let timeHorizontal = 3.0
        let timeVertical = 10.0
        let moveLeft = SKAction.moveTo(x: 50, duration: timeHorizontal)
        moveLeft.timingMode = .easeInEaseOut
        let moveRight = SKAction.moveTo(x: screenSize.width - 50, duration: timeHorizontal)
        moveRight.timingMode = .easeInEaseOut
        let enemyFlySequence = SKAction.sequence([moveLeft,moveRight])
        let infiniteFlyMovement = SKAction.repeatForever(enemyFlySequence)
        
        let downMovement = SKAction.moveTo(y: -100, duration: timeVertical)
        
        let groupMovement = SKAction.group([infiniteFlyMovement, downMovement])
        
        self.run(groupMovement)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
