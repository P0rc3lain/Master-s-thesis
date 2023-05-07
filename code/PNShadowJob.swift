struct PNSpotShadowJob: PNRenderJob {
    [...]
    func draw(encoder: MTLRenderCommandEncoder, supply: PNFrameSupply) {
        let shadowCasterIndices = supply.scene.spotLights.indices.filter {
            supply.scene.spotLights[$0].castsShadows == 1
        }
        guard !shadowCasterIndices.isEmpty else {
            return
        }
        encoder.setDepthStencilState(depthStencilState)
        encoder.setRenderPipelineState(animatedPipelineState)
        [...] // Set uniforms for shader program
        let masks = supply.mask.spotLights
        for lightIndex in shadowCasterIndices {
            [...] // Set uniforms for mesh
            for animatedModel in supply.scene.animatedModels {
                if !masks[lightIndex][animatedModel.idx] {
                    continue
                }
                let mesh = supply.scene.meshes[animatedModel.mesh]
                [...] // Set uniforms for submesh
                for piece in mesh.pieceDescriptions {
                    encoder.drawIndexedPrimitives(piece.drawDescription)
                }
            }
            [...]
        }
    }
    [...]
}
