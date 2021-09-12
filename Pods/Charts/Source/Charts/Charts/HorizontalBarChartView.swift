//
//  HorizontalBarChartView.swift
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

/// BarChart with horizontal bar orientation. In this implementation, x- and y-axis are switched.
open class HorizontalBarChartView: BarChartView
{
    internal override func initialize()
    {
        super.initialize()
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        _leftAxisTransformer = TransformerHorizontalBarChart(viewPortHandler: viewPortHandler)
        _rightAxisTransformer = TransformerHorizontalBarChart(viewPortHandler: viewPortHandler)

        renderer = HorizontalBarChartRenderer(dataProvider: self, animator: chartAnimator, viewPortHandler: viewPortHandler)
        leftYAxisRenderer = YAxisRendererHorizontalBarChart(viewPortHandler: viewPortHandler, axis: leftAxis, transformer: _leftAxisTransformer)
        rightYAxisRenderer = YAxisRendererHorizontalBarChart(viewPortHandler: viewPortHandler, axis: rightAxis, transformer: _rightAxisTransformer)
        xAxisRenderer = XAxisRendererHorizontalBarChart(viewPortHandler: viewPortHandler, axis: xAxis, transformer: _leftAxisTransformer, chart: self)

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
        _leftAxisTransformer = TransformerHorizontalBarChart(viewPortHandler: _viewPortHandler)
        _rightAxisTransformer = TransformerHorizontalBarChart(viewPortHandler: _viewPortHandler)
        
        renderer = HorizontalBarChartRenderer(dataProvider: self, animator: _animator, viewPortHandler: _viewPortHandler)
        leftYAxisRenderer = YAxisRendererHorizontalBarChart(viewPortHandler: _viewPortHandler, yAxis: leftAxis, transformer: _leftAxisTransformer)
        rightYAxisRenderer = YAxisRendererHorizontalBarChart(viewPortHandler: _viewPortHandler, yAxis: rightAxis, transformer: _rightAxisTransformer)
        xAxisRenderer = XAxisRendererHorizontalBarChart(viewPortHandler: _viewPortHandler, xAxis: _xAxis, transformer: _leftAxisTransformer, chart: self)
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        self.highlighter = HorizontalBarHighlighter(chart: self)
    }
    
