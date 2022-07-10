//
//  LineScatterCandleRadarChartDataSet.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation


<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
open class LineScatterCandleRadarChartDataSet: BarLineScatterCandleBubbleChartDataSet, LineScatterCandleRadarChartDataSetProtocol
=======
open class LineScatterCandleRadarChartDataSet: BarLineScatterCandleBubbleChartDataSet, ILineScatterCandleRadarChartDataSet
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
open class LineScatterCandleRadarChartDataSet: BarLineScatterCandleBubbleChartDataSet, LineScatterCandleRadarChartDataSetProtocol
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
open class LineScatterCandleRadarChartDataSet: BarLineScatterCandleBubbleChartDataSet, LineScatterCandleRadarChartDataSetProtocol
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
{
    // MARK: - Data functions and accessors
    
    // MARK: - Styling functions and accessors
    
    /// Enables / disables the horizontal highlight-indicator. If disabled, the indicator is not drawn.
    open var drawHorizontalHighlightIndicatorEnabled = true
    
    /// Enables / disables the vertical highlight-indicator. If disabled, the indicator is not drawn.
    open var drawVerticalHighlightIndicatorEnabled = true
    
    /// `true` if horizontal highlight indicator lines are enabled (drawn)
    open var isHorizontalHighlightIndicatorEnabled: Bool { return drawHorizontalHighlightIndicatorEnabled }
    
    /// `true` if vertical highlight indicator lines are enabled (drawn)
    open var isVerticalHighlightIndicatorEnabled: Bool { return drawVerticalHighlightIndicatorEnabled }
    
    /// Enables / disables both vertical and horizontal highlight-indicators.
    /// :param: enabled
    open func setDrawHighlightIndicators(_ enabled: Bool)
    {
        drawHorizontalHighlightIndicatorEnabled = enabled
        drawVerticalHighlightIndicatorEnabled = enabled
    }
    
    // MARK: NSCopying
    
    open override func copy(with zone: NSZone? = nil) -> Any
    {
        let copy = super.copy(with: zone) as! LineScatterCandleRadarChartDataSet
        copy.drawHorizontalHighlightIndicatorEnabled = drawHorizontalHighlightIndicatorEnabled
        copy.drawVerticalHighlightIndicatorEnabled = drawVerticalHighlightIndicatorEnabled
        return copy
    }
    
}
