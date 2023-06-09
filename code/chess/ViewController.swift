@objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
    guard state.checkState != .stalemate && 
          state.checkState != .checkmate else { return }
    let allNodes = engine.scene.rootNode.all()
    var moves = [Move]()
    let selectedPiece = state.selectedPiece
    let location = CGPoint(x: sender!.location(in: view).x,
                           y: frame.height-sender!.location(in: view).y)
    if state.expectation == .piece {
        let piece = interactionHandler.pickPiece(location: location,
                                                 scene: engine.scene,
                                                 viewframe: frame.size)
        (moves, state) = game.select(piece: piece, state: state)
    } else {
        let field = interactionHandler.pickField(location: location,
                                                 scene: engine.scene,
                                                 viewframe: frame.size)
        (moves, state) = game.select(piece: field, state: state)
    }
    manipulator.selectionState(scene: engine.scene, piece: selected)
    manipulator.performMoves(scene: engine.scene, moves: moves)
}