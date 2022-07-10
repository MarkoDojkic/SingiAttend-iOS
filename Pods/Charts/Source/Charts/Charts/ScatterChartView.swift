//
//  ScatterChartView.swift
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

/// The ScatterChart. Draws dots, triangles, squares and custom shapes into the chartview.
open class ScatterChartView: BarLineChartViewBase, ScatterChartDataProvider
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
        renderer = ScatterChartRenderer(dataProvider: self, animator: chartAnimator, viewPortHandler: viewPortHandler)
=======
        renderer = ScatterChartRenderer(dataProvider: self, animator: _animator, viewPortHandler: _viewPortHandler)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        renderer = ScatterChartRenderer(dataProvider: self, animator: chartAnimator, viewPortHandler: viewPortHandler)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        renderer = ScatterChartRenderer(dataProvider: self, animator: chartAnimator, viewPortHandler: viewPortHandler)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

        xAxis.spaceMin = 0.5
        xAxis.spaceMax = 0.5
    }
    
    // MARK: - ScatterChartDataProvider
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    open var scatterData: ScatterChartData? { return data as? ScatterChartData }
=======
    open var scatterData: ScatterChartData? { return _data as? ScatterChartData }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    open var scatterData: ScatterChartData? { return data as? ScatterChartData }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    open var scatterData: ScatterChartData? { return data as? ScatterChartData }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
}
