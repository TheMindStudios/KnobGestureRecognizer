
import UIKit
import AVFoundation
import KnobGestureRecognizer

protocol BpmControlViewDelegate: class {
    func bpmControlView(_ view: BpmControlView, didChange state: BpmControlViewState)
}

enum BpmControlViewState {
    case began
    case changed(value: Int)
    case ended
}

class BpmControlView: UIView {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var controlView: UIImageView!
    
    // MARK: - Properties
    
    weak var delegate: BpmControlViewDelegate?
    
    var maxBpmValue: Int = 500
    var minBpmValue: Int = 10
    var radiansCount: CGFloat = 30
    
    var bpmValue: Int = 10 {
        didSet {
            switch bpmValue {
            case let x where x < minBpmValue:
                bpmValue = minBpmValue
            case let x where x > maxBpmValue:
                bpmValue = maxBpmValue
            default:
                break
            }
            delegate?.bpmControlView(self, didChange: .changed(value: self.bpmValue))
        }
    }
  
    fileprivate var bearing: CGFloat = 0.0
    fileprivate var oldBearing: CGFloat = 0.0
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let gesture = KnobGestureRecognizer(target: self, action: #selector(rotationAction(_:)), to: controlView)
        
        gesture.delegate = self
        controlView.addGestureRecognizer(gesture)
    }
}

// MARK: - Private Methods

extension BpmControlView {
    
    fileprivate func generateFeedback() {
        
        AudioServicesPlaySystemSoundWithCompletion(1104, nil)
        if #available(iOS 10.0, *) {
            
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        }
    }
    
    fileprivate func gestureHandler(_ sender: KnobGestureRecognizer) {
        
        bearing +=  radiansCount/2 * sender.rotation / .pi
        
        if round(bearing) > oldBearing {
            bpmValue += 1
            generateFeedback()
        } else if round(bearing) < oldBearing {
            generateFeedback()
            bpmValue -= 1
        }
        oldBearing = round(bearing)
        
        let viewTransform = controlView.transform
        let newTransform = viewTransform.rotated(by: sender.rotation)
        controlView.transform = newTransform
    }
    
    @objc fileprivate func rotationAction(_ sender: KnobGestureRecognizer) {
    
        switch sender.state {
        case .began:
            controlView.isHighlighted = true
            bearing = 0.0
            gestureHandler(sender)
            
        case .changed:
            gestureHandler(sender)
        case .ended:
             controlView.isHighlighted = false
        default:
            delegate?.bpmControlView(self, didChange: .ended)
        }
    }
}

// MARK: - UIGestureRecognizerDelegate

extension BpmControlView: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        controlView.isHighlighted = true
        delegate?.bpmControlView(self, didChange: .began)
        
        return true
    }
}
