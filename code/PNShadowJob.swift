struct PNSpotShadowJob: PNRenderJob {
    [...]
    func draw(encoder: MTLRenderCommandEncoder, supply: PNFrameSupply) {
        let scene = supply.scene
        let dataStore = supply.bufferStore
        let shadowCasterIndices = supply.scene.spotLights.indices.filter {
            supply.scene.spotLights[$0].castsShadows == 1
        }
        guard !shadowCasterIndices.isEmpty else {
            return
        }
        encoder.setDepthStencilState(depthStencilState)
        encoder.setRenderPipelineState(animatedPipelineState)
        encoder.setVertexBuffer(dataStore.spotLights,
                                index: kAttributeSpotShadowVertexShaderBufferSpotLights)
        encoder.setVertexBuffer(dataStore.modelCoordinateSystems,
                                index: kAttributeSpotShadowVertexShaderBufferModelUniforms)
        let masks = supply.mask.spotLights
        for lightIndex in shadowCasterIndices {
            encoder.setVertexBytes(value: lightIndex,
                                   index: kAttributeSpotShadowVertexShaderBufferInstanceId)
            for animatedModel in scene.animatedModels {
                if !masks[lightIndex][animatedModel.idx] {
                    continue
                }
                let mesh = scene.meshes[animatedModel.mesh]
                encoder.setFrontCulling(mesh.culling)
                encoder.setVertexBuffer(mesh.vertexBuffer.buffer,
                                        offset: mesh.vertexBuffer.offset,
                                        index: kAttributeSpotShadowVertexShaderBufferStageIn)
                encoder.setVertexBytes(value: animatedModel.idx,
                                       index: kAttributeSpotShadowVertexShaderBufferObjectIndex)
                encoder.setVertexBuffer(dataStore.matrixPalettes.buffer,
                                        offset: scene.paletteOffset[animatedModel.skeleton],
                                        index: kAttributeSpotShadowVertexShaderBufferMatrixPalettes)
                for pieceDescription in mesh.pieceDescriptions {
                    encoder.drawIndexedPrimitives(submesh: pieceDescription.drawDescription)
                }
            }
            [...]
        }
    }
    [...]
}
