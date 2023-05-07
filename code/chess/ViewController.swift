@objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
    guard state.checkState != .stalemate && 
          state.checkState != .checkmate else { return }
    let allNodes = engine.scene.rootNode.all()
    guard let camera = allNodes.compactMap {
        $0.data as? PNAnimatedCameraNode
    }.first else { return }
    var moves = [Move]()
    let selected = state.selectedPiece
    let location = CGPoint(x: sender!.location(in: view).x,
                           y: frame.height-sender!.location(in: view).y)
    if state.expectation == .piece {
        let piece = interactionHandler.pickPiece(location: location,
                                                 camera: camera,
                                                 scene: engine.scene,
                                                 viewframe: frame.size)
        let pieceS = pieceParser.create(literal: piece?.data.name ?? "")
        (moves, state) = game.select(piece: pieceS, state: state)
    } else {
        let field = interactionHandler.pickField(location: location,
                                                 camera: camera,
                                                 scene: engine.scene,
                                                 viewframe: frame.size)
        let fieldS = fieldParser.create(literal: field?.data.name ?? "")
        (moves, state) = game.select(piece: fieldS, state: state)
    }
    if state.selectedPiece != selected {
        if let selected = selected {
            manipulator.deselect(scene: engine.scene, piece: selected)
        }
        if let selectedAfter = state.selectedPiece {
            manipulator.select(scene: engine.scene, piece: selectedAfter)
        }
    }
    manipulator.performMoves(scene: engine.scene, moves: moves)
}