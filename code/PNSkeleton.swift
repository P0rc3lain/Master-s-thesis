public protocol PNSkeleton {
    var bindTransforms: [PNB2MTransform] { get }
    var inverseBindTransforms: [PNM2BTransform] { get }
    var parentIndices: [PNIndex] { get }
    var animations: [PNAnimatedSkeleton] { get }
    func calculatePose(animationPose: [PNBLTransform]) -> [PNB2MTransform]
}