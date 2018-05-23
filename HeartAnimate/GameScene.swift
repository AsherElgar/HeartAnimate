//
//  GameScene.swift
//  HeartAnimate
//
//  Created by Asher Elgar on 23/05/2018.
//  Copyright © 2018 Asher Elgar. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var heart = SKSpriteNode()
    var oldSize:CGSize?
    override func didMove(to view: SKView) {
        
        addHeart()
        backgroundColor = .black
  
        let size: CGSize = CGSize(width: heart.size.width * 2, height: heart.size.height * 2)
        oldSize = size

        
    }
    
    func addHeart() {
        heart = SKSpriteNode(imageNamed: "heart")
        heart.name = "heart"
    
        heart.size = CGSize(width: heart.size.width * 2, height: heart.size.height * 2)
        heart.position = CGPoint(x: frame.midX, y: frame.midY)

        let pulseUp = SKAction.scale(to: 1.5, duration: 0.5)
        let pulseDown = SKAction.scale(to: 1, duration: 0.5)
        let pulse = SKAction.sequence([pulseUp, pulseDown])
        let repeatPulse = SKAction.repeatForever(pulse)
        heart.run(repeatPulse, withKey: "pulse")
        
        
        addChild(heart)
    }
    
    func pulsStop() {
        
    }
    

    func touchDown(atPoint pos : CGPoint) {

    }

    func touchMoved(toPoint pos : CGPoint) {

    }

    func touchUp(atPoint pos : CGPoint) {

    }


    var isFingerOnHeart = false
    var heartStop = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
  
       // guard let heart = childNode(withName: "heart") else {fatalError("No Heart?")}

//        print(heartStop)
            if heartStop{
                    self.removeAllChildren()
                    addHeart()
                heartStop = false
            }else{

                let w = SKAction.resize(toWidth: ((oldSize?.width)! / 2), duration: 0.5)
                let h = SKAction.resize(toHeight: ((oldSize?.height)! / 2), duration: 0.5)
                let a = SKAction.speed(to: 0, duration: 1)
                let seq = SKAction.sequence([h,w,a])
                heart.run(seq)
                heartStop = true
                
            }
      

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isFingerOnHeart = false
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    private var lastUpdateTime: TimeInterval = 0

    
    override func update(_ currentTime: TimeInterval) {

        
    }
}
