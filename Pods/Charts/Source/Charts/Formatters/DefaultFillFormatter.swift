//
//  DefaultFillFormatter.swift
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

/// Default formatter that calculates the position of the filled line.
@objc(ChartDefaultFillFormatter)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
open class DefaultFillFormatter: NSObject, FillFormatter
{
    public typealias Block = (
        _ dataSet: LineChartDataSetProtocol,
=======
open class DefaultFillFormatter: NSObject, IFillFormatter
{
    public typealias Block = (
        _ dataSet: ILineChartDataSet,
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
open class DefaultFillFormatter: NSObject, FillFormatter
{
    public typealias Block = (
        _ dataSet: LineChartDataSetProtocol,
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        _ dataProvider: LineChartDataProvider) -> CGFloat
    
    @objc open var block: Block?
    
    public override init() { }
    
    @objc public init(block: @escaping Block)
    {
        self.block = block
    }
    
    @objc public static func with(block: @escaping Block) -> DefaultFillFormatter?
    {
        return DefaultFillFormatter(block: block)
    }
    
    open func getFillLinePosition(
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        dataSet: LineChartDataSetProtocol,
=======
        dataSet: ILineChartDataSet,
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        dataSet: LineChartDataSetProtocol,
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        dataProvider: LineChartDataProvider) -> CGFloat
    {
        guard block == nil else { return block!(dataSet, dataProvider) }
        var fillMin: CGFloat = 0.0

        if dataSet.yMax > 0.0 && dataSet.yMin < 0.0
        {
            fillMin = 0.0
        }
        else if let data = dataProvider.data
        {
            let max = data.yMax > 0.0 ? 0.0 : dataProvider.chartYMax
            let min = data.yMin < 0.0 ? 0.0 : dataProvider.chartYMin

            fillMin = CGFloat(dataSet.yMin >= 0.0 ? min : max)
        }

        return fillMin
    }
}