    internal override func calculateLegendOffsets(offsetLeft: inout CGFloat, offsetTop: inout CGFloat, offsetRight: inout CGFloat, offsetBottom: inout CGFloat)
    {
        guard
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
            let legend = _legend,
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
            let legend = _legend,
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
            legend.isEnabled,
            !legend.drawInside
        else { return }
        
        // setup offsets for legend
        switch legend.orientation
        {
        case .vertical:
            switch legend.horizontalAlignment
            {
            case .left:
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                offsetLeft += min(legend.neededWidth, viewPortHandler.chartWidth * legend.maxSizePercent) + legend.xOffset
                
            case .right:
                offsetRight += min(legend.neededWidth, viewPortHandler.chartWidth * legend.maxSizePercent) + legend.xOffset
=======
                offsetLeft += min(legend.neededWidth, _viewPortHandler.chartWidth * legend.maxSizePercent) + legend.xOffset
                
            case .right:
                offsetRight += min(legend.neededWidth, _viewPortHandler.chartWidth * legend.maxSizePercent) + legend.xOffset
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
                offsetLeft += min(legend.neededWidth, viewPortHandler.chartWidth * legend.maxSizePercent) + legend.xOffset
                
            case .right:
                offsetRight += min(legend.neededWidth, viewPortHandler.chartWidth * legend.maxSizePercent) + legend.xOffset
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                
            case .center:
                
                switch legend.verticalAlignment
                {
                case .top:
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                    offsetTop += min(legend.neededHeight, viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
                    
                case .bottom:
                    offsetBottom += min(legend.neededHeight, viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
=======
                    offsetTop += min(legend.neededHeight, _viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
                    
                case .bottom:
                    offsetBottom += min(legend.neededHeight, _viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
                    offsetTop += min(legend.neededHeight, viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
                    
                case .bottom:
                    offsetBottom += min(legend.neededHeight, viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                    
                default:
                    break
                }
            }
            
        case .horizontal:
            switch legend.verticalAlignment
            {
            case .top:
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                offsetTop += min(legend.neededHeight, viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
=======
                offsetTop += min(legend.neededHeight, _viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
                offsetTop += min(legend.neededHeight, viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                
                // left axis equals the top x-axis in a horizontal chart
                if leftAxis.isEnabled && leftAxis.isDrawLabelsEnabled
                {
                    offsetTop += leftAxis.getRequiredHeightSpace()
                }
                
            case .bottom:
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                offsetBottom += min(legend.neededHeight, viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
=======
                offsetBottom += min(legend.neededHeight, _viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
                offsetBottom += min(legend.neededHeight, viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

                // right axis equals the bottom x-axis in a horizontal chart
                if rightAxis.isEnabled && rightAxis.isDrawLabelsEnabled
                {
                    offsetBottom += rightAxis.getRequiredHeightSpace()
                }
            default:
                break
            }
        }
    }
    
    internal override func calculateOffsets()
    {
        var offsetLeft: CGFloat = 0.0,
        offsetRight: CGFloat = 0.0,
        offsetTop: CGFloat = 0.0,
        offsetBottom: CGFloat = 0.0
        
        calculateLegendOffsets(offsetLeft: &offsetLeft,
                               offsetTop: &offsetTop,
                               offsetRight: &offsetRight,
                               offsetBottom: &offsetBottom)
        
        // offsets for y-labels
        if leftAxis.needsOffset
        {
            offsetTop += leftAxis.getRequiredHeightSpace()
        }
        
        if rightAxis.needsOffset
        {
            offsetBottom += rightAxis.getRequiredHeightSpace()
        }
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let xlabelwidth = xAxis.labelRotatedWidth
        
        if xAxis.isEnabled
        {
            // offsets for x-labels
            if xAxis.labelPosition == .bottom
            {
                offsetLeft += xlabelwidth
            }
            else if xAxis.labelPosition == .top
            {
                offsetRight += xlabelwidth
            }
            else if xAxis.labelPosition == .bothSided
=======
        let xlabelwidth = _xAxis.labelRotatedWidth
<<<<<<< HEAD
=======
        let xlabelwidth = xAxis.labelRotatedWidth
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        
        if xAxis.isEnabled
        {
            // offsets for x-labels
            if xAxis.labelPosition == .bottom
            {
                offsetLeft += xlabelwidth
            }
            else if xAxis.labelPosition == .top
            {
                offsetRight += xlabelwidth
            }
<<<<<<< HEAD
            else if _xAxis.labelPosition == .bothSided
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
            else if xAxis.labelPosition == .bothSided
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
        
        if _xAxis.isEnabled
        {
            // offsets for x-labels
            if _xAxis.labelPosition == .bottom
            {
                offsetLeft += xlabelwidth
            }
            else if _xAxis.labelPosition == .top
            {
                offsetRight += xlabelwidth
            }
            else if _xAxis.labelPosition == .bothSided
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
            {
                offsetLeft += xlabelwidth
                offsetRight += xlabelwidth
            }
        }
        
        offsetTop += self.extraTopOffset
        offsetRight += self.extraRightOffset
        offsetBottom += self.extraBottomOffset
        offsetLeft += self.extraLeftOffset

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        viewPortHandler.restrainViewPort(
=======
        _viewPortHandler.restrainViewPort(
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        viewPortHandler.restrainViewPort(
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            offsetLeft: max(self.minOffset, offsetLeft),
            offsetTop: max(self.minOffset, offsetTop),
            offsetRight: max(self.minOffset, offsetRight),
            offsetBottom: max(self.minOffset, offsetBottom))
        
        prepareOffsetMatrix()
        prepareValuePxMatrix()
    }
    
    internal override func prepareValuePxMatrix()
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        _rightAxisTransformer.prepareMatrixValuePx(chartXMin: rightAxis._axisMinimum, deltaX: CGFloat(rightAxis.axisRange), deltaY: CGFloat(xAxis.axisRange), chartYMin: xAxis._axisMinimum)
        _leftAxisTransformer.prepareMatrixValuePx(chartXMin: leftAxis._axisMinimum, deltaX: CGFloat(leftAxis.axisRange), deltaY: CGFloat(xAxis.axisRange), chartYMin: xAxis._axisMinimum)
=======
        _rightAxisTransformer.prepareMatrixValuePx(chartXMin: rightAxis._axisMinimum, deltaX: CGFloat(rightAxis.axisRange), deltaY: CGFloat(_xAxis.axisRange), chartYMin: _xAxis._axisMinimum)
        _leftAxisTransformer.prepareMatrixValuePx(chartXMin: leftAxis._axisMinimum, deltaX: CGFloat(leftAxis.axisRange), deltaY: CGFloat(_xAxis.axisRange), chartYMin: _xAxis._axisMinimum)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        _rightAxisTransformer.prepareMatrixValuePx(chartXMin: rightAxis._axisMinimum, deltaX: CGFloat(rightAxis.axisRange), deltaY: CGFloat(xAxis.axisRange), chartYMin: xAxis._axisMinimum)
        _leftAxisTransformer.prepareMatrixValuePx(chartXMin: leftAxis._axisMinimum, deltaX: CGFloat(leftAxis.axisRange), deltaY: CGFloat(xAxis.axisRange), chartYMin: xAxis._axisMinimum)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
    
    open override func getMarkerPosition(highlight: Highlight) -> CGPoint
    {
        return CGPoint(x: highlight.drawY, y: highlight.drawX)
    }
    
    open override func getBarBounds(entry e: BarChartDataEntry) -> CGRect
    {
        guard
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            let data = data as? BarChartData,
            let set = data.getDataSetForEntry(e) as? BarChartDataSetProtocol
            else { return .null }
=======
            let data = _data as? BarChartData,
            let set = data.getDataSetForEntry(e) as? IBarChartDataSet
            else { return CGRect.null }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            let data = data as? BarChartData,
            let set = data.getDataSetForEntry(e) as? BarChartDataSetProtocol
            else { return .null }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        
        let y = e.y
        let x = e.x
        
        let barWidth = data.barWidth
        
        let top = x - 0.5 + barWidth / 2.0
        let bottom = x + 0.5 - barWidth / 2.0
        let left = y >= 0.0 ? y : 0.0
        let right = y <= 0.0 ? y : 0.0
        
        var bounds = CGRect(x: left, y: top, width: right - left, height: bottom - top)
        
        getTransformer(forAxis: set.axisDependency).rectValueToPixel(&bounds)
        
        return bounds
    }
    
    open override func getPosition(entry e: ChartDataEntry, axis: YAxis.AxisDependency) -> CGPoint
    {
        var vals = CGPoint(x: CGFloat(e.y), y: CGFloat(e.x))
        
        getTransformer(forAxis: axis).pointValueToPixel(&vals)
        
        return vals
    }

    open override func getHighlightByTouchPoint(_ pt: CGPoint) -> Highlight?
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        if data === nil
=======
        if _data === nil
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        if data === nil
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        {
            Swift.print("Can't select by touch. No data set.", terminator: "\n")
            return nil
        }
        
        return self.highlighter?.getHighlight(x: pt.y, y: pt.x)
    }
    
    /// The lowest x-index (value on the x-axis) that is still visible on he chart.
    open override var lowestVisibleX: Double
    {
        var pt = CGPoint(
            x: viewPortHandler.contentLeft,
            y: viewPortHandler.contentBottom)
        
        getTransformer(forAxis: .left).pixelToValues(&pt)
        
        return max(xAxis._axisMinimum, Double(pt.y))
    }
    
    /// The highest x-index (value on the x-axis) that is still visible on the chart.
    open override var highestVisibleX: Double
    {
        var pt = CGPoint(
            x: viewPortHandler.contentLeft,
            y: viewPortHandler.contentTop)
        
        getTransformer(forAxis: .left).pixelToValues(&pt)
        
        return min(xAxis._axisMaximum, Double(pt.y))
    }
    
    // MARK: - Viewport
    
    open override func setVisibleXRangeMaximum(_ maxXRange: Double)
    {
        let xScale = xAxis.axisRange / maxXRange
        viewPortHandler.setMinimumScaleY(CGFloat(xScale))
    }
    
    open override func setVisibleXRangeMinimum(_ minXRange: Double)
    {
        let xScale = xAxis.axisRange / minXRange
        viewPortHandler.setMaximumScaleY(CGFloat(xScale))
    }
    
    open override func setVisibleXRange(minXRange: Double, maxXRange: Double)
    {
        let minScale = xAxis.axisRange / minXRange
        let maxScale = xAxis.axisRange / maxXRange
        viewPortHandler.setMinMaxScaleY(minScaleY: CGFloat(minScale), maxScaleY: CGFloat(maxScale))
    }
    
    open override func setVisibleYRangeMaximum(_ maxYRange: Double, axis: YAxis.AxisDependency)
    {
        let yScale = getAxisRange(axis: axis) / maxYRange
        viewPortHandler.setMinimumScaleX(CGFloat(yScale))
    }
    
    open override func setVisibleYRangeMinimum(_ minYRange: Double, axis: YAxis.AxisDependency)
    {
        let yScale = getAxisRange(axis: axis) / minYRange
        viewPortHandler.setMaximumScaleX(CGFloat(yScale))
    }
    
    open override func setVisibleYRange(minYRange: Double, maxYRange: Double, axis: YAxis.AxisDependency)
    {
        let minScale = getAxisRange(axis: axis) / minYRange
        let maxScale = getAxisRange(axis: axis) / maxYRange
        viewPortHandler.setMinMaxScaleX(minScaleX: CGFloat(minScale), maxScaleX: CGFloat(maxScale))
    }
}
