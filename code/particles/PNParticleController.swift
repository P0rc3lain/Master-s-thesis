public protocol PNParticleController {
    func updated(particles: [PNParticle],
                 timeSincePreviousUpdate: TimeInterval) -> [PNParticle]
}