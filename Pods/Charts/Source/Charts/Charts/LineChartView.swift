//
//  LineChartView.swift
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

/// Chart that draws lines, surfaces, circles, ...
open class LineChartView: BarLineChartViewBase, LineChartDataProvider
{
    internal override func initialize()
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
        renderer = LineChartRenderer(dataProvider: self, animator: chartAnimator, viewPortHandler: viewPortHandler)
=======
        renderer = LineChartRenderer(dataProvider: self, animator: _animator, viewPortHandler: _viewPortHandler)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        renderer = LineChartRenderer(dataProvider: self, animator: chartAnimator, viewPortHandler: viewPortHandler)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        renderer = LineChartRenderer(dataProvider: self, animator: chartAnimator, viewPortHandler: viewPortHandler)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    // MARK: - LineChartDataProvider
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    open var lineData: LineChartData? { return data as? LineChartData }
=======
    open var lineData: LineChartData? { return _data as? LineChartData }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    open var lineData: LineChartData? { return data as? LineChartData }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    open var lineData: LineChartData? { return data as? LineChartData }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
}
