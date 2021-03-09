//
//  GameScene.swift
//  WarFly
//
//  Created by Nikita Vesna on 07.01.2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player: PlayerPlane!
    
    override func didMove(to view: SKView) {
        
        configureStartScene()
        spawnClouds()
        spawnIslands()
        let deadline = DispatchTime.now() + .nanoseconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadline) { [unowned self] in
            self.player.performFly()
        }
        
        spawnPowerUp()
        //spawnEnemy(count: 5)
        spawnEnemies()
    }
    
    fileprivate func spawnEnemies() {
        let waitAction = SKAction.wait(forDuration: 3.0)
        let spawnFlyAction = SKAction.run { [unowned self] in
            self.spawnGroupOfEnemies()
        }
        let flySequence = SKAction.sequence([waitAction, spawnFlyAction])
        self.run(SKAction.repeatForever(flySequence))
    }
    
    fileprivate func spawnGroupOfEnemies() {
        let enemyTextureAtlas1 = SKTextureAtlas(named: "Enemy_1")
        let enemyTextureAtlas2 = SKTextureAtlas(named: "Enemy_2")
        
        SKTextureAtlas.preloadTextureAtlases([enemyTextureAtlas1, enemyTextureAtlas2]) { [unowned self] in
            
            let randomNumber = Int(arc4random_uniform(2))
            let arrayOfAtlases = [enemyTextureAtlas1, enemyTextureAtlas2]
            let textureAtlas = arrayOfAtlases[randomNumber]
            
            let waitAction = SKAction.wait(forDuration: 1.0)
            let spawnEnemy = SKAction.run { [unowned self] in
                let textureNames = textureAtlas.textureNames.sorted()
                let texture = textureAtlas.textureNamed((textureAtlas.textureNames[12]))
                let enemy = Enemy(enemyTexture: texture)
                enemy.position = CGPoint(x: self.size.width / 2,
                                         y: self.size.height + 110)
                self.addChild(enemy)
                enemy.flyEnemy()
            }
            let spawnAction = SKAction.sequence([waitAction, spawnEnemy])
            let repeatAction = SKAction.repeat(spawnAction, count: 3)
            self.run(repeatAction)
        }
    }
    
    fileprivate func spawnPowerUp() {
        let powerUp = PowerUp()
        powerUp.performRotation()
        powerUp.position = CGPoint(x: self.size.width / 2,
                                   y: self.size.height / 2)
        self.addChild(powerUp)
    }
    
    fileprivate func spawnClouds() {
        let spawnCloudWait = SKAction.wait(forDuration: 1)
        let spawnCloudAction = SKAction.run {
            let cloud = Cloud.populate()
            self.addChild(cloud)
        }
        
        let spawnCloudSequence = SKAction.sequence([spawnCloudWait, spawnCloudAction])
        let spawnCloudsForever = SKAction.repeatForever(spawnCloudSequence)
        run(spawnCloudsForever)
    }
    
    fileprivate func spawnIslands() {
        let spawnIslandWait = SKAction.wait(forDuration: 2)
        let spawnIslandAction = SKAction.run {
            let cloud = Island.populate()
            self.addChild(cloud)
        }
        
        let spawnIslandSequence = SKAction.sequence([spawnIslandWait, spawnIslandAction])
        let spawnIslandForever = SKAction.repeatForever(spawnIslandSequence)
        run(spawnIslandForever)
    }
    
    fileprivate func configureStartScene() {
        let screenCenterPoint = CGPoint(x: self.size.width / 2,
                                        y: self.size.height / 2)
        let background = Background.populateBackground(at: screenCenterPoint)
        background.size = self.size ///Scaling for iPads
        self.addChild(background)
        
        let screen = UIScreen.main.bounds
        for _ in 1...5 {
            let island1 = Island.populate(at: CGPoint(x: 100, y: 100))
            self.addChild(island1)
            
            let island2 = Island.populate(at: CGPoint(x: self.size.width - 100,
                                                      y: self.size.height - 200))
            self.addChild(island2)
        }
        
        player = PlayerPlane.populate(at: CGPoint(x: screen.size.width/2, y: 100))
        self.addChild(player)
    }
    
    override func didSimulatePhysics() {
        
        player.checkPosition()
        
        enumerateChildNodes(withName: "removableSprite") { (node, stop) in
            if node.position.y < -100 {
                node.removeFromParent()
            }
        }
    }
}
