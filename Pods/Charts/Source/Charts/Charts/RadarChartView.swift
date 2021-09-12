//
//  RadarChartView.swift
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


/// Implementation of the RadarChart, a "spidernet"-like chart. It works best
/// when displaying 5-10 entries per DataSet.
open class RadarChartView: PieRadarChartViewBase
{
    /// width of the web lines that come from the center.
    @objc open var webLineWidth = CGFloat(1.5)
    
    /// width of the web lines that are in between the lines coming from the center
    @objc open var innerWebLineWidth = CGFloat(0.75)
    
    /// color for the web lines that come from the center
    @objc open var webColor = NSUIColor(red: 122/255.0, green: 122/255.0, blue: 122.0/255.0, alpha: 1.0)
    
    /// color for the web lines in between the lines that come from the center.
    @objc open var innerWebColor = NSUIColor(red: 122/255.0, green: 122/255.0, blue: 122.0/255.0, alpha: 1.0)
    
    /// transparency the grid is drawn with (0.0 - 1.0)
    @objc open var webAlpha: CGFloat = 150.0 / 255.0
    
    /// flag indicating if the web lines should be drawn or not
    @objc open var drawWeb = true
    
    /// modulus that determines how many labels and web-lines are skipped before the next is drawn
    private var _skipWebLineCount = 0
    
    /// the object reprsenting the y-axis labels
    private var _yAxis: YAxis!
    
    internal var _yAxisRenderer: YAxisRendererRadarChart!
    internal var _xAxisRenderer: XAxisRendererRadarChart!
    
    public override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    internal override func initialize()
    {
        super.initialize()
        
        _yAxis = YAxis(position: .left)
        _yAxis.labelXOffset = 10.0
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        renderer = RadarChartRenderer(chart: self, animator: chartAnimator, viewPortHandler: viewPortHandler)
        
        _yAxisRenderer = YAxisRendererRadarChart(viewPortHandler: viewPortHandler, axis: _yAxis, chart: self)
        _xAxisRenderer = XAxisRendererRadarChart(viewPortHandler: viewPortHandler, axis: xAxis, chart: self)

=======
        renderer = RadarChartRenderer(chart: self, animator: _animator, viewPortHandler: _viewPortHandler)
        
        _yAxisRenderer = YAxisRendererRadarChart(viewPortHandler: _viewPortHandler, yAxis: _yAxis, chart: self)
        _xAxisRenderer = XAxisRendererRadarChart(viewPortHandler: _viewPortHandler, xAxis: _xAxis, chart: self)
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        renderer = RadarChartRenderer(chart: self, animator: chartAnimator, viewPortHandler: viewPortHandler)
        
        _yAxisRenderer = YAxisRendererRadarChart(viewPortHandler: viewPortHandler, axis: _yAxis, chart: self)
        _xAxisRenderer = XAxisRendererRadarChart(viewPortHandler: viewPortHandler, axis: xAxis, chart: self)

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        self.highlighter = RadarHighlighter(chart: self)
    }

