//
//  Assets.swift
//  WarFly
//
//  Created by Nikita Vesna on 12.03.2021.
//

import SpriteKit

class Assets {
    static let shared = Assets()
    var isLoaded = false
    let yellowShotAtlas = SKTextureAtlas(named: "YellowAmmo")
    let enemy_1Atlas = SKTextureAtlas(named: "Enemy_1")
    let enemy_2Atlas = SKTextureAtlas(named: "Enemy_2")
    let bluePowerUpAtlas = SKTextureAtlas(named: "BluePowerUp")
    let greenPowerUpAtlas = SKTextureAtlas(named: "GreenPowerUp")
    let playerPlaneAtlas = SKTextureAtlas(named: "PlayerPlane")
    
    func preloadAssets() {
        yellowShotAtlas.preload { print("yellow shot preloaded") }
        enemy_1Atlas.preload { print("enemy_1 shot preloaded") }
        enemy_2Atlas.preload { print("enemy_2Atlas shot preloaded") }
        bluePowerUpAtlas.preload { print("bluePowerUpAtlas shot preloaded") }
        greenPowerUpAtlas.preload { print("greenPowerUpAtlas shot preloaded") }
        playerPlaneAtlas.preload { print("playerPlaneAtlas shot preloaded") }
    }
}
