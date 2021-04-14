//
//  BestScene.swift
//  WarFly
//
//  Created by Nikita Vesna on 05.04.2021.
//

import SpriteKit

class BestScene: ParentScene {
    
    var places: [Int]!
    
    override func didMove(to view: SKView) {
        
        gameSettings.loadScores()
        places = gameSettings.highscore
        
        setHeader(withName: "best", andBackground: "header_background")
        
        let titles = ["back"]
        for (index, title) in titles.enumerated() {
            let button = ButtonNode(titled: title, backgoundName: "button_backgound")
            button.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 200 + CGFloat(100 * index))
            button.name = title
            button.label.name = title
            addChild(button)
        }
        
        for (index, value) in places.enumerated() {
            let text = SKLabelNode(text: value.description)
            text.fontColor = UIColor(red: 219/255, green: 226/255, blue: 215/255, alpha: 1)
            text.fontName = "AmericanTypewriter-Bold"
            text.fontSize = 30
            text.position = CGPoint(x: self.frame.midX, y: self.frame.midY - CGFloat(index * 60))
            addChild(text)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "back" {
            let transition = SKTransition.crossFade(withDuration: 1.0)
            guard let previousScene = previousScene else { return }
            previousScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(previousScene, transition: transition)
        }
    }
}
