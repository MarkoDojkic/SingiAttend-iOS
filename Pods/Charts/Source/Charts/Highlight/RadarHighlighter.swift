//
//  RadarHighlighter.swift
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

@objc(RadarChartHighlighter)
open class RadarHighlighter: PieRadarHighlighter
{
    open override func closestHighlight(index: Int, x: CGFloat, y: CGFloat) -> Highlight?
    {
        guard let chart = self.chart as? RadarChartView else { return nil }
        
        let highlights = getHighlights(forIndex: index)
        
        let distanceToCenter = Double(chart.distanceToCenter(x: x, y: y) / chart.factor)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

        func closestToCenter(lhs: Highlight, rhs: Highlight) -> Bool {
            abs(lhs.y - distanceToCenter) < abs(rhs.y - distanceToCenter)
        }

        let closest = highlights.min(by: closestToCenter(lhs:rhs:))
=======
        
        var closest: Highlight?
        var distance = Double.greatestFiniteMagnitude
        
        for high in highlights
        {
            let cdistance = abs(high.y - distanceToCenter)
            if cdistance < distance
            {
                closest = high
                distance = cdistance
            }
        }
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======

        func closestToCenter(lhs: Highlight, rhs: Highlight) -> Bool {
            abs(lhs.y - distanceToCenter) < abs(rhs.y - distanceToCenter)
        }

        let closest = highlights.min(by: closestToCenter(lhs:rhs:))
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        return closest
    }
    
    /// - Parameters:
    ///   - index:
    /// - Returns: An array of Highlight objects for the given index.
    /// The Highlight objects give information about the value at the selected index and DataSet it belongs to.
    internal func getHighlights(forIndex index: Int) -> [Highlight]
    {
        var vals = [Highlight]()
        
        guard
            let chart = self.chart as? RadarChartView,
            let chartData = chart.data
            else { return vals }
        
        let phaseX = chart.chartAnimator.phaseX
        let phaseY = chart.chartAnimator.phaseY
        let sliceangle = chart.sliceAngle
        let factor = chart.factor

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        for (i, dataSet) in chartData.indexed()
        {
            guard let entry = dataSet.entryForIndex(index) else { continue }
=======
        for i in chartData.dataSets.indices
        {
            guard
                let dataSet = chartData.getDataSetByIndex(i),
                let entry = dataSet.entryForIndex(index)
                else { continue }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        for (i, dataSet) in chartData.indexed()
        {
            guard let entry = dataSet.entryForIndex(index) else { continue }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            
            let y = (entry.y - chart.chartYMin)
            
            let p = chart.centerOffsets.moving(distance: CGFloat(y) * factor * CGFloat(phaseY),
                                               atAngle: sliceangle * CGFloat(index) * CGFloat(phaseX) + chart.rotationAngle)

            let highlight = Highlight(x: Double(index), y: entry.y, xPx: p.x, yPx: p.y, dataSetIndex: i, axis: dataSet.axisDependency)
            vals.append(highlight)
        }
        
        return vals
    }
}
