//
//  YellowShot.swift
//  WarFly
//
//  Created by Nikita Vesna on 11.03.2021.
//

import SpriteKit

class YellowShot: Shot {
    
    init() {
        let textureAtlas = SKTextureAtlas(named: "YellowShot")
        super.init(textureAtlas: textureAtlas)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
