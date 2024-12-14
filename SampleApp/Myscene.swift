import SpriteKit

class MyScene: SKScene {
    var image: SKSpriteNode!
    
    override func sceneDidLoad() {
        // "SampleImage" という名前のノードを取得
        guard let imageNode = self.childNode(withName: "player") as? SKSpriteNode else {
            print("Error: SampleImage node not found or is not an SKSpriteNode.")
            return
        }
        self.image = imageNode
        
        // SKActionで画像を動かす
        let action = SKAction.moveTo(x: 250, duration: 3.0)
        self.image.run(action)
    }
}
