//
//  ChartLimitLine.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics


/// The limit line is an additional feature for all Line, Bar and ScatterCharts.
/// It allows the displaying of an additional line in the chart that marks a certain maximum / limit on the specified axis (x- or y-axis).
open class ChartLimitLine: ComponentBase
{
    @objc(ChartLimitLabelPosition)
    public enum LabelPosition: Int
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        case leftTop
        case leftBottom
        case rightTop
        case rightBottom
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// limit / maximum (the y-value or xIndex)
    @objc open var limit = Double(0.0)
    
    private var _lineWidth = CGFloat(2.0)
    @objc open var lineColor = NSUIColor(red: 237.0/255.0, green: 91.0/255.0, blue: 91.0/255.0, alpha: 1.0)
    @objc open var lineDashPhase = CGFloat(0.0)
    @objc open var lineDashLengths: [CGFloat]?
    
    @objc open var valueTextColor = NSUIColor.labelOrBlack
    @objc open var valueFont = NSUIFont.systemFont(ofSize: 13.0)
    
    @objc open var drawLabelEnabled = true
    @objc open var label = ""
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc open var labelPosition = LabelPosition.rightTop
=======
    @objc open var labelPosition = LabelPosition.topRight
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @objc open var labelPosition = LabelPosition.rightTop
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    @objc open var labelPosition = LabelPosition.rightTop
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    
    public override init()
    {
        super.init()
    }
    
    @objc public init(limit: Double)
    {
        super.init()
        self.limit = limit
    }
    
    @objc public init(limit: Double, label: String)
    {
        super.init()
        self.limit = limit
        self.label = label
    }
    
    /// set the line width of the chart (min = 0.2, max = 12); default 2
    @objc open var lineWidth: CGFloat
    {
        get
        {
            return _lineWidth
        }
        set
        {
            _lineWidth = newValue.clamped(to: 0.2...12)
        }
    }
}
