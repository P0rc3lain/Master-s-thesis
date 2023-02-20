class SceneBuilder {
    [...]
    func build(board: Board) -> PNScene {
        let sapeleMaterial = loader.loadMaterial(textureName: "sapele")
        let mahoganyMaterial = loader.loadMaterial(textureName: "mahogany")
        let scene = PNScene.default
        addAmbientLight(scene: scene,
                        intensity: 0.5,
                        color: simd_float3(1, 1, 1),
                        position: [0, 0, 0])
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
        scene.environmentMap = device.makeTextureSolidCube(color: [1, 1, 1, 1])
        let light = PNIDirectionalLight(color: [1, 1, 1],
                                        intensity: 1.5,
                                        direction: simd_float3(0, -1, 0).normalized,
                                        castsShadows: false)
        scene.directionalLights.append(light)
        return scene
    }
    [...]
}