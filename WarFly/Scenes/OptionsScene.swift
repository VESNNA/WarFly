//
//  OptionsScene.swift
//  WarFly
//
//  Created by Nikita Vesna on 01.04.2021.
//

import SpriteKit

class OptionsScene: ParentScene {
    
    override func didMove(to view: SKView) {
        setHeader(withName: "options", andBackground: "header_background")
        
        let musicBtn = ButtonNode(titled: nil, backgoundName: "music")
        musicBtn.position = CGPoint(x: self.frame.midX - 50, y: self.frame.midY)
        musicBtn.name = "music"
        musicBtn.label.isHidden = true
        
        let soundBtn = ButtonNode(titled: nil, backgoundName: "sound")
        soundBtn.position = CGPoint(x: self.frame.midX + 50, y: self.frame.midY)
        soundBtn.name = "sound"
        soundBtn.label.isHidden = true
        
        let backBtn = ButtonNode(titled: "back", backgoundName: "button_background")
        backBtn.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 100)
        backBtn.name = "back"
        backBtn.label.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "music" {
            sceneManager.gameScene = nil
            let transition = SKTransition.crossFade(withDuration: 1.0)
            let gameScene = GameScene(size: self.size)
            gameScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(gameScene, transition: transition)
        } else if node.name == "sound" {
            
        } else if node.name == "back" {
            let transition = SKTransition.crossFade(withDuration: 1.0)
            guard let previousScene = previousScene else { return }
            previousScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(previousScene, transition: transition)
        }
    }
}
