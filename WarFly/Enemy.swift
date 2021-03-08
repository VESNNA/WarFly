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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
