class ViewController: UIViewController, GameDelegate {
    private var engine: PNEngine!
    private var engineView: PNView!
    private var interactionHandler: MouseInteractionHandler!
    private let game = Game()
    private let nodeInteractor = PNINodeInteractor()
    private let cameraController = CameraController()
    private var manipulator: SceneManipulator!
    private var state = GameState.initial
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        [...]
    }
    [...]
}