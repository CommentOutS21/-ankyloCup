import UIKit
import SpriteKit

class player: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //SKViewの作成
        if let skView = SKView(frame: self.view.frame) as SKView? {
            //SKViewにSKSceneを追加
            if let scene = MyScene(fileNamed: "Topscene") {
                //SKSceneのサイズを設定
                scene.scaleMode = .aspectFill
                //SKViewにSKSeenを追加
                skView.presentScene(scene)
                //UIViewにSKViewを追加
                self.view.addSubview(skView)
            }
        }
    }
}
