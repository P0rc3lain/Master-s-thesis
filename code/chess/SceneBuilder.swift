class SceneBuilder {
    func build(board: Board) -> PNScene {
        let sapeleMaterial = loader.material(name: "sapele")
        let mahoganyMaterial = loader.material(name: "mahogany")
        let scene = PNScene.default
        scene.rootNode.add(child: cameraNode())
        let pieces = loadPieces(board: board, 
                                blackMaterial: mahoganyMaterial, 
                                whiteMaterial: sapeleMaterial)
        let boardPiece = loadBoard(material: sapeleMaterial)
        let transform = PNTransform.compose(translation: [0, 0, -2], 
                                            scale: [0.5, 0.5, 0.5])
        let mainNode = PNISceneNode(transform: transform)
        let all = PNScenePiece.make(data: mainNode)
        let fields = loadBoardFields(mahogany: mahoganyMaterial,  
                                     sapele: sapeleMaterial)
        all.add(children: pieces, boardPiece, fields)
        scene.rootNode.add(child: all)
        let light = PNIDirectionalLight(color: [1, 1, 1],
                                        intensity: 1.5,
                                        direction: simd_float3(0, -1, 0))
        scene.directionalLights.append(light)
        return scene
    }
}