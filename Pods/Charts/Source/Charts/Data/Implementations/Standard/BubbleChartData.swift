//
//  BubbleChartData.swift
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

open class BubbleChartData: BarLineScatterCandleBubbleChartData
{
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    public required init()
=======
    public override init()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    public required init()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    {
        super.init()
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    public override init(dataSets: [ChartDataSetProtocol])
    {
        super.init(dataSets: dataSets)
    }

    public required init(arrayLiteral elements: ChartDataSetProtocol...)
    {
        super.init(dataSets: elements)
    }

    /// Sets the width of the circle that surrounds the bubble when highlighted for all DataSet objects this data object contains
    @objc open func setHighlightCircleWidth(_ width: CGFloat)
    {
        (_dataSets as? [BubbleChartDataSetProtocol])?.forEach { $0.highlightCircleWidth = width }
=======
    public override init(dataSets: [IChartDataSet]?)
<<<<<<< HEAD
=======
    public override init(dataSets: [ChartDataSetProtocol])
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    {
        super.init(dataSets: dataSets)
    }

    public required init(arrayLiteral elements: ChartDataSetProtocol...)
    {
        super.init(dataSets: elements)
    }

    /// Sets the width of the circle that surrounds the bubble when highlighted for all DataSet objects this data object contains
    @objc open func setHighlightCircleWidth(_ width: CGFloat)
    {
<<<<<<< HEAD
        (_dataSets as? [IBubbleChartDataSet])?.forEach { $0.highlightCircleWidth = width }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
        (_dataSets as? [BubbleChartDataSetProtocol])?.forEach { $0.highlightCircleWidth = width }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
    {
        super.init(dataSets: dataSets)
    }
    
    /// Sets the width of the circle that surrounds the bubble when highlighted for all DataSet objects this data object contains
    @objc open func setHighlightCircleWidth(_ width: CGFloat)
    {
        (_dataSets as? [IBubbleChartDataSet])?.forEach { $0.highlightCircleWidth = width }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
}
