//
//  BubbleChartView.swift
//  Charts
//
//  Bubble chart implementation:
//    Copyright 2015 Pierre-Marc Airoldi
//    Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics

open class BubbleChartView: BarLineChartViewBase, BubbleChartDataProvider
{
    open override func initialize()
    {
        super.initialize()
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        renderer = BubbleChartRenderer(dataProvider: self, animator: chartAnimator, viewPortHandler: viewPortHandler)
=======
        renderer = BubbleChartRenderer(dataProvider: self, animator: _animator, viewPortHandler: _viewPortHandler)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        renderer = BubbleChartRenderer(dataProvider: self, animator: chartAnimator, viewPortHandler: viewPortHandler)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        renderer = BubbleChartRenderer(dataProvider: self, animator: chartAnimator, viewPortHandler: viewPortHandler)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    // MARK: - BubbleChartDataProvider
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    open var bubbleData: BubbleChartData? { return data as? BubbleChartData }
=======
    open var bubbleData: BubbleChartData? { return _data as? BubbleChartData }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    open var bubbleData: BubbleChartData? { return data as? BubbleChartData }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    open var bubbleData: BubbleChartData? { return data as? BubbleChartData }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
}
