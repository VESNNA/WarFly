//
//  OptionsScene.swift
//  WarFly
//
//  Created by Nikita Vesna on 01.04.2021.
//

import SpriteKit

class OptionsScene: ParentScene {
    
    var isMusic: Bool!
    var isSound: Bool!
    
    override func didMove(to view: SKView) {
        
        isMusic = gameSettings.isMusic
        isSound = gameSettings.isSound
        
        setHeader(withName: "options", andBackground: "header_background")
        
        let backgroundNameForMusic = isMusic == true ? "music" : "nomusic"
        let musicBtn = ButtonNode(titled: nil, backgroundName: backgroundNameForMusic)
        musicBtn.position = CGPoint(x: self.frame.midX - 50, y: self.frame.midY)
        musicBtn.name = "music"
        musicBtn.label.isHidden = true
        
        let backgroundNameForSound = isSound == true ? "sound" : "nosound"
        let soundBtn = ButtonNode(titled: nil, backgroundName: backgroundNameForSound)
        soundBtn.position = CGPoint(x: self.frame.midX + 50, y: self.frame.midY)
        soundBtn.name = "sound"
        soundBtn.label.isHidden = true
        
        let backBtn = ButtonNode(titled: "back", backgroundName: "button_background")
        backBtn.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 100)
        backBtn.name = "back"
        backBtn.label.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "music" {
            isMusic = !isMusic
            update(node: node as! SKSpriteNode, property: isMusic)
             
        } else if node.name == "sound" {
            isSound = !isSound
            update(node: node as! SKSpriteNode, property: isSound)
            
        } else if node.name == "back" {
            
            gameSettings.isMusic = isMusic
            gameSettings.isSound = isSound
            gameSettings.saveGameSettings()
            
            let transition = SKTransition.crossFade(withDuration: 1.0)
            guard let previousScene = previousScene else { return }
            previousScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(previousScene, transition: transition)
        }
    }
    
    func update(node: SKSpriteNode, property: Bool) {
        if let name = node.name {
            node.texture = property ? SKTexture(imageNamed: name) : SKTexture(imageNamed: "no" + name)
        }
    }
}
