public protocol PNScreenInteractor {
    func pick(camera: PNCameraNode,
              scene: PNScene,
              point: PNPoint2D) -> [PNScenePiece]
}