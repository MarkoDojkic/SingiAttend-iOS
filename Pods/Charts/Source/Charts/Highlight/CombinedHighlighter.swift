//
//  CombinedHighlighter.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
import Algorithms
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
import Algorithms
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
import Algorithms
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
import Foundation
import CoreGraphics

@objc(CombinedChartHighlighter)
open class CombinedHighlighter: ChartHighlighter
{
    /// bar highlighter for supporting stacked highlighting
    private var barHighlighter: BarHighlighter?
    
    @objc public init(chart: CombinedChartDataProvider, barDataProvider: BarChartDataProvider)
    {
        super.init(chart: chart)
        
        // if there is BarData, create a BarHighlighter
        self.barHighlighter = barDataProvider.barData == nil ? nil : BarHighlighter(chart: barDataProvider)
    }
    
    open override func getHighlights(xValue: Double, x: CGFloat, y: CGFloat) -> [Highlight]
    {
        var vals = [Highlight]()
        
        guard
            let chart = self.chart as? CombinedChartDataProvider,
            let dataObjects = chart.combinedData?.allData
            else { return vals }
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        for (i, dataObject) in dataObjects.indexed()
        {
=======
        for i in 0..<dataObjects.count
        {
            let dataObject = dataObjects[i]

>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        for (i, dataObject) in dataObjects.indexed()
        {
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            // in case of BarData, let the BarHighlighter take over
            if barHighlighter != nil && dataObject is BarChartData,
                let high = barHighlighter?.getHighlight(x: x, y: y)
            {
                high.dataIndex = i
                vals.append(high)
            }
            else
            {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
                for (j, set) in dataObject.indexed() where set.isHighlightEnabled
                {
                    let highs = buildHighlights(dataSet: set, dataSetIndex: j, xValue: xValue, rounding: .closest)
=======
                for j in 0..<dataObject.dataSetCount
                {
                    guard let dataSet = dataObject.getDataSetByIndex(j),
                        dataSet.isHighlightEnabled      // don't include datasets that cannot be highlighted
                        else { continue }

                    let highs = buildHighlights(dataSet: dataSet, dataSetIndex: j, xValue: xValue, rounding: .closest)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
                for (j, set) in dataObject.indexed() where set.isHighlightEnabled
                {
                    let highs = buildHighlights(dataSet: set, dataSetIndex: j, xValue: xValue, rounding: .closest)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

                    for high in highs
                    {
                        high.dataIndex = i
                        vals.append(high)
                    }
                }
            }
        }
        
        return vals
    }
}
