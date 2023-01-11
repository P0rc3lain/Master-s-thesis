public struct PNKeyframeAnimation<T> {
    public var keyFrames: [T]
    public let times: [PNTimePoint]
    public let maximumTime: PNTimeInterval
}