    internal override func calcMinMax()
    {
        super.calcMinMax()
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        guard let data = data else { return }
        
        _yAxis.calculate(min: data.getYMin(axis: .left), max: data.getYMax(axis: .left))
        xAxis.calculate(min: 0.0, max: Double(data.maxEntryCountSet?.entryCount ?? 0))
=======
        guard let data = _data else { return }
        
        _yAxis.calculate(min: data.getYMin(axis: .left), max: data.getYMax(axis: .left))
        _xAxis.calculate(min: 0.0, max: Double(data.maxEntryCountSet?.entryCount ?? 0))
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        guard let data = data else { return }
        
        _yAxis.calculate(min: data.getYMin(axis: .left), max: data.getYMax(axis: .left))
        xAxis.calculate(min: 0.0, max: Double(data.maxEntryCountSet?.entryCount ?? 0))
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
    
    open override func notifyDataSetChanged()
    {
        calcMinMax()

        _yAxisRenderer?.computeAxis(min: _yAxis._axisMinimum, max: _yAxis._axisMaximum, inverted: _yAxis.isInverted)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        _xAxisRenderer?.computeAxis(min: xAxis._axisMinimum, max: xAxis._axisMaximum, inverted: false)
        
        if let data = data,
            !legend.isLegendCustom
        {
            legendRenderer.computeLegend(data: data)
=======
        _xAxisRenderer?.computeAxis(min: _xAxis._axisMinimum, max: _xAxis._axisMaximum, inverted: false)
<<<<<<< HEAD
=======
        _xAxisRenderer?.computeAxis(min: xAxis._axisMinimum, max: xAxis._axisMaximum, inverted: false)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        
        if let data = data,
            !legend.isLegendCustom
        {
<<<<<<< HEAD
            legendRenderer?.computeLegend(data: data)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
            legendRenderer.computeLegend(data: data)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
        
        if let data = _data,
            let legend = _legend,
            !legend.isLegendCustom
        {
            legendRenderer?.computeLegend(data: data)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
        
        calculateOffsets()
        
        setNeedsDisplay()
    }
    
    open override func draw(_ rect: CGRect)
    {
        super.draw(rect)

        guard data != nil, let renderer = renderer else { return }
        
        let optionalContext = NSUIGraphicsGetCurrentContext()
        guard let context = optionalContext else { return }
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        if xAxis.isEnabled
        {
            _xAxisRenderer.computeAxis(min: xAxis._axisMinimum, max: xAxis._axisMaximum, inverted: false)
=======
        if _xAxis.isEnabled
        {
            _xAxisRenderer.computeAxis(min: _xAxis._axisMinimum, max: _xAxis._axisMaximum, inverted: false)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        if xAxis.isEnabled
        {
            _xAxisRenderer.computeAxis(min: xAxis._axisMinimum, max: xAxis._axisMaximum, inverted: false)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
        
        _xAxisRenderer?.renderAxisLabels(context: context)
        
        if drawWeb
        {
            renderer.drawExtras(context: context)
        }
        
        if _yAxis.isEnabled && _yAxis.isDrawLimitLinesBehindDataEnabled
        {
            _yAxisRenderer.renderLimitLines(context: context)
        }

        renderer.drawData(context: context)

        if valuesToHighlight()
        {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            renderer.drawHighlighted(context: context, indices: highlighted)
=======
            renderer.drawHighlighted(context: context, indices: _indicesToHighlight)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            renderer.drawHighlighted(context: context, indices: highlighted)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
        
        if _yAxis.isEnabled && !_yAxis.isDrawLimitLinesBehindDataEnabled
        {
            _yAxisRenderer.renderLimitLines(context: context)
        }
        
        _yAxisRenderer.renderAxisLabels(context: context)

        renderer.drawValues(context: context)

        legendRenderer.renderLegend(context: context)

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        drawDescription(in: context)
=======
        drawDescription(context: context)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        drawDescription(in: context)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

        drawMarkers(context: context)
    }

    /// The factor that is needed to transform values into pixels.
    @objc open var factor: CGFloat
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let content = viewPortHandler.contentRect
=======
        let content = _viewPortHandler.contentRect
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let content = viewPortHandler.contentRect
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        return min(content.width / 2.0, content.height / 2.0)
                / CGFloat(_yAxis.axisRange)
    }

    /// The angle that each slice in the radar chart occupies.
    @objc open var sliceAngle: CGFloat
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        return 360.0 / CGFloat(data?.maxEntryCountSet?.entryCount ?? 0)
=======
        return 360.0 / CGFloat(_data?.maxEntryCountSet?.entryCount ?? 0)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        return 360.0 / CGFloat(data?.maxEntryCountSet?.entryCount ?? 0)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }

    open override func indexForAngle(_ angle: CGFloat) -> Int
    {
        // take the current angle of the chart into consideration
        let a = (angle - self.rotationAngle).normalizedAngle
        
        let sliceAngle = self.sliceAngle
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let max = data?.maxEntryCountSet?.entryCount ?? 0
        return (0..<max).firstIndex {
            sliceAngle * CGFloat($0 + 1) - sliceAngle / 2.0 > a
        } ?? 0
=======
        let max = _data?.maxEntryCountSet?.entryCount ?? 0
        return (0..<max).firstIndex {
            sliceAngle * CGFloat($0 + 1) - sliceAngle / 2.0 > a
        } ?? max
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let max = data?.maxEntryCountSet?.entryCount ?? 0
        return (0..<max).firstIndex {
            sliceAngle * CGFloat($0 + 1) - sliceAngle / 2.0 > a
        } ?? 0
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }

    /// The object that represents all y-labels of the RadarChart.
    @objc open var yAxis: YAxis
    {
        return _yAxis
    }

    /// Sets the number of web-lines that should be skipped on chart web before the next one is drawn. This targets the lines that come from the center of the RadarChart.
    /// if count = 1 -> 1 line is skipped in between
    @objc open var skipWebLineCount: Int
    {
        get
        {
            return _skipWebLineCount
        }
        set
        {
            _skipWebLineCount = max(0, newValue)
        }
    }
    
    internal override var requiredLegendOffset: CGFloat
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        return legend.font.pointSize * 4.0
=======
        return _legend.font.pointSize * 4.0
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        return legend.font.pointSize * 4.0
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }

    internal override var requiredBaseOffset: CGFloat
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        return xAxis.isEnabled && xAxis.isDrawLabelsEnabled ? xAxis.labelRotatedWidth : 10.0
=======
        return _xAxis.isEnabled && _xAxis.isDrawLabelsEnabled ? _xAxis.labelRotatedWidth : 10.0
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        return xAxis.isEnabled && xAxis.isDrawLabelsEnabled ? xAxis.labelRotatedWidth : 10.0
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }

    open override var radius: CGFloat
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let content = viewPortHandler.contentRect
=======
        let content = _viewPortHandler.contentRect
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let content = viewPortHandler.contentRect
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        return min(content.width / 2.0, content.height / 2.0)
    }

    /// The maximum value this chart can display on it's y-axis.
    open override var chartYMax: Double { return _yAxis._axisMaximum }
    
    /// The minimum value this chart can display on it's y-axis.
    open override var chartYMin: Double { return _yAxis._axisMinimum }
    
    /// The range of y-values this chart can display.
    @objc open var yRange: Double { return _yAxis.axisRange }
}
