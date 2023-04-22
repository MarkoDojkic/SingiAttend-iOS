//
//  BarHighlighter.swift
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

@objc(BarChartHighlighter)
open class BarHighlighter: ChartHighlighter
{
    open override func getHighlight(x: CGFloat, y: CGFloat) -> Highlight?
    {
        guard
            let barData = (self.chart as? BarChartDataProvider)?.barData,
            let high = super.getHighlight(x: x, y: y)
            else { return nil }
        
        let pos = getValsForTouch(x: x, y: y)

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        if let set = barData[high.dataSetIndex] as? BarChartDataSetProtocol,
=======
        if let set = barData.getDataSetByIndex(high.dataSetIndex) as? IBarChartDataSet,
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        if let set = barData[high.dataSetIndex] as? BarChartDataSetProtocol,
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        if let set = barData[high.dataSetIndex] as? BarChartDataSetProtocol,
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            set.isStacked
        {
            return getStackedHighlight(high: high,
                                       set: set,
                                       xValue: Double(pos.x),
                                       yValue: Double(pos.y))
        }
        else
        {
            return high
        }
    }
    
    internal override func getDistance(x1: CGFloat, y1: CGFloat, x2: CGFloat, y2: CGFloat) -> CGFloat
    {
        return abs(x1 - x2)
    }
    
    internal override var data: ChartData?
    {
        return (chart as? BarChartDataProvider)?.barData
    }
    
    /// This method creates the Highlight object that also indicates which value of a stacked BarEntry has been selected.
    ///
    /// - Parameters:
    ///   - high: the Highlight to work with looking for stacked values
    ///   - set:
    ///   - xIndex:
    ///   - yValue:
    /// - Returns:
    @objc open func getStackedHighlight(high: Highlight,
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
                                  set: BarChartDataSetProtocol,
=======
                                  set: IBarChartDataSet,
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
                                  set: BarChartDataSetProtocol,
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
                                  set: BarChartDataSetProtocol,
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
                                  xValue: Double,
                                  yValue: Double) -> Highlight?
    {
        guard
            let chart = self.chart as? BarLineScatterCandleBubbleChartDataProvider,
            let entry = set.entryForXValue(xValue, closestToY: yValue) as? BarChartDataEntry
            else { return nil }
        
        // Not stacked
        if entry.yValues == nil
        {
            return high
        }
        
        guard
            let ranges = entry.ranges,
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            !ranges.isEmpty
=======
            ranges.count > 0
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
            !ranges.isEmpty
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
            !ranges.isEmpty
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            else { return nil }

        let stackIndex = getClosestStackIndex(ranges: ranges, value: yValue)
        let pixel = chart
            .getTransformer(forAxis: set.axisDependency)
            .pixelForValues(x: high.x, y: ranges[stackIndex].to)

        return Highlight(x: entry.x,
                         y: entry.y,
                         xPx: pixel.x,
                         yPx: pixel.y,
                         dataSetIndex: high.dataSetIndex,
                         stackIndex: stackIndex,
                         axis: high.axis)
    }
    
    /// - Parameters:
    ///   - entry:
    ///   - value:
    /// - Returns: The index of the closest value inside the values array / ranges (stacked barchart) to the value given as a parameter.
    @objc open func getClosestStackIndex(ranges: [Range]?, value: Double) -> Int
    {
        guard let ranges = ranges else { return 0 }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        
        if let stackIndex = ranges.firstIndex(where: { $0.contains(value) }) {
            return stackIndex
        } else {
            let length = max(ranges.endIndex - 1, 0)
=======
        if let stackIndex = ranges.firstIndex(where: { $0.contains(value) }) {
            return stackIndex
        } else {
            let length = max(ranges.count - 1, 0)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        
        if let stackIndex = ranges.firstIndex(where: { $0.contains(value) }) {
            return stackIndex
        } else {
            let length = max(ranges.endIndex - 1, 0)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            return (value > ranges[length].to) ? length : 0
        }
    }
}
