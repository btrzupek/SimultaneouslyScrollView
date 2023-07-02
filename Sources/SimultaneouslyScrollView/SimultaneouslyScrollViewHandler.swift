import Combine
#if os(iOS)
import UIKit
#endif

/// Handler to enable simultaneously scrolling of `ScrollView`s
@available(iOS 13, *)
@available(tvOS, unavailable)
@available(macOS, unavailable)
public protocol SimultaneouslyScrollViewHandler {
#if os(iOS)
    /// Publisher to notify if the `ScrollView`s are scrolled to the bottom
    var scrolledToBottomPublisher: AnyPublisher<Bool, Never> { get }

    /// Adds the `ScrollView` to a list and keep the content offset in sync.
    /// When any registered `ScrollView` will be scrolled all other registered `ScrollView` will adjust
    /// its content offset automatically.
    /// - Parameters:
    ///     - scrollView: The `ScrollView` that should be registered for simultaneously scrolling
    func register(scrollView: UIScrollView)
    
    /// Syncronizes an unregistered `UIScrollView`, which allows another object to own the
    /// delegate for that 'UIScrollView', but allow it to participate in syncronization by publishing
    /// its events from the delegate straight to the `scrollViewWillBeginDragging` and
    /// `scrollViewDidScroll` functions
    func unregisteredSync(scrollView: UIScrollView)
    
    /// Helper method to scroll all registered `ScrollView`s to the bottom.
    func scrollAllToBottom(animated: Bool)
    
    /// Scrollview delegate methods, surfaced here for instances where the
    /// participating scrollview is not fully managed by `register(scrollView: UIScrollView)` above
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView)
    func scrollViewDidScroll(_ scrollView: UIScrollView)
#endif
}
