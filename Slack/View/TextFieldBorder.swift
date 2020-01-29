//
//  TextFieldBorder.swift
//  Slack
//
//  Created by Vladimir on 26.01.2020.
//  Copyright © 2020 Vladimir Tambovtsev. All rights reserved.
//

import UIKit

class TextFieldBorder: UITextField {

    override var tintColor: UIColor! {
           didSet {
               setNeedsDisplay()
           }
       }

       override func draw(_ rect: CGRect) {

           let startingPoint   = CGPoint(x: rect.minX, y: rect.maxY)
           let endingPoint     = CGPoint(x: rect.maxX, y: rect.maxY)

           let path = UIBezierPath()

           path.move(to: startingPoint)
           path.addLine(to: endingPoint)
           path.lineWidth = 2.0

           tintColor.setStroke()

           path.stroke()

       }
}
