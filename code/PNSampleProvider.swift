public protocol PNSampleProvider {
    func sample<T>(animation: PNKeyframeAnimation<T>,
                   at time: PNTimePoint) -> PNAnimationSample<T>
}