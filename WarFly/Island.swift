//
//  Island.swift
//  WarFly
//
//  Created by Nikita Vesna on 09.02.2021.
//

import SpriteKit
import GameplayKit

final class Island: SKSpriteNode, GameBackgroundSpriteable {
    static func populateSprite(at point: CGPoint) -> Island {
        
        let islandImageName = configureName()
        let island = Island(imageNamed: islandImageName)
        island.setScale(randomScaleFactor)
        island.position = point
        island.zPosition = 1
        island.run(rotateForRandomAngle())
        
        return island
    }
    
    fileprivate static var randomScaleFactor: CGFloat {
        let distribution = GKRandomDistribution(lowestValue: 7, highestValue: 10)
        let randomNumber = CGFloat(distribution.nextInt()) / 10
        
        return randomNumber
    }
    
    fileprivate static func configureName() -> String {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 4)
        let randomNumber = distribution.nextInt()
        let imageName = "is" + "\(randomNumber)"
        
        return imageName
    }
    
    fileprivate static func rotateForRandomAngle() -> SKAction {
        let distribution = GKRandomDistribution(lowestValue: 0, highestValue: 360)
        let randomNumber = CGFloat(distribution.nextInt())
        
        return SKAction.rotate(toAngle: randomNumber * CGFloat(Double.pi / 180), duration: 0)
    }
}
