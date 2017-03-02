//
//  TermViewController.swift
//  KnobGestureRecognizer
//
//  Created by Dima on 01.03.17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import AVFoundation
import KnobGestureRecognizer

class TermViewController: UIViewController {
    

    @IBOutlet weak var controlView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    let blueFirstColor = UIColor(red: 139.0/255.0, green: 205.0/255.0, blue: 1.000, alpha: 1.000)
    let blueSecondColor = UIColor(red: 106.0/255.0, green: 192.0/255.0, blue: 1.000, alpha: 1.000)
    
    let rerFirstColor = UIColor(red: 1.000, green: 215.0/255.0, blue: 139.0/255.0, alpha: 1.000)
    let rerSecondColor = UIColor(red: 1.000, green: 151.0/255.0, blue: 106.0/255.0, alpha: 1.000)
    
    var maxValue: CGFloat = 100
    var minValue: CGFloat = 0
    var radiansCount: CGFloat = 30
    fileprivate var bearing: CGFloat = 0.0
    fileprivate var oldBearing: CGFloat = 0.0
    
    fileprivate var value: CGFloat = 10 {
        didSet {
            switch value {
            case let x where x < minValue:
                value = minValue
            case let x where x > maxValue:
                value = maxValue
            default:
                break
            }
            
            let fColor = midleColor(firstColor: blueFirstColor, secondColor: rerFirstColor, colorRatio: value/self.maxValue)
            let sColor = midleColor(firstColor: blueSecondColor, secondColor: rerSecondColor, colorRatio: value/self.maxValue)
            
            self.backgroundImageView.image = StyleKit.imageOfBackgroundImage(imageSize: view.bounds.size, colorFirst: fColor, colorSecond: sColor)
        }
    }
    
    fileprivate var feedbackGenerator: AnyObject?

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let gesture = KnobGestureRecognizer(target: self, action: #selector(rotationAction(_:)), to: controlView)
        value = 0
        gesture.delegate = self
        controlView.addGestureRecognizer(gesture)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func midleColor(firstColor: UIColor, secondColor: UIColor, colorRatio: CGFloat) -> UIColor {
        
        var firstRed : CGFloat = 0
        var firstGreen : CGFloat = 0
        var firstBlue : CGFloat = 0
        var firstAlpha: CGFloat = 0
        
        firstColor.getRed(&firstRed, green: &firstGreen, blue: &firstBlue, alpha: &firstAlpha)
        
        var secondRed : CGFloat = 0
        var secondGreen : CGFloat = 0
        var secondBlue : CGFloat = 0
        var secondAlpha: CGFloat = 0
        
        secondColor.getRed(&secondRed, green: &secondGreen, blue: &secondBlue, alpha: &secondAlpha)
        
        let red = firstRed + (secondRed - firstRed) * colorRatio
        let green = firstGreen + (secondGreen - firstGreen) * colorRatio
        let blue = firstBlue + (secondBlue - firstBlue) * colorRatio
        
        let color = UIColor(red: CGFloat(red), green: CGFloat(green) , blue: CGFloat(blue), alpha: 1.000)
        
        return color
    }
}

// MARK: - Private Methods

extension TermViewController {
    
    fileprivate func feedbackGeneratorHandler() {
        if #available(iOS 9.0, *) {
            AudioServicesPlaySystemSoundWithCompletion(1104, nil)
        }
        if #available(iOS 10.0, *) {
            guard let feedbackGenerator = feedbackGenerator as? UISelectionFeedbackGenerator else {
                return
            }
            feedbackGenerator.selectionChanged()
            feedbackGenerator.prepare()
        }
    }
    
    fileprivate func gestureHandler(_ sender: KnobGestureRecognizer) {
        
        bearing +=  radiansCount/2 * sender.rotation / .pi
        
        if round(bearing) > oldBearing {
            value += 1
            feedbackGeneratorHandler()
        } else if round(bearing) < oldBearing {
            feedbackGeneratorHandler()
            value -= 1
        }
        
        print("\(value)")
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
            
            if #available(iOS 10.0, *) {
                guard var feedbackGenerator = feedbackGenerator as? UISelectionFeedbackGenerator else {
                    return
                }
                feedbackGenerator = UISelectionFeedbackGenerator()
                feedbackGenerator.prepare()
            }
            gestureHandler(sender)
            
        case .changed:
            gestureHandler(sender)
        case .ended:
            controlView.isHighlighted = false
        default:
            if #available(iOS 10.0, *) {
                feedbackGenerator = nil
            }
        }
    }
}

// MARK: - UIGestureRecognizerDelegate

extension TermViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        controlView.isHighlighted = true
        
        return true
    }
    
}
