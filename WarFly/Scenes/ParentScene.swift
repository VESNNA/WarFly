//
//  ParentScene.swift
//  WarFly
//
//  Created by Nikita Vesna on 31.03.2021.
//

import SpriteKit

class ParentScene: SKScene {
    
    let gameSettings = GameSetting()
    let sceneManager = SceneManager.shared
    var previousScene: SKScene?
    
    func setHeader(withName name: String?, andBackground backgroundName: String) {
        let header = ButtonNode(titled: name, backgoundName: backgroundName)
        header.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 150)
        self.addChild(header)
        
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = SKColor(red: 0.15, green: 0.15, blue: 0.3, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
