//
//  ButtonNode.swift
//  WarFly
//
//  Created by Nikita Vesna on 22.03.2021.
//

import SpriteKit

class ButtonNode: SKSpriteNode {
    let label: SKLabelNode = {
        let text = SKLabelNode(text: "labelText")
        text.fontColor = UIColor(red: 219/255, green: 226/255, blue: 215/255, alpha: 1)
        text.fontName = "AmericanTypewriter-Bold"
        text.fontSize = 30
        text.horizontalAlignmentMode = .center
        text.verticalAlignmentMode = .center
        text.zPosition = 2
        return text
    }()
    
    init(titled title: String, backgoundName: String) {
        let texture = SKTexture(imageNamed: backgoundName)
        super.init(texture: texture, color: .clear, size: texture.size())
        label.text = title.uppercased()
        addChild(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
