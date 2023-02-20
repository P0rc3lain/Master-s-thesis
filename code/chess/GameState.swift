class GameState {
    let previous: GameState?
    let board: Board
    let selectedPiece: Piece?
    let turn: PieceColor
    let expectation: PickExpectation
    let checkState: CheckState
    [...]
}