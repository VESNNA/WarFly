//
//  BluePowerUp.swift
//  WarFly
//
//  Created by Nikita Vesna on 10.03.2021.
//

import SpriteKit

class BluePowerUp: PowerUp {
    init() {
        let textureAtlas = SKTextureAtlas(named: "BluePowerUp")
        super.init(textureAtlas: textureAtlas)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
