//
//  RadarChartData.swift
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


open class RadarChartData: ChartData
{
    @objc open var highlightColor = NSUIColor(red: 255.0/255.0, green: 187.0/255.0, blue: 115.0/255.0, alpha: 1.0)
    @objc open var highlightLineWidth = CGFloat(1.0)
    @objc open var highlightLineDashPhase = CGFloat(0.0)
    @objc open var highlightLineDashLengths: [CGFloat]?
    
    /// Sets labels that should be drawn around the RadarChart at the end of each web line.
    @objc open var labels = [String]()
    
    /// Sets the labels that should be drawn around the RadarChart at the end of each web line.
    open func setLabels(_ labels: String...)
    {
        self.labels = labels
    }
    
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

    @objc open override func entry(for highlight: Highlight) -> ChartDataEntry?
    {
        return self[highlight.dataSetIndex].entryForIndex(Int(highlight.x))
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
<<<<<<< HEAD
        return getDataSetByIndex(highlight.dataSetIndex)?.entryForIndex(Int(highlight.x))
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
        super.init(dataSets: elements)
    }

    @objc open override func entry(for highlight: Highlight) -> ChartDataEntry?
    {
        return self[highlight.dataSetIndex].entryForIndex(Int(highlight.x))
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
    {
        super.init(dataSets: dataSets)
    }
    
    open override func entryForHighlight(_ highlight: Highlight) -> ChartDataEntry?
    {
        return getDataSetByIndex(highlight.dataSetIndex)?.entryForIndex(Int(highlight.x))
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
}
