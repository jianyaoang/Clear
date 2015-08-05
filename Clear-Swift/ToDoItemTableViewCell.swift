//
//  ToDoItemTableViewCell.swift
//  Clear-Swift
//
//  Created by VLT Labs on 8/5/15.
//  Copyright (c) 2015 JayAng. All rights reserved.
//

import UIKit

class ToDoItemTableViewCell: UITableViewCell {

    var originalCenter = CGPoint()
    var removeCellOnPanGestureDrag = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("coder aDecoder not supported")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        var panGesture = UIPanGestureRecognizer(target: self, action: "panGestureRecognizer:")
        panGesture.delegate = self
        addGestureRecognizer(panGesture)
    }
    
    func panGestureRecognizer(recognizer: UIPanGestureRecognizer) {
        
        if recognizer.state == UIGestureRecognizerState.Began {
            
            originalCenter = self.center
            
        }
        
        if recognizer.state == UIGestureRecognizerState.Changed {
            
            let translationInView = recognizer.translationInView(self)
            center = CGPointMake(originalCenter.x + translationInView.x, originalCenter.y)
            removeCellOnPanGestureDrag = frame.origin.x < -frame.size.width / 2
            
        }
        
        if recognizer.state == UIGestureRecognizerState.Ended {
            
            let originalFrame = CGRect(x: 0, y: frame.origin.y , width: bounds.size.width, height: bounds.size.height)
            
            if !removeCellOnPanGestureDrag {
                
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    
                    self.frame = originalFrame
                })
                
            }
        }
    }
    
    override func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
            
            let translationInView = panGestureRecognizer.translationInView(superview!)
            
            if fabs(translationInView.x) > fabs(translationInView.y) {
                
                return true
            }
            return false
        }
        return false
    }
}
