public protocol PNAnimatedNode: PNSceneNode {
    var animator: PNAnimator { get set }
    var animation: PNAnimatedCoordinateSpace { get set }
}