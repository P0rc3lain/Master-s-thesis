import UIKit
import Engine

class ViewController: UIViewController {
    [...]
    override func viewDidLoad() {
        super.viewDidLoad()
        [...]
        PNDefaults.shared.rendering.shadowSize.directional = [512, 512]
        [...]
    }
    [...]
}