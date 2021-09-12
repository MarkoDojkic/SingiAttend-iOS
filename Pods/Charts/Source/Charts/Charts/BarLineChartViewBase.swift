//
//  BarLineChartViewBase.swift
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
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
import CoreGraphics
import Foundation

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
=======
import Foundation
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
import CoreGraphics
import Foundation

#if canImport(UIKit)
<<<<<<< HEAD
=======
import CoreGraphics

#if canImport(UIKit)
>>>>>>> e716a0e (Initial commit - transfer from other project)
    import UIKit
#endif

#if canImport(Cocoa)
import Cocoa
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
import UIKit
#elseif canImport(AppKit)
import AppKit
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
#endif

/// Base-class of LineChart, BarChart, ScatterChart and CandleStickChart.
open class BarLineChartViewBase: ChartViewBase, BarLineScatterCandleBubbleChartDataProvider, NSUIGestureRecognizerDelegate
{
    /// the maximum number of entries to which values will be drawn
    /// (entry numbers greater than this value will cause value-labels to disappear)
    internal var _maxVisibleCount = 100
    
    /// flag that indicates if auto scaling on the y axis is enabled
    private var _autoScaleMinMaxEnabled = false
    
    private var _pinchZoomEnabled = false
    private var _doubleTapToZoomEnabled = true
    private var _dragXEnabled = true
    private var _dragYEnabled = true
    
    private var _scaleXEnabled = true
    private var _scaleYEnabled = true
    
    /// the color for the background of the chart-drawing area (everything behind the grid lines).
    @objc open var gridBackgroundColor = NSUIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
    
    @objc open var borderColor = NSUIColor.black
    @objc open var borderLineWidth: CGFloat = 1.0
    
    /// flag indicating if the grid background should be drawn or not
    @objc open var drawGridBackgroundEnabled = false
    
    /// When enabled, the borders rectangle will be rendered.
    /// If this is enabled, there is no point drawing the axis-lines of x- and y-axis.
    @objc open var drawBordersEnabled = false
    
    /// When enabled, the values will be clipped to contentRect, otherwise they can bleed outside the content rect.
    @objc open var clipValuesToContentEnabled: Bool = false

    /// When disabled, the data and/or highlights will not be clipped to contentRect. Disabling this option can
    /// be useful, when the data lies fully within the content rect, but is drawn in such a way (such as thick lines)
    /// that there is unwanted clipping.
    @objc open var clipDataToContentEnabled: Bool = true

    /// Sets the minimum offset (padding) around the chart, defaults to 10
    @objc open var minOffset = CGFloat(10.0)
    
    /// Sets whether the chart should keep its position (zoom / scroll) after a rotation (orientation change)
    /// **default**: false
    @objc open var keepPositionOnRotation: Bool = false
    
    /// The left y-axis object. In the horizontal bar-chart, this is the
    /// top axis.
    @objc open internal(set) var leftAxis = YAxis(position: .left)
    
    /// The right y-axis object. In the horizontal bar-chart, this is the
    /// bottom axis.
    @objc open internal(set) var rightAxis = YAxis(position: .right)

    /// The left Y axis renderer. This is a read-write property so you can set your own custom renderer here.
    /// **default**: An instance of YAxisRenderer
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    @objc open lazy var leftYAxisRenderer = YAxisRenderer(viewPortHandler: viewPortHandler, axis: leftAxis, transformer: _leftAxisTransformer)

    /// The right Y axis renderer. This is a read-write property so you can set your own custom renderer here.
    /// **default**: An instance of YAxisRenderer
    @objc open lazy var rightYAxisRenderer = YAxisRenderer(viewPortHandler: viewPortHandler, axis: rightAxis, transformer: _rightAxisTransformer)

=======
    @objc open lazy var leftYAxisRenderer = YAxisRenderer(viewPortHandler: _viewPortHandler, yAxis: leftAxis, transformer: _leftAxisTransformer)

    /// The right Y axis renderer. This is a read-write property so you can set your own custom renderer here.
    /// **default**: An instance of YAxisRenderer
    @objc open lazy var rightYAxisRenderer = YAxisRenderer(viewPortHandler: _viewPortHandler, yAxis: rightAxis, transformer: _rightAxisTransformer)
    
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    @objc open lazy var leftYAxisRenderer = YAxisRenderer(viewPortHandler: viewPortHandler, axis: leftAxis, transformer: _leftAxisTransformer)

    /// The right Y axis renderer. This is a read-write property so you can set your own custom renderer here.
    /// **default**: An instance of YAxisRenderer
    @objc open lazy var rightYAxisRenderer = YAxisRenderer(viewPortHandler: viewPortHandler, axis: rightAxis, transformer: _rightAxisTransformer)

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    internal var _leftAxisTransformer: Transformer!
    internal var _rightAxisTransformer: Transformer!
    
    /// The X axis renderer. This is a read-write property so you can set your own custom renderer here.
    /// **default**: An instance of XAxisRenderer
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    @objc open lazy var xAxisRenderer = XAxisRenderer(viewPortHandler: viewPortHandler, axis: xAxis, transformer: _leftAxisTransformer)

=======
    @objc open lazy var xAxisRenderer = XAxisRenderer(viewPortHandler: _viewPortHandler, xAxis: _xAxis, transformer: _leftAxisTransformer)
    
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    @objc open lazy var xAxisRenderer = XAxisRenderer(viewPortHandler: viewPortHandler, axis: xAxis, transformer: _leftAxisTransformer)

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    internal var _tapGestureRecognizer: NSUITapGestureRecognizer!
    internal var _doubleTapGestureRecognizer: NSUITapGestureRecognizer!
    #if !os(tvOS)
    internal var _pinchGestureRecognizer: NSUIPinchGestureRecognizer!
    #endif
    internal var _panGestureRecognizer: NSUIPanGestureRecognizer!
    
    /// flag that indicates if a custom viewport offset has been set
    private var _customViewPortEnabled = false
    
    public override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    deinit
    {
        stopDeceleration()
    }
    
    internal override func initialize()
    {
        super.initialize()

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        _leftAxisTransformer = Transformer(viewPortHandler: viewPortHandler)
        _rightAxisTransformer = Transformer(viewPortHandler: viewPortHandler)

=======
        _leftAxisTransformer = Transformer(viewPortHandler: _viewPortHandler)
        _rightAxisTransformer = Transformer(viewPortHandler: _viewPortHandler)
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        _leftAxisTransformer = Transformer(viewPortHandler: viewPortHandler)
        _rightAxisTransformer = Transformer(viewPortHandler: viewPortHandler)

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        self.highlighter = ChartHighlighter(chart: self)
        
        _tapGestureRecognizer = NSUITapGestureRecognizer(target: self, action: #selector(tapGestureRecognized(_:)))
        _doubleTapGestureRecognizer = NSUITapGestureRecognizer(target: self, action: #selector(doubleTapGestureRecognized(_:)))
        _doubleTapGestureRecognizer.nsuiNumberOfTapsRequired = 2
        _panGestureRecognizer = NSUIPanGestureRecognizer(target: self, action: #selector(panGestureRecognized(_:)))
        
        _panGestureRecognizer.delegate = self
        
        self.addGestureRecognizer(_tapGestureRecognizer)
        self.addGestureRecognizer(_doubleTapGestureRecognizer)
        self.addGestureRecognizer(_panGestureRecognizer)
        
        _doubleTapGestureRecognizer.isEnabled = _doubleTapToZoomEnabled
        _panGestureRecognizer.isEnabled = _dragXEnabled || _dragYEnabled

        #if !os(tvOS)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            _pinchGestureRecognizer = NSUIPinchGestureRecognizer(target: self, action: #selector(BarLineChartViewBase.pinchGestureRecognized(_:)))
            _pinchGestureRecognizer.delegate = self
            self.addGestureRecognizer(_pinchGestureRecognizer)
            _pinchGestureRecognizer.isEnabled = _pinchZoomEnabled || _scaleXEnabled || _scaleYEnabled
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
        _pinchGestureRecognizer = NSUIPinchGestureRecognizer(target: self, action: #selector(BarLineChartViewBase.pinchGestureRecognized(_:)))
        _pinchGestureRecognizer.delegate = self
        self.addGestureRecognizer(_pinchGestureRecognizer)
        _pinchGestureRecognizer.isEnabled = _pinchZoomEnabled || _scaleXEnabled || _scaleYEnabled
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        #endif
    }
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
    {
        // Saving current position of chart.
        var oldPoint: CGPoint?
        if (keepPositionOnRotation && (keyPath == "frame" || keyPath == "bounds"))
        {
            oldPoint = viewPortHandler.contentRect.origin
            getTransformer(forAxis: .left).pixelToValues(&oldPoint!)
        }
        
        // Superclass transforms chart.
        super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        
        // Restoring old position of chart
        if var newPoint = oldPoint , keepPositionOnRotation
        {
            getTransformer(forAxis: .left).pointValueToPixel(&newPoint)
            viewPortHandler.centerViewPort(pt: newPoint, chart: self)
        }
        else
        {
            viewPortHandler.refresh(newMatrix: viewPortHandler.touchMatrix, chart: self, invalidate: true)
        }
    }
    
    open override func draw(_ rect: CGRect)
    {
        super.draw(rect)

        guard data != nil, let renderer = renderer else { return }
        
        let optionalContext = NSUIGraphicsGetCurrentContext()
        guard let context = optionalContext else { return }

        // execute all drawing commands
        drawGridBackground(context: context)
        

        if _autoScaleMinMaxEnabled
        {
            autoScale()
        }

        if leftAxis.isEnabled
        {
            leftYAxisRenderer.computeAxis(min: leftAxis._axisMinimum, max: leftAxis._axisMaximum, inverted: leftAxis.isInverted)
        }
        
        if rightAxis.isEnabled
        {
            rightYAxisRenderer.computeAxis(min: rightAxis._axisMinimum, max: rightAxis._axisMaximum, inverted: rightAxis.isInverted)
        }
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        if xAxis.isEnabled
        {
            xAxisRenderer.computeAxis(min: xAxis._axisMinimum, max: xAxis._axisMaximum, inverted: false)
=======
        if _xAxis.isEnabled
        {
            xAxisRenderer.computeAxis(min: _xAxis._axisMinimum, max: _xAxis._axisMaximum, inverted: false)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        if xAxis.isEnabled
        {
            xAxisRenderer.computeAxis(min: xAxis._axisMinimum, max: xAxis._axisMaximum, inverted: false)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
        
        xAxisRenderer.renderAxisLine(context: context)
        leftYAxisRenderer.renderAxisLine(context: context)
        rightYAxisRenderer.renderAxisLine(context: context)

        // The renderers are responsible for clipping, to account for line-width center etc.
        if xAxis.drawGridLinesBehindDataEnabled
        {
            xAxisRenderer.renderGridLines(context: context)
            leftYAxisRenderer.renderGridLines(context: context)
            rightYAxisRenderer.renderGridLines(context: context)
        }
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        if xAxis.isEnabled && xAxis.isDrawLimitLinesBehindDataEnabled
=======
        if _xAxis.isEnabled && _xAxis.isDrawLimitLinesBehindDataEnabled
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        if xAxis.isEnabled && xAxis.isDrawLimitLinesBehindDataEnabled
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        {
            xAxisRenderer.renderLimitLines(context: context)
        }
        
        if leftAxis.isEnabled && leftAxis.isDrawLimitLinesBehindDataEnabled
        {
            leftYAxisRenderer.renderLimitLines(context: context)
        }
        
        if rightAxis.isEnabled && rightAxis.isDrawLimitLinesBehindDataEnabled
        {
            rightYAxisRenderer.renderLimitLines(context: context)
        }
        
        context.saveGState()
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

        // make sure the data cannot be drawn outside the content-rect
        if clipDataToContentEnabled {
            context.clip(to: viewPortHandler.contentRect)
        }

=======
<<<<<<< HEAD
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        // make sure the data cannot be drawn outside the content-rect
        if clipDataToContentEnabled {
            context.clip(to: viewPortHandler.contentRect)
        }
<<<<<<< HEAD
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
        // make sure the data cannot be drawn outside the content-rect
        if clipDataToContentEnabled {
            context.clip(to: _viewPortHandler.contentRect)
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
        renderer.drawData(context: context)
        
        // The renderers are responsible for clipping, to account for line-width center etc.
        if !xAxis.drawGridLinesBehindDataEnabled
        {
            xAxisRenderer.renderGridLines(context: context)
            leftYAxisRenderer.renderGridLines(context: context)
            rightYAxisRenderer.renderGridLines(context: context)
        }
        
        // if highlighting is enabled
        if (valuesToHighlight())
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
        
        context.restoreGState()
        
        renderer.drawExtras(context: context)
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        if xAxis.isEnabled && !xAxis.isDrawLimitLinesBehindDataEnabled
=======
        if _xAxis.isEnabled && !_xAxis.isDrawLimitLinesBehindDataEnabled
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        if xAxis.isEnabled && !xAxis.isDrawLimitLinesBehindDataEnabled
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        {
            xAxisRenderer.renderLimitLines(context: context)
        }
        
        if leftAxis.isEnabled && !leftAxis.isDrawLimitLinesBehindDataEnabled
        {
            leftYAxisRenderer.renderLimitLines(context: context)
        }
        
        if rightAxis.isEnabled && !rightAxis.isDrawLimitLinesBehindDataEnabled
        {
            rightYAxisRenderer.renderLimitLines(context: context)
        }
        
        xAxisRenderer.renderAxisLabels(context: context)
        leftYAxisRenderer.renderAxisLabels(context: context)
        rightYAxisRenderer.renderAxisLabels(context: context)

        if clipValuesToContentEnabled
        {
            context.saveGState()
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            context.clip(to: viewPortHandler.contentRect)
=======
            context.clip(to: _viewPortHandler.contentRect)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            context.clip(to: viewPortHandler.contentRect)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            
            renderer.drawValues(context: context)
            
            context.restoreGState()
        }
        else
        {
            renderer.drawValues(context: context)
        }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        legendRenderer.renderLegend(context: context)

        drawDescription(in: context)
=======
        _legendRenderer.renderLegend(context: context)

        drawDescription(context: context)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        legendRenderer.renderLegend(context: context)

        drawDescription(in: context)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        
        drawMarkers(context: context)
    }
    
    private var _autoScaleLastLowestVisibleX: Double?
    private var _autoScaleLastHighestVisibleX: Double?
    
    /// Performs auto scaling of the axis by recalculating the minimum and maximum y-values based on the entries currently in view.
    internal func autoScale()
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        guard let data = data
=======
        guard let data = _data
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        guard let data = data
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            else { return }
        
        data.calcMinMaxY(fromX: self.lowestVisibleX, toX: self.highestVisibleX)
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        xAxis.calculate(min: data.xMin, max: data.xMax)
=======
        _xAxis.calculate(min: data.xMin, max: data.xMax)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        xAxis.calculate(min: data.xMin, max: data.xMax)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        
        // calculate axis range (min / max) according to provided data
        
        if leftAxis.isEnabled
        {
            leftAxis.calculate(min: data.getYMin(axis: .left), max: data.getYMax(axis: .left))
        }
        
        if rightAxis.isEnabled
        {
            rightAxis.calculate(min: data.getYMin(axis: .right), max: data.getYMax(axis: .right))
        }
        
        calculateOffsets()
    }
    
    internal func prepareValuePxMatrix()
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        _rightAxisTransformer.prepareMatrixValuePx(chartXMin: xAxis._axisMinimum, deltaX: CGFloat(xAxis.axisRange), deltaY: CGFloat(rightAxis.axisRange), chartYMin: rightAxis._axisMinimum)
=======
        _rightAxisTransformer.prepareMatrixValuePx(chartXMin: _xAxis._axisMinimum, deltaX: CGFloat(xAxis.axisRange), deltaY: CGFloat(rightAxis.axisRange), chartYMin: rightAxis._axisMinimum)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        _rightAxisTransformer.prepareMatrixValuePx(chartXMin: xAxis._axisMinimum, deltaX: CGFloat(xAxis.axisRange), deltaY: CGFloat(rightAxis.axisRange), chartYMin: rightAxis._axisMinimum)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        _leftAxisTransformer.prepareMatrixValuePx(chartXMin: xAxis._axisMinimum, deltaX: CGFloat(xAxis.axisRange), deltaY: CGFloat(leftAxis.axisRange), chartYMin: leftAxis._axisMinimum)
    }
    
    internal func prepareOffsetMatrix()
    {
        _rightAxisTransformer.prepareMatrixOffset(inverted: rightAxis.isInverted)
        _leftAxisTransformer.prepareMatrixOffset(inverted: leftAxis.isInverted)
    }
    
    open override func notifyDataSetChanged()
    {
        renderer?.initBuffers()
        
        calcMinMax()
        
        leftYAxisRenderer.computeAxis(min: leftAxis._axisMinimum, max: leftAxis._axisMaximum, inverted: leftAxis.isInverted)
        rightYAxisRenderer.computeAxis(min: rightAxis._axisMinimum, max: rightAxis._axisMaximum, inverted: rightAxis.isInverted)
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        if let data = data
        {
            xAxisRenderer.computeAxis(
                min: xAxis._axisMinimum,
                max: xAxis._axisMaximum,
                inverted: false)

            legendRenderer.computeLegend(data: data)
=======
        if let data = _data
<<<<<<< HEAD
=======
        if let data = data
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        {
            xAxisRenderer.computeAxis(
                min: xAxis._axisMinimum,
                max: xAxis._axisMaximum,
                inverted: false)

<<<<<<< HEAD
=======
        {
            xAxisRenderer.computeAxis(
                min: _xAxis._axisMinimum,
                max: _xAxis._axisMaximum,
                inverted: false)

>>>>>>> e716a0e (Initial commit - transfer from other project)
            if _legend !== nil
            {
                legendRenderer?.computeLegend(data: data)
            }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            legendRenderer.computeLegend(data: data)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
        
        calculateOffsets()
        
        setNeedsDisplay()
    }
    
    internal override func calcMinMax()
    {
        // calculate / set x-axis range
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        xAxis.calculate(min: data?.xMin ?? 0.0, max: data?.xMax ?? 0.0)
        
        // calculate axis range (min / max) according to provided data
        leftAxis.calculate(min: data?.getYMin(axis: .left) ?? 0.0, max: data?.getYMax(axis: .left) ?? 0.0)
        rightAxis.calculate(min: data?.getYMin(axis: .right) ?? 0.0, max: data?.getYMax(axis: .right) ?? 0.0)
=======
        _xAxis.calculate(min: _data?.xMin ?? 0.0, max: _data?.xMax ?? 0.0)
        
        // calculate axis range (min / max) according to provided data
        leftAxis.calculate(min: _data?.getYMin(axis: .left) ?? 0.0, max: _data?.getYMax(axis: .left) ?? 0.0)
        rightAxis.calculate(min: _data?.getYMin(axis: .right) ?? 0.0, max: _data?.getYMax(axis: .right) ?? 0.0)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        xAxis.calculate(min: data?.xMin ?? 0.0, max: data?.xMax ?? 0.0)
        
        // calculate axis range (min / max) according to provided data
        leftAxis.calculate(min: data?.getYMin(axis: .left) ?? 0.0, max: data?.getYMax(axis: .left) ?? 0.0)
        rightAxis.calculate(min: data?.getYMin(axis: .right) ?? 0.0, max: data?.getYMax(axis: .right) ?? 0.0)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
    
    internal func calculateLegendOffsets(offsetLeft: inout CGFloat, offsetTop: inout CGFloat, offsetRight: inout CGFloat, offsetBottom: inout CGFloat)
    {
        // setup offsets for legend
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        if legend.isEnabled, !legend.drawInside
        {
            switch legend.orientation
            {
            case .vertical:
                
                switch legend.horizontalAlignment
                {
                case .left:
                    offsetLeft += min(legend.neededWidth, viewPortHandler.chartWidth * legend.maxSizePercent) + legend.xOffset
                    
                case .right:
                    offsetRight += min(legend.neededWidth, viewPortHandler.chartWidth * legend.maxSizePercent) + legend.xOffset
                    
                case .center:
                    
                    switch legend.verticalAlignment
                    {
                    case .top:
                        offsetTop += min(legend.neededHeight, viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
                        
                    case .bottom:
                        offsetBottom += min(legend.neededHeight, viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
=======
        if _legend !== nil && _legend.isEnabled && !_legend.drawInside
<<<<<<< HEAD
=======
        if legend.isEnabled, !legend.drawInside
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        {
            switch legend.orientation
            {
            case .vertical:
                
                switch legend.horizontalAlignment
                {
                case .left:
                    offsetLeft += min(legend.neededWidth, viewPortHandler.chartWidth * legend.maxSizePercent) + legend.xOffset
                    
                case .right:
                    offsetRight += min(legend.neededWidth, viewPortHandler.chartWidth * legend.maxSizePercent) + legend.xOffset
                    
                case .center:
                    
                    switch legend.verticalAlignment
                    {
                    case .top:
                        offsetTop += min(legend.neededHeight, viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
                        
                    case .bottom:
<<<<<<< HEAD
                        offsetBottom += min(_legend.neededHeight, _viewPortHandler.chartHeight * _legend.maxSizePercent) + _legend.yOffset
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
                        offsetBottom += min(legend.neededHeight, viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
        {
            switch _legend.orientation
            {
            case .vertical:
                
                switch _legend.horizontalAlignment
                {
                case .left:
                    offsetLeft += min(_legend.neededWidth, _viewPortHandler.chartWidth * _legend.maxSizePercent) + _legend.xOffset
                    
                case .right:
                    offsetRight += min(_legend.neededWidth, _viewPortHandler.chartWidth * _legend.maxSizePercent) + _legend.xOffset
                    
                case .center:
                    
                    switch _legend.verticalAlignment
                    {
                    case .top:
                        offsetTop += min(_legend.neededHeight, _viewPortHandler.chartHeight * _legend.maxSizePercent) + _legend.yOffset
                        
                    case .bottom:
                        offsetBottom += min(_legend.neededHeight, _viewPortHandler.chartHeight * _legend.maxSizePercent) + _legend.yOffset
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
                        
                    default:
                        break
                    }
                }
                
            case .horizontal:
                
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                switch legend.verticalAlignment
                {
                case .top:
                    offsetTop += min(legend.neededHeight, viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
                    
                case .bottom:
                    offsetBottom += min(legend.neededHeight, viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
=======
                switch _legend.verticalAlignment
<<<<<<< HEAD
=======
                switch legend.verticalAlignment
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
                {
                case .top:
                    offsetTop += min(legend.neededHeight, viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
                    
                case .bottom:
<<<<<<< HEAD
                    offsetBottom += min(_legend.neededHeight, _viewPortHandler.chartHeight * _legend.maxSizePercent) + _legend.yOffset
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
                    offsetBottom += min(legend.neededHeight, viewPortHandler.chartHeight * legend.maxSizePercent) + legend.yOffset
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
                {
                case .top:
                    offsetTop += min(_legend.neededHeight, _viewPortHandler.chartHeight * _legend.maxSizePercent) + _legend.yOffset
                    
                case .bottom:
                    offsetBottom += min(_legend.neededHeight, _viewPortHandler.chartHeight * _legend.maxSizePercent) + _legend.yOffset
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
                    
                default:
                    break
                }
            }
        }
    }
    
    internal override func calculateOffsets()
    {
        if !_customViewPortEnabled
        {
            var offsetLeft = CGFloat(0.0)
            var offsetRight = CGFloat(0.0)
            var offsetTop = CGFloat(0.0)
            var offsetBottom = CGFloat(0.0)
            
            calculateLegendOffsets(offsetLeft: &offsetLeft,
                                   offsetTop: &offsetTop,
                                   offsetRight: &offsetRight,
                                   offsetBottom: &offsetBottom)
            
            // offsets for y-labels
            if leftAxis.needsOffset
            {
                offsetLeft += leftAxis.requiredSize().width
            }
            
            if rightAxis.needsOffset
            {
                offsetRight += rightAxis.requiredSize().width
            }

            if xAxis.isEnabled && xAxis.isDrawLabelsEnabled
            {
                let xlabelheight = xAxis.labelRotatedHeight + xAxis.yOffset
                
                // offsets for x-labels
                if xAxis.labelPosition == .bottom
                {
                    offsetBottom += xlabelheight
                }
                else if xAxis.labelPosition == .top
                {
                    offsetTop += xlabelheight
                }
                else if xAxis.labelPosition == .bothSided
                {
                    offsetBottom += xlabelheight
                    offsetTop += xlabelheight
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
        }
        
        prepareOffsetMatrix()
        prepareValuePxMatrix()
    }
    
    /// draws the grid background
    internal func drawGridBackground(context: CGContext)
    {
        if drawGridBackgroundEnabled || drawBordersEnabled
        {
            context.saveGState()
        }
        
        if drawGridBackgroundEnabled
        {
            // draw the grid background
            context.setFillColor(gridBackgroundColor.cgColor)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            context.fill(viewPortHandler.contentRect)
=======
            context.fill(_viewPortHandler.contentRect)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            context.fill(viewPortHandler.contentRect)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
        
        if drawBordersEnabled
        {
            context.setLineWidth(borderLineWidth)
            context.setStrokeColor(borderColor.cgColor)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            context.stroke(viewPortHandler.contentRect)
=======
            context.stroke(_viewPortHandler.contentRect)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            context.stroke(viewPortHandler.contentRect)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
        
        if drawGridBackgroundEnabled || drawBordersEnabled
        {
            context.restoreGState()
        }
    }
    
    // MARK: - Gestures
    
    private enum GestureScaleAxis
    {
        case both
        case x
        case y
    }
    
    private var _isDragging = false
    private var _isScaling = false
    private var _gestureScaleAxis = GestureScaleAxis.both
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    private var _closestDataSetToTouch: ChartDataSetProtocol!
=======
    private var _closestDataSetToTouch: IChartDataSet!
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    private var _closestDataSetToTouch: ChartDataSetProtocol!
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    private var _panGestureReachedEdge: Bool = false
    private weak var _outerScrollView: NSUIScrollView?
    
    private var _lastPanPoint = CGPoint() /// This is to prevent using setTranslation which resets velocity
    
    private var _decelerationLastTime: TimeInterval = 0.0
    private var _decelerationDisplayLink: NSUIDisplayLink!
    private var _decelerationVelocity = CGPoint()
    
    @objc private func tapGestureRecognized(_ recognizer: NSUITapGestureRecognizer)
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
            return
        }
        
        if recognizer.state == NSUIGestureRecognizerState.ended
        {
            if !isHighLightPerTapEnabled { return }
            
            let h = getHighlightByTouchPoint(recognizer.location(in: self))
            
            if h === nil || h == self.lastHighlighted
            {
                lastHighlighted = nil
                highlightValue(nil, callDelegate: true)
            }
            else
            {
                lastHighlighted = h
                highlightValue(h, callDelegate: true)
            }
        }
    }
    
    @objc private func doubleTapGestureRecognized(_ recognizer: NSUITapGestureRecognizer)
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
            return
        }
        
        if recognizer.state == NSUIGestureRecognizerState.ended
        {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            if data !== nil && _doubleTapToZoomEnabled && (data?.entryCount ?? 0) > 0
            {
                var location = recognizer.location(in: self)
                location.x = location.x - viewPortHandler.offsetLeft
                
                if isTouchInverted()
                {
                    location.y = -(location.y - viewPortHandler.offsetTop)
                }
                else
                {
                    location.y = -(self.bounds.size.height - location.y - viewPortHandler.offsetBottom)
                }
                
                self.zoom(scaleX: isScaleXEnabled ? 1.4 : 1.0, scaleY: isScaleYEnabled ? 1.4 : 1.0, x: location.x, y: location.y)
=======
            if _data !== nil && _doubleTapToZoomEnabled && (data?.entryCount ?? 0) > 0
<<<<<<< HEAD
=======
            if data !== nil && _doubleTapToZoomEnabled && (data?.entryCount ?? 0) > 0
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
            {
                var location = recognizer.location(in: self)
                location.x = location.x - viewPortHandler.offsetLeft
                
                if isTouchInverted()
                {
                    location.y = -(location.y - viewPortHandler.offsetTop)
                }
                else
                {
                    location.y = -(self.bounds.size.height - location.y - viewPortHandler.offsetBottom)
                }
<<<<<<< HEAD
=======
            {
                var location = recognizer.location(in: self)
                location.x = location.x - _viewPortHandler.offsetLeft
                
                if isTouchInverted()
                {
                    location.y = -(location.y - _viewPortHandler.offsetTop)
                }
                else
                {
                    location.y = -(self.bounds.size.height - location.y - _viewPortHandler.offsetBottom)
                }
>>>>>>> e716a0e (Initial commit - transfer from other project)

                let scaleX: CGFloat = isScaleXEnabled ? 1.4 : 1.0
                let scaleY: CGFloat = isScaleYEnabled ? 1.4 : 1.0

                self.zoom(scaleX: scaleX, scaleY: scaleY, x: location.x, y: location.y)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
                
                self.zoom(scaleX: isScaleXEnabled ? 1.4 : 1.0, scaleY: isScaleYEnabled ? 1.4 : 1.0, x: location.x, y: location.y)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                delegate?.chartScaled?(self, scaleX: scaleX, scaleY: scaleY)
            }
        }
    }
    
    #if !os(tvOS)
    @objc private func pinchGestureRecognized(_ recognizer: NSUIPinchGestureRecognizer)
    {
        if recognizer.state == NSUIGestureRecognizerState.began
        {
            stopDeceleration()
            
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            if data !== nil &&
=======
            if _data !== nil &&
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            if data !== nil &&
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                (_pinchZoomEnabled || _scaleXEnabled || _scaleYEnabled)
            {
                _isScaling = true
                
                if _pinchZoomEnabled
                {
                    _gestureScaleAxis = .both
                }
                else
                {
                    let x = abs(recognizer.location(in: self).x - recognizer.nsuiLocationOfTouch(1, inView: self).x)
                    let y = abs(recognizer.location(in: self).y - recognizer.nsuiLocationOfTouch(1, inView: self).y)
                    
                    if _scaleXEnabled != _scaleYEnabled
                    {
                        _gestureScaleAxis = _scaleXEnabled ? .x : .y
                    }
                    else
                    {
                        _gestureScaleAxis = x > y ? .x : .y
                    }
                }
            }
        }
        else if recognizer.state == NSUIGestureRecognizerState.ended ||
            recognizer.state == NSUIGestureRecognizerState.cancelled
        {
            if _isScaling
            {
                _isScaling = false
                
                // Range might have changed, which means that Y-axis labels could have changed in size, affecting Y-axis size. So we need to recalculate offsets.
                calculateOffsets()
                setNeedsDisplay()
            }
        }
        else if recognizer.state == NSUIGestureRecognizerState.changed
        {
            let isZoomingOut = (recognizer.nsuiScale < 1)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            var canZoomMoreX = isZoomingOut ? viewPortHandler.canZoomOutMoreX : viewPortHandler.canZoomInMoreX
            var canZoomMoreY = isZoomingOut ? viewPortHandler.canZoomOutMoreY : viewPortHandler.canZoomInMoreY
=======
            var canZoomMoreX = isZoomingOut ? _viewPortHandler.canZoomOutMoreX : _viewPortHandler.canZoomInMoreX
            var canZoomMoreY = isZoomingOut ? _viewPortHandler.canZoomOutMoreY : _viewPortHandler.canZoomInMoreY
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            var canZoomMoreX = isZoomingOut ? viewPortHandler.canZoomOutMoreX : viewPortHandler.canZoomInMoreX
            var canZoomMoreY = isZoomingOut ? viewPortHandler.canZoomOutMoreY : viewPortHandler.canZoomInMoreY
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            
            if _isScaling
            {
                canZoomMoreX = canZoomMoreX && _scaleXEnabled && (_gestureScaleAxis == .both || _gestureScaleAxis == .x)
                canZoomMoreY = canZoomMoreY && _scaleYEnabled && (_gestureScaleAxis == .both || _gestureScaleAxis == .y)
                if canZoomMoreX || canZoomMoreY
                {
                    var location = recognizer.location(in: self)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                    location.x = location.x - viewPortHandler.offsetLeft
                    
                    if isTouchInverted()
                    {
                        location.y = -(location.y - viewPortHandler.offsetTop)
                    }
                    else
                    {
                        location.y = -(viewPortHandler.chartHeight - location.y - viewPortHandler.offsetBottom)
=======
                    location.x = location.x - _viewPortHandler.offsetLeft
<<<<<<< HEAD
=======
                    location.x = location.x - viewPortHandler.offsetLeft
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
                    
                    if isTouchInverted()
                    {
                        location.y = -(location.y - viewPortHandler.offsetTop)
                    }
                    else
                    {
<<<<<<< HEAD
                        location.y = -(_viewPortHandler.chartHeight - location.y - _viewPortHandler.offsetBottom)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
                        location.y = -(viewPortHandler.chartHeight - location.y - viewPortHandler.offsetBottom)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
                    
                    if isTouchInverted()
                    {
                        location.y = -(location.y - _viewPortHandler.offsetTop)
                    }
                    else
                    {
                        location.y = -(_viewPortHandler.chartHeight - location.y - _viewPortHandler.offsetBottom)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
                    }
                    
                    let scaleX = canZoomMoreX ? recognizer.nsuiScale : 1.0
                    let scaleY = canZoomMoreY ? recognizer.nsuiScale : 1.0
                    
                    var matrix = CGAffineTransform(translationX: location.x, y: location.y)
                    matrix = matrix.scaledBy(x: scaleX, y: scaleY)
                    matrix = matrix.translatedBy(x: -location.x, y: -location.y)
                    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                    matrix = viewPortHandler.touchMatrix.concatenating(matrix)
                    
                    viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: true)

=======
                    matrix = _viewPortHandler.touchMatrix.concatenating(matrix)
                    
                    _viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: true)
                    
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
                    matrix = viewPortHandler.touchMatrix.concatenating(matrix)
                    
                    viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: true)

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                    if delegate !== nil
                    {
                        delegate?.chartScaled?(self, scaleX: scaleX, scaleY: scaleY)
                    }
                }
                
                recognizer.nsuiScale = 1.0
            }
        }
    }
    #endif
    
    @objc private func panGestureRecognized(_ recognizer: NSUIPanGestureRecognizer)
    {
        if recognizer.state == NSUIGestureRecognizerState.began && recognizer.nsuiNumberOfTouches() > 0
        {
            stopDeceleration()
            
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            if data === nil || !self.isDragEnabled
=======
            if _data === nil || !self.isDragEnabled
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            if data === nil || !self.isDragEnabled
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            { // If we have no data, we have nothing to pan and no data to highlight
                return
            }
            
            // If drag is enabled and we are in a position where there's something to drag:
            //  * If we're zoomed in, then obviously we have something to drag.
            //  * If we have a drag offset - we always have something to drag
            if !self.hasNoDragOffset || !self.isFullyZoomedOut
            {
                _isDragging = true
                
                _closestDataSetToTouch = getDataSetByTouchPoint(point: recognizer.nsuiLocationOfTouch(0, inView: self))
                
                var translation = recognizer.translation(in: self)
                if !self.dragXEnabled
                {
                    translation.x = 0.0
                }
                else if !self.dragYEnabled
                {
                    translation.y = 0.0
                }
                
                let didUserDrag = translation.x != 0.0 || translation.y != 0.0
                
                // Check to see if user dragged at all and if so, can the chart be dragged by the given amount
                if didUserDrag && !performPanChange(translation: translation)
                {
                    if _outerScrollView !== nil
                    {
                        // We can stop dragging right now, and let the scroll view take control
                        _outerScrollView = nil
                        _isDragging = false
                    }
                }
                else
                {
                    if _outerScrollView !== nil
                    {
                        // Prevent the parent scroll view from scrolling
                        _outerScrollView?.nsuiIsScrollEnabled = false
                    }
                }
                
                _lastPanPoint = recognizer.translation(in: self)
            }
            else if self.isHighlightPerDragEnabled
            {
                // We will only handle highlights on NSUIGestureRecognizerState.Changed
                
                _isDragging = false
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                
                // Prevent the parent scroll view from scrolling
                _outerScrollView?.nsuiIsScrollEnabled = false

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
            }
        }
        else if recognizer.state == NSUIGestureRecognizerState.changed
        {
            if _isDragging
            {
                let originalTranslation = recognizer.translation(in: self)
                var translation = CGPoint(x: originalTranslation.x - _lastPanPoint.x, y: originalTranslation.y - _lastPanPoint.y)
                
                if !self.dragXEnabled
                {
                    translation.x = 0.0
                }
                else if !self.dragYEnabled
                {
                    translation.y = 0.0
                }
                
                let _ = performPanChange(translation: translation)
                
                _lastPanPoint = originalTranslation
            }
            else if isHighlightPerDragEnabled
            {
                let h = getHighlightByTouchPoint(recognizer.location(in: self))
                
                let lastHighlighted = self.lastHighlighted
                
                if h != lastHighlighted
                {
                    self.lastHighlighted = h
                    self.highlightValue(h, callDelegate: true)
                }
            }
        }
        else if recognizer.state == NSUIGestureRecognizerState.ended || recognizer.state == NSUIGestureRecognizerState.cancelled
        {
            if _isDragging
            {
                if recognizer.state == NSUIGestureRecognizerState.ended && isDragDecelerationEnabled
                {
                    stopDeceleration()
                    
                    _decelerationLastTime = CACurrentMediaTime()
                    _decelerationVelocity = recognizer.velocity(in: self)
                    
                    _decelerationDisplayLink = NSUIDisplayLink(target: self, selector: #selector(BarLineChartViewBase.decelerationLoop))
                    _decelerationDisplayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.common)
                }
                
                _isDragging = false
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
                
                delegate?.chartViewDidEndPanning?(self)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            }
            
            if _outerScrollView !== nil
            {
                _outerScrollView?.nsuiIsScrollEnabled = true
                _outerScrollView = nil
            }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

            delegate?.chartViewDidEndPanning?(self)
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======

            delegate?.chartViewDidEndPanning?(self)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
    }
    
    private func performPanChange(translation: CGPoint) -> Bool
    {
        var translation = translation
        
        if isTouchInverted()
        {
            if self is HorizontalBarChartView
            {
                translation.x = -translation.x
            }
            else
            {
                translation.y = -translation.y
            }
        }
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let originalMatrix = viewPortHandler.touchMatrix
=======
        let originalMatrix = _viewPortHandler.touchMatrix
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let originalMatrix = viewPortHandler.touchMatrix
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        
        var matrix = CGAffineTransform(translationX: translation.x, y: translation.y)
        matrix = originalMatrix.concatenating(matrix)
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        matrix = viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: true)
=======
        matrix = _viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: true)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        matrix = viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: true)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        
        if matrix != originalMatrix
        {
            delegate?.chartTranslated?(self, dX: translation.x, dY: translation.y)
        }
        
        // Did we managed to actually drag or did we reach the edge?
        return matrix.tx != originalMatrix.tx || matrix.ty != originalMatrix.ty
    }
    
    private func isTouchInverted() -> Bool
    {
        return isAnyAxisInverted &&
            _closestDataSetToTouch !== nil &&
            getAxis(_closestDataSetToTouch.axisDependency).isInverted
    }
    
    @objc open func stopDeceleration()
    {
        if _decelerationDisplayLink !== nil
        {
            _decelerationDisplayLink.remove(from: RunLoop.main, forMode: RunLoop.Mode.common)
            _decelerationDisplayLink = nil
        }
    }
    
    @objc private func decelerationLoop()
    {
        let currentTime = CACurrentMediaTime()
        
        _decelerationVelocity.x *= self.dragDecelerationFrictionCoef
        _decelerationVelocity.y *= self.dragDecelerationFrictionCoef
        
        let timeInterval = CGFloat(currentTime - _decelerationLastTime)
        
        let distance = CGPoint(
            x: _decelerationVelocity.x * timeInterval,
            y: _decelerationVelocity.y * timeInterval
        )
        
        if !performPanChange(translation: distance)
        {
            // We reached the edge, stop
            _decelerationVelocity.x = 0.0
            _decelerationVelocity.y = 0.0
        }
        
        _decelerationLastTime = currentTime
        
        if abs(_decelerationVelocity.x) < 0.001 && abs(_decelerationVelocity.y) < 0.001
        {
            stopDeceleration()
            
            // Range might have changed, which means that Y-axis labels could have changed in size, affecting Y-axis size. So we need to recalculate offsets.
            calculateOffsets()
            setNeedsDisplay()
        }
    }
    
    private func nsuiGestureRecognizerShouldBegin(_ gestureRecognizer: NSUIGestureRecognizer) -> Bool
    {
        if gestureRecognizer == _panGestureRecognizer
        {
            let velocity = _panGestureRecognizer.velocity(in: self)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            if data === nil || !isDragEnabled ||
=======
            if _data === nil || !isDragEnabled ||
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            if data === nil || !isDragEnabled ||
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                (self.hasNoDragOffset && self.isFullyZoomedOut && !self.isHighlightPerDragEnabled) ||
                (!_dragYEnabled && abs(velocity.y) > abs(velocity.x)) ||
                (!_dragXEnabled && abs(velocity.y) < abs(velocity.x))
            {
                return false
            }
        }
        else
        {
            #if !os(tvOS)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                if gestureRecognizer == _pinchGestureRecognizer
                {
                    if data === nil || (!_pinchZoomEnabled && !_scaleXEnabled && !_scaleYEnabled)
                    {
                        return false
                    }
                }
=======
            if gestureRecognizer == _pinchGestureRecognizer
            {
                if _data === nil || (!_pinchZoomEnabled && !_scaleXEnabled && !_scaleYEnabled)
<<<<<<< HEAD
=======
                if gestureRecognizer == _pinchGestureRecognizer
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
                {
                    if data === nil || (!_pinchZoomEnabled && !_scaleXEnabled && !_scaleYEnabled)
                    {
                        return false
                    }
                }
<<<<<<< HEAD
            }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
                {
                    return false
                }
            }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
            #endif
        }
        
        return true
    }
    
    #if !os(OSX)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    open override func gestureRecognizerShouldBegin(_ gestureRecognizer: NSUIGestureRecognizer) -> Bool
=======
    open override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    open override func gestureRecognizerShouldBegin(_ gestureRecognizer: NSUIGestureRecognizer) -> Bool
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    {
        if !super.gestureRecognizerShouldBegin(gestureRecognizer)
        {
            return false
        }
        
        return nsuiGestureRecognizerShouldBegin(gestureRecognizer)
    }
    #endif
    
    #if os(OSX)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    public func gestureRecognizerShouldBegin(gestureRecognizer: NSUIGestureRecognizer) -> Bool
=======
    public func gestureRecognizerShouldBegin(gestureRecognizer: NSGestureRecognizer) -> Bool
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    public func gestureRecognizerShouldBegin(gestureRecognizer: NSUIGestureRecognizer) -> Bool
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    {
        return nsuiGestureRecognizerShouldBegin(gestureRecognizer)
    }
    #endif
    
    open func gestureRecognizer(_ gestureRecognizer: NSUIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: NSUIGestureRecognizer) -> Bool
    {
        #if !os(tvOS)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            if ((gestureRecognizer is NSUIPinchGestureRecognizer && otherGestureRecognizer is NSUIPanGestureRecognizer) ||
                (gestureRecognizer is NSUIPanGestureRecognizer && otherGestureRecognizer is NSUIPinchGestureRecognizer))
            {
                return true
            }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
        if ((gestureRecognizer is NSUIPinchGestureRecognizer && otherGestureRecognizer is NSUIPanGestureRecognizer) ||
            (gestureRecognizer is NSUIPanGestureRecognizer && otherGestureRecognizer is NSUIPinchGestureRecognizer))
        {
            return true
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        #endif
        
        if gestureRecognizer is NSUIPanGestureRecognizer,
            otherGestureRecognizer is NSUIPanGestureRecognizer,
            gestureRecognizer == _panGestureRecognizer
        {
            var scrollView = self.superview
            while scrollView != nil && !(scrollView is NSUIScrollView)
            {
                scrollView = scrollView?.superview
            }
            
            // If there is two scrollview together, we pick the superview of the inner scrollview.
            // In the case of UITableViewWrepperView, the superview will be UITableView
            if let superViewOfScrollView = scrollView?.superview,
                superViewOfScrollView is NSUIScrollView
            {
                scrollView = superViewOfScrollView
            }

            var foundScrollView = scrollView as? NSUIScrollView
            
            if !(foundScrollView?.nsuiIsScrollEnabled ?? true)
            {
                foundScrollView = nil
            }
            
            let scrollViewPanGestureRecognizer = foundScrollView?.nsuiGestureRecognizers?.first {
                $0 is NSUIPanGestureRecognizer
            }
            
            if otherGestureRecognizer === scrollViewPanGestureRecognizer
            {
                _outerScrollView = foundScrollView
                
                return true
            }
        }
        
        return false
    }
    
    /// MARK: Viewport modifiers
    
    /// Zooms in by 1.4, into the charts center.
    @objc open func zoomIn()
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let center = viewPortHandler.contentCenter
        
        let matrix = viewPortHandler.zoomIn(x: center.x, y: -center.y)
        viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: false)
=======
        let center = _viewPortHandler.contentCenter
        
        let matrix = _viewPortHandler.zoomIn(x: center.x, y: -center.y)
        _viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: false)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let center = viewPortHandler.contentCenter
        
        let matrix = viewPortHandler.zoomIn(x: center.x, y: -center.y)
        viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: false)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        
        // Range might have changed, which means that Y-axis labels could have changed in size, affecting Y-axis size. So we need to recalculate offsets.
        calculateOffsets()
        setNeedsDisplay()
    }

    /// Zooms out by 0.7, from the charts center.
    @objc open func zoomOut()
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let center = viewPortHandler.contentCenter
        
        let matrix = viewPortHandler.zoomOut(x: center.x, y: -center.y)
        viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: false)
=======
        let center = _viewPortHandler.contentCenter
        
        let matrix = _viewPortHandler.zoomOut(x: center.x, y: -center.y)
        _viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: false)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let center = viewPortHandler.contentCenter
        
        let matrix = viewPortHandler.zoomOut(x: center.x, y: -center.y)
        viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: false)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

        // Range might have changed, which means that Y-axis labels could have changed in size, affecting Y-axis size. So we need to recalculate offsets.
        calculateOffsets()
        setNeedsDisplay()
    }
    
    /// Zooms out to original size.
    @objc open func resetZoom()
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let matrix = viewPortHandler.resetZoom()
        viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: false)

=======
        let matrix = _viewPortHandler.resetZoom()
        _viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: false)
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let matrix = viewPortHandler.resetZoom()
        viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: false)

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        // Range might have changed, which means that Y-axis labels could have changed in size, affecting Y-axis size. So we need to recalculate offsets.
        calculateOffsets()
        setNeedsDisplay()
    }

    /// Zooms in or out by the given scale factor. x and y are the coordinates
    /// (in pixels) of the zoom center.
    ///
    /// - Parameters:
    ///   - scaleX: if < 1 --> zoom out, if > 1 --> zoom in
    ///   - scaleY: if < 1 --> zoom out, if > 1 --> zoom in
    ///   - x:
    ///   - y:
    @objc open func zoom(
        scaleX: CGFloat,
               scaleY: CGFloat,
               x: CGFloat,
               y: CGFloat)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let matrix = viewPortHandler.zoom(scaleX: scaleX, scaleY: scaleY, x: x, y: -y)
        viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: false)

=======
        let matrix = _viewPortHandler.zoom(scaleX: scaleX, scaleY: scaleY, x: x, y: -y)
        _viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: false)
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let matrix = viewPortHandler.zoom(scaleX: scaleX, scaleY: scaleY, x: x, y: -y)
        viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: false)

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        // Range might have changed, which means that Y-axis labels could have changed in size, affecting Y-axis size. So we need to recalculate offsets.
        calculateOffsets()
        setNeedsDisplay()
    }
    
    /// Zooms in or out by the given scale factor.
    /// x and y are the values (**not pixels**) of the zoom center.
    ///
    /// - Parameters:
    ///   - scaleX: if < 1 --> zoom out, if > 1 --> zoom in
    ///   - scaleY: if < 1 --> zoom out, if > 1 --> zoom in
    ///   - xValue:
    ///   - yValue:
    ///   - axis:
    @objc open func zoom(
        scaleX: CGFloat,
               scaleY: CGFloat,
               xValue: Double,
               yValue: Double,
               axis: YAxis.AxisDependency)
    {
        let job = ZoomViewJob(
            viewPortHandler: viewPortHandler,
            scaleX: scaleX,
            scaleY: scaleY,
            xValue: xValue,
            yValue: yValue,
            transformer: getTransformer(forAxis: axis),
            axis: axis,
            view: self)
        addViewportJob(job)
    }
    
    /// Zooms to the center of the chart with the given scale factor.
    ///
    /// - Parameters:
    ///   - scaleX: if < 1 --> zoom out, if > 1 --> zoom in
    ///   - scaleY: if < 1 --> zoom out, if > 1 --> zoom in
    ///   - xValue:
    ///   - yValue:
    ///   - axis:
    @objc open func zoomToCenter(
        scaleX: CGFloat,
               scaleY: CGFloat)
    {
        let center = centerOffsets
        let matrix = viewPortHandler.zoom(
            scaleX: scaleX,
            scaleY: scaleY,
            x: center.x,
            y: -center.y)
        viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: false)
    }
    
    /// Zooms by the specified scale factor to the specified values on the specified axis.
    ///
    /// - Parameters:
    ///   - scaleX:
    ///   - scaleY:
    ///   - xValue:
    ///   - yValue:
    ///   - axis: which axis should be used as a reference for the y-axis
    ///   - duration: the duration of the animation in seconds
    ///   - easing:
    @objc open func zoomAndCenterViewAnimated(
        scaleX: CGFloat,
        scaleY: CGFloat,
        xValue: Double,
        yValue: Double,
        axis: YAxis.AxisDependency,
        duration: TimeInterval,
        easing: ChartEasingFunctionBlock?)
    {
        let origin = valueForTouchPoint(
            point: CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop),
            axis: axis)
        
        let job = AnimatedZoomViewJob(
            viewPortHandler: viewPortHandler,
            transformer: getTransformer(forAxis: axis),
            view: self,
            yAxis: getAxis(axis),
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            xAxisRange: xAxis.axisRange,
=======
            xAxisRange: _xAxis.axisRange,
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            xAxisRange: xAxis.axisRange,
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            scaleX: scaleX,
            scaleY: scaleY,
            xOrigin: viewPortHandler.scaleX,
            yOrigin: viewPortHandler.scaleY,
            zoomCenterX: CGFloat(xValue),
            zoomCenterY: CGFloat(yValue),
            zoomOriginX: origin.x,
            zoomOriginY: origin.y,
            duration: duration,
            easing: easing)
            
        addViewportJob(job)
    }
    
    /// Zooms by the specified scale factor to the specified values on the specified axis.
    ///
    /// - Parameters:
    ///   - scaleX:
    ///   - scaleY:
    ///   - xValue:
    ///   - yValue:
    ///   - axis: which axis should be used as a reference for the y-axis
    ///   - duration: the duration of the animation in seconds
    ///   - easing:
    @objc open func zoomAndCenterViewAnimated(
        scaleX: CGFloat,
        scaleY: CGFloat,
        xValue: Double,
        yValue: Double,
        axis: YAxis.AxisDependency,
        duration: TimeInterval,
        easingOption: ChartEasingOption)
    {
        zoomAndCenterViewAnimated(scaleX: scaleX, scaleY: scaleY, xValue: xValue, yValue: yValue, axis: axis, duration: duration, easing: easingFunctionFromOption(easingOption))
    }
    
    /// Zooms by the specified scale factor to the specified values on the specified axis.
    ///
    /// - Parameters:
    ///   - scaleX:
    ///   - scaleY:
    ///   - xValue:
    ///   - yValue:
    ///   - axis: which axis should be used as a reference for the y-axis
    ///   - duration: the duration of the animation in seconds
    ///   - easing:
    @objc open func zoomAndCenterViewAnimated(
        scaleX: CGFloat,
        scaleY: CGFloat,
        xValue: Double,
        yValue: Double,
        axis: YAxis.AxisDependency,
        duration: TimeInterval)
    {
        zoomAndCenterViewAnimated(scaleX: scaleX, scaleY: scaleY, xValue: xValue, yValue: yValue, axis: axis, duration: duration, easingOption: .easeInOutSine)
    }
    
    /// Resets all zooming and dragging and makes the chart fit exactly it's bounds.
    @objc open func fitScreen()
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let matrix = viewPortHandler.fitScreen()
        viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: false)
=======
        let matrix = _viewPortHandler.fitScreen()
        _viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: false)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let matrix = viewPortHandler.fitScreen()
        viewPortHandler.refresh(newMatrix: matrix, chart: self, invalidate: false)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        
        calculateOffsets()
        setNeedsDisplay()
    }
    
    /// Sets the minimum scale value to which can be zoomed out. 1 = fitScreen
    @objc open func setScaleMinima(_ scaleX: CGFloat, scaleY: CGFloat)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        viewPortHandler.setMinimumScaleX(scaleX)
        viewPortHandler.setMinimumScaleY(scaleY)
=======
        _viewPortHandler.setMinimumScaleX(scaleX)
        _viewPortHandler.setMinimumScaleY(scaleY)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        viewPortHandler.setMinimumScaleX(scaleX)
        viewPortHandler.setMinimumScaleY(scaleY)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
    
    @objc open var visibleXRange: Double
    {
        return abs(highestVisibleX - lowestVisibleX)
    }
    
    /// Sets the size of the area (range on the x-axis) that should be maximum visible at once (no further zooming out allowed).
    ///
    /// If this is e.g. set to 10, no more than a range of 10 values on the x-axis can be viewed at once without scrolling.
    ///
    /// If you call this method, chart must have data or it has no effect.
    @objc open func setVisibleXRangeMaximum(_ maxXRange: Double)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let xScale = xAxis.axisRange / maxXRange
        viewPortHandler.setMinimumScaleX(CGFloat(xScale))
=======
        let xScale = _xAxis.axisRange / maxXRange
        _viewPortHandler.setMinimumScaleX(CGFloat(xScale))
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let xScale = xAxis.axisRange / maxXRange
        viewPortHandler.setMinimumScaleX(CGFloat(xScale))
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
    
    /// Sets the size of the area (range on the x-axis) that should be minimum visible at once (no further zooming in allowed).
    ///
    /// If this is e.g. set to 10, no less than a range of 10 values on the x-axis can be viewed at once without scrolling.
    ///
    /// If you call this method, chart must have data or it has no effect.
    @objc open func setVisibleXRangeMinimum(_ minXRange: Double)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let xScale = xAxis.axisRange / minXRange
        viewPortHandler.setMaximumScaleX(CGFloat(xScale))
=======
        let xScale = _xAxis.axisRange / minXRange
        _viewPortHandler.setMaximumScaleX(CGFloat(xScale))
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let xScale = xAxis.axisRange / minXRange
        viewPortHandler.setMaximumScaleX(CGFloat(xScale))
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }

    /// Limits the maximum and minimum value count that can be visible by pinching and zooming.
    ///
    /// e.g. minRange=10, maxRange=100 no less than 10 values and no more that 100 values can be viewed
    /// at once without scrolling.
    ///
    /// If you call this method, chart must have data or it has no effect.
    @objc open func setVisibleXRange(minXRange: Double, maxXRange: Double)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let minScale = xAxis.axisRange / maxXRange
        let maxScale = xAxis.axisRange / minXRange
        viewPortHandler.setMinMaxScaleX(
=======
        let minScale = _xAxis.axisRange / maxXRange
        let maxScale = _xAxis.axisRange / minXRange
        _viewPortHandler.setMinMaxScaleX(
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let minScale = xAxis.axisRange / maxXRange
        let maxScale = xAxis.axisRange / minXRange
        viewPortHandler.setMinMaxScaleX(
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            minScaleX: CGFloat(minScale),
            maxScaleX: CGFloat(maxScale))
    }
    
    /// Sets the size of the area (range on the y-axis) that should be maximum visible at once.
    ///
    /// - Parameters:
    ///   - yRange:
    ///   - axis: - the axis for which this limit should apply
    @objc open func setVisibleYRangeMaximum(_ maxYRange: Double, axis: YAxis.AxisDependency)
    {
        let yScale = getAxisRange(axis: axis) / maxYRange
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        viewPortHandler.setMinimumScaleY(CGFloat(yScale))
=======
        _viewPortHandler.setMinimumScaleY(CGFloat(yScale))
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        viewPortHandler.setMinimumScaleY(CGFloat(yScale))
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
    
    /// Sets the size of the area (range on the y-axis) that should be minimum visible at once, no further zooming in possible.
    ///
    /// - Parameters:
    ///   - yRange:
    ///   - axis: - the axis for which this limit should apply
    @objc open func setVisibleYRangeMinimum(_ minYRange: Double, axis: YAxis.AxisDependency)
    {
        let yScale = getAxisRange(axis: axis) / minYRange
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        viewPortHandler.setMaximumScaleY(CGFloat(yScale))
=======
        _viewPortHandler.setMaximumScaleY(CGFloat(yScale))
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        viewPortHandler.setMaximumScaleY(CGFloat(yScale))
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }

    /// Limits the maximum and minimum y range that can be visible by pinching and zooming.
    ///
    /// - Parameters:
    ///   - minYRange:
    ///   - maxYRange:
    ///   - axis:
    @objc open func setVisibleYRange(minYRange: Double, maxYRange: Double, axis: YAxis.AxisDependency)
    {
        let minScale = getAxisRange(axis: axis) / minYRange
        let maxScale = getAxisRange(axis: axis) / maxYRange
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        viewPortHandler.setMinMaxScaleY(minScaleY: CGFloat(minScale), maxScaleY: CGFloat(maxScale))
=======
        _viewPortHandler.setMinMaxScaleY(minScaleY: CGFloat(minScale), maxScaleY: CGFloat(maxScale))
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        viewPortHandler.setMinMaxScaleY(minScaleY: CGFloat(minScale), maxScaleY: CGFloat(maxScale))
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
    
    /// Moves the left side of the current viewport to the specified x-value.
    /// This also refreshes the chart by calling setNeedsDisplay().
    @objc open func moveViewToX(_ xValue: Double)
    {
        let job = MoveViewJob(
            viewPortHandler: viewPortHandler,
            xValue: xValue,
            yValue: 0.0,
            transformer: getTransformer(forAxis: .left),
            view: self)
        
        addViewportJob(job)
    }

    /// Centers the viewport to the specified y-value on the y-axis.
    /// This also refreshes the chart by calling setNeedsDisplay().
    /// 
    /// - Parameters:
    ///   - yValue:
    ///   - axis: - which axis should be used as a reference for the y-axis
    @objc open func moveViewToY(_ yValue: Double, axis: YAxis.AxisDependency)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let yInView = getAxisRange(axis: axis) / Double(viewPortHandler.scaleY)
=======
        let yInView = getAxisRange(axis: axis) / Double(_viewPortHandler.scaleY)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let yInView = getAxisRange(axis: axis) / Double(viewPortHandler.scaleY)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        
        let job = MoveViewJob(
            viewPortHandler: viewPortHandler,
            xValue: 0.0,
            yValue: yValue + yInView / 2.0,
            transformer: getTransformer(forAxis: axis),
            view: self)
        
        addViewportJob(job)
    }

    /// This will move the left side of the current viewport to the specified x-value on the x-axis, and center the viewport to the specified y-value on the y-axis.
    /// This also refreshes the chart by calling setNeedsDisplay().
    /// 
    /// - Parameters:
    ///   - xValue:
    ///   - yValue:
    ///   - axis: - which axis should be used as a reference for the y-axis
    @objc open func moveViewTo(xValue: Double, yValue: Double, axis: YAxis.AxisDependency)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let yInView = getAxisRange(axis: axis) / Double(viewPortHandler.scaleY)
=======
        let yInView = getAxisRange(axis: axis) / Double(_viewPortHandler.scaleY)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let yInView = getAxisRange(axis: axis) / Double(viewPortHandler.scaleY)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        
        let job = MoveViewJob(
            viewPortHandler: viewPortHandler,
            xValue: xValue,
            yValue: yValue + yInView / 2.0,
            transformer: getTransformer(forAxis: axis),
            view: self)
        
        addViewportJob(job)
    }
    
    /// This will move the left side of the current viewport to the specified x-position and center the viewport to the specified y-position animated.
    /// This also refreshes the chart by calling setNeedsDisplay().
    ///
    /// - Parameters:
    ///   - xValue:
    ///   - yValue:
    ///   - axis: which axis should be used as a reference for the y-axis
    ///   - duration: the duration of the animation in seconds
    ///   - easing:
    @objc open func moveViewToAnimated(
        xValue: Double,
        yValue: Double,
        axis: YAxis.AxisDependency,
        duration: TimeInterval,
        easing: ChartEasingFunctionBlock?)
    {
        let bounds = valueForTouchPoint(
            point: CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop),
            axis: axis)
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let yInView = getAxisRange(axis: axis) / Double(viewPortHandler.scaleY)
=======
        let yInView = getAxisRange(axis: axis) / Double(_viewPortHandler.scaleY)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let yInView = getAxisRange(axis: axis) / Double(viewPortHandler.scaleY)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        
        let job = AnimatedMoveViewJob(
            viewPortHandler: viewPortHandler,
            xValue: xValue,
            yValue: yValue + yInView / 2.0,
            transformer: getTransformer(forAxis: axis),
            view: self,
            xOrigin: bounds.x,
            yOrigin: bounds.y,
            duration: duration,
            easing: easing)
        
        addViewportJob(job)
    }
    
    /// This will move the left side of the current viewport to the specified x-position and center the viewport to the specified y-position animated.
    /// This also refreshes the chart by calling setNeedsDisplay().
    ///
    /// - Parameters:
    ///   - xValue:
    ///   - yValue:
    ///   - axis: which axis should be used as a reference for the y-axis
    ///   - duration: the duration of the animation in seconds
    ///   - easing:
    @objc open func moveViewToAnimated(
        xValue: Double,
        yValue: Double,
        axis: YAxis.AxisDependency,
        duration: TimeInterval,
        easingOption: ChartEasingOption)
    {
        moveViewToAnimated(xValue: xValue, yValue: yValue, axis: axis, duration: duration, easing: easingFunctionFromOption(easingOption))
    }
    
    /// This will move the left side of the current viewport to the specified x-position and center the viewport to the specified y-position animated.
    /// This also refreshes the chart by calling setNeedsDisplay().
    ///
    /// - Parameters:
    ///   - xValue:
    ///   - yValue:
    ///   - axis: which axis should be used as a reference for the y-axis
    ///   - duration: the duration of the animation in seconds
    ///   - easing:
    @objc open func moveViewToAnimated(
        xValue: Double,
        yValue: Double,
        axis: YAxis.AxisDependency,
        duration: TimeInterval)
    {
        moveViewToAnimated(xValue: xValue, yValue: yValue, axis: axis, duration: duration, easingOption: .easeInOutSine)
    }
    
    /// This will move the center of the current viewport to the specified x-value and y-value.
    /// This also refreshes the chart by calling setNeedsDisplay().
    ///
    /// - Parameters:
    ///   - xValue:
    ///   - yValue:
    ///   - axis: - which axis should be used as a reference for the y-axis
    @objc open func centerViewTo(
        xValue: Double,
        yValue: Double,
        axis: YAxis.AxisDependency)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let yInView = getAxisRange(axis: axis) / Double(viewPortHandler.scaleY)
        let xInView = xAxis.axisRange / Double(viewPortHandler.scaleX)
=======
        let yInView = getAxisRange(axis: axis) / Double(_viewPortHandler.scaleY)
        let xInView = xAxis.axisRange / Double(_viewPortHandler.scaleX)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let yInView = getAxisRange(axis: axis) / Double(viewPortHandler.scaleY)
        let xInView = xAxis.axisRange / Double(viewPortHandler.scaleX)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        
        let job = MoveViewJob(
            viewPortHandler: viewPortHandler,
            xValue: xValue - xInView / 2.0,
            yValue: yValue + yInView / 2.0,
            transformer: getTransformer(forAxis: axis),
            view: self)
        
        addViewportJob(job)
    }
    
    /// This will move the center of the current viewport to the specified x-value and y-value animated.
    ///
    /// - Parameters:
    ///   - xValue:
    ///   - yValue:
    ///   - axis: which axis should be used as a reference for the y-axis
    ///   - duration: the duration of the animation in seconds
    ///   - easing:
    @objc open func centerViewToAnimated(
        xValue: Double,
        yValue: Double,
        axis: YAxis.AxisDependency,
        duration: TimeInterval,
        easing: ChartEasingFunctionBlock?)
    {
        let bounds = valueForTouchPoint(
            point: CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop),
            axis: axis)
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let yInView = getAxisRange(axis: axis) / Double(viewPortHandler.scaleY)
        let xInView = xAxis.axisRange / Double(viewPortHandler.scaleX)
=======
        let yInView = getAxisRange(axis: axis) / Double(_viewPortHandler.scaleY)
        let xInView = xAxis.axisRange / Double(_viewPortHandler.scaleX)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let yInView = getAxisRange(axis: axis) / Double(viewPortHandler.scaleY)
        let xInView = xAxis.axisRange / Double(viewPortHandler.scaleX)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        
        let job = AnimatedMoveViewJob(
            viewPortHandler: viewPortHandler,
            xValue: xValue - xInView / 2.0,
            yValue: yValue + yInView / 2.0,
            transformer: getTransformer(forAxis: axis),
            view: self,
            xOrigin: bounds.x,
            yOrigin: bounds.y,
            duration: duration,
            easing: easing)
        
        addViewportJob(job)
    }
    
    /// This will move the center of the current viewport to the specified x-value and y-value animated.
    ///
    /// - Parameters:
    ///   - xValue:
    ///   - yValue:
    ///   - axis: which axis should be used as a reference for the y-axis
    ///   - duration: the duration of the animation in seconds
    ///   - easing:
    @objc open func centerViewToAnimated(
        xValue: Double,
        yValue: Double,
        axis: YAxis.AxisDependency,
        duration: TimeInterval,
        easingOption: ChartEasingOption)
    {
        centerViewToAnimated(xValue: xValue, yValue: yValue, axis: axis, duration: duration, easing: easingFunctionFromOption(easingOption))
    }
    
    /// This will move the center of the current viewport to the specified x-value and y-value animated.
    ///
    /// - Parameters:
    ///   - xValue:
    ///   - yValue:
    ///   - axis: which axis should be used as a reference for the y-axis
    ///   - duration: the duration of the animation in seconds
    ///   - easing:
    @objc open func centerViewToAnimated(
        xValue: Double,
        yValue: Double,
        axis: YAxis.AxisDependency,
        duration: TimeInterval)
    {
        centerViewToAnimated(xValue: xValue, yValue: yValue, axis: axis, duration: duration, easingOption: .easeInOutSine)
    }

    /// Sets custom offsets for the current `ChartViewPort` (the offsets on the sides of the actual chart window). Setting this will prevent the chart from automatically calculating it's offsets. Use `resetViewPortOffsets()` to undo this.
    /// ONLY USE THIS WHEN YOU KNOW WHAT YOU ARE DOING, else use `setExtraOffsets(...)`.
    @objc open func setViewPortOffsets(left: CGFloat, top: CGFloat, right: CGFloat, bottom: CGFloat)
    {
        _customViewPortEnabled = true
        
        if Thread.isMainThread
        {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            self.viewPortHandler.restrainViewPort(offsetLeft: left, offsetTop: top, offsetRight: right, offsetBottom: bottom)
=======
            self._viewPortHandler.restrainViewPort(offsetLeft: left, offsetTop: top, offsetRight: right, offsetBottom: bottom)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            self.viewPortHandler.restrainViewPort(offsetLeft: left, offsetTop: top, offsetRight: right, offsetBottom: bottom)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            prepareOffsetMatrix()
            prepareValuePxMatrix()
        }
        else
        {
            DispatchQueue.main.async(execute: {
                self.setViewPortOffsets(left: left, top: top, right: right, bottom: bottom)
            })
        }
    }

    /// Resets all custom offsets set via `setViewPortOffsets(...)` method. Allows the chart to again calculate all offsets automatically.
    @objc open func resetViewPortOffsets()
    {
        _customViewPortEnabled = false
        calculateOffsets()
    }

    // MARK: - Accessors
    
    /// - Returns: The range of the specified axis.
    @objc open func getAxisRange(axis: YAxis.AxisDependency) -> Double
    {
        if axis == .left
        {
            return leftAxis.axisRange
        }
        else
        {
            return rightAxis.axisRange
        }
    }

    /// - Returns: The position (in pixels) the provided Entry has inside the chart view
    @objc open func getPosition(entry e: ChartDataEntry, axis: YAxis.AxisDependency) -> CGPoint
    {
        var vals = CGPoint(x: CGFloat(e.x), y: CGFloat(e.y))

        getTransformer(forAxis: axis).pointValueToPixel(&vals)

        return vals
    }

    /// is dragging enabled? (moving the chart with the finger) for the chart (this does not affect scaling).
    @objc open var dragEnabled: Bool
    {
        get
        {
            return _dragXEnabled || _dragYEnabled
        }
        set
        {
            _dragYEnabled = newValue
            _dragXEnabled = newValue
        }
    }
    
    /// is dragging enabled? (moving the chart with the finger) for the chart (this does not affect scaling).
    @objc open var isDragEnabled: Bool
    {
        return dragEnabled
    }
    
    /// is dragging on the X axis enabled?
    @objc open var dragXEnabled: Bool
    {
        get
        {
            return _dragXEnabled
        }
        set
        {
            _dragXEnabled = newValue
        }
    }
    
    /// is dragging on the Y axis enabled?
    @objc open var dragYEnabled: Bool
    {
        get
        {
            return _dragYEnabled
        }
        set
        {
            _dragYEnabled = newValue
        }
    }
    
    /// is scaling enabled? (zooming in and out by gesture) for the chart (this does not affect dragging).
    @objc open func setScaleEnabled(_ enabled: Bool)
    {
        if _scaleXEnabled != enabled || _scaleYEnabled != enabled
        {
            _scaleXEnabled = enabled
            _scaleYEnabled = enabled
            #if !os(tvOS)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                _pinchGestureRecognizer.isEnabled = _pinchZoomEnabled || _scaleXEnabled || _scaleYEnabled
=======
            _pinchGestureRecognizer.isEnabled = _pinchZoomEnabled || _scaleXEnabled || _scaleYEnabled
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
                _pinchGestureRecognizer.isEnabled = _pinchZoomEnabled || _scaleXEnabled || _scaleYEnabled
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            #endif
        }
    }
    
    @objc open var scaleXEnabled: Bool
    {
        get
        {
            return _scaleXEnabled
        }
        set
        {
            if _scaleXEnabled != newValue
            {
                _scaleXEnabled = newValue
                #if !os(tvOS)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                    _pinchGestureRecognizer.isEnabled = _pinchZoomEnabled || _scaleXEnabled || _scaleYEnabled
=======
                _pinchGestureRecognizer.isEnabled = _pinchZoomEnabled || _scaleXEnabled || _scaleYEnabled
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
                    _pinchGestureRecognizer.isEnabled = _pinchZoomEnabled || _scaleXEnabled || _scaleYEnabled
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                #endif
            }
        }
    }
    
    @objc open var scaleYEnabled: Bool
    {
        get
        {
            return _scaleYEnabled
        }
        set
        {
            if _scaleYEnabled != newValue
            {
                _scaleYEnabled = newValue
                #if !os(tvOS)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                    _pinchGestureRecognizer.isEnabled = _pinchZoomEnabled || _scaleXEnabled || _scaleYEnabled
=======
                _pinchGestureRecognizer.isEnabled = _pinchZoomEnabled || _scaleXEnabled || _scaleYEnabled
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
                    _pinchGestureRecognizer.isEnabled = _pinchZoomEnabled || _scaleXEnabled || _scaleYEnabled
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                #endif
            }
        }
    }
    
    @objc open var isScaleXEnabled: Bool { return scaleXEnabled }
    @objc open var isScaleYEnabled: Bool { return scaleYEnabled }
    
    /// flag that indicates if double tap zoom is enabled or not
    @objc open var doubleTapToZoomEnabled: Bool
    {
        get
        {
            return _doubleTapToZoomEnabled
        }
        set
        {
            if _doubleTapToZoomEnabled != newValue
            {
                _doubleTapToZoomEnabled = newValue
                _doubleTapGestureRecognizer.isEnabled = _doubleTapToZoomEnabled
            }
        }
    }
    
    /// **default**: true
    /// `true` if zooming via double-tap is enabled `false` ifnot.
    @objc open var isDoubleTapToZoomEnabled: Bool
    {
        return doubleTapToZoomEnabled
    }
    
    /// flag that indicates if highlighting per dragging over a fully zoomed out chart is enabled
    @objc open var highlightPerDragEnabled = true
    
    /// If set to true, highlighting per dragging over a fully zoomed out chart is enabled
    /// You might want to disable this when using inside a `NSUIScrollView`
    /// 
    /// **default**: true
    @objc open var isHighlightPerDragEnabled: Bool
    {
        return highlightPerDragEnabled
    }
    
    /// **default**: true
    /// `true` if drawing the grid background is enabled, `false` ifnot.
    @objc open var isDrawGridBackgroundEnabled: Bool
    {
        return drawGridBackgroundEnabled
    }
    
    /// **default**: false
    /// `true` if drawing the borders rectangle is enabled, `false` ifnot.
    @objc open var isDrawBordersEnabled: Bool
    {
        return drawBordersEnabled
    }

    /// - Returns: The x and y values in the chart at the given touch point
    /// (encapsulated in a `CGPoint`). This method transforms pixel coordinates to
    /// coordinates / values in the chart. This is the opposite method to
    /// `getPixelsForValues(...)`.
    @objc open func valueForTouchPoint(point pt: CGPoint, axis: YAxis.AxisDependency) -> CGPoint
    {
        return getTransformer(forAxis: axis).valueForTouchPoint(pt)
    }

    /// Transforms the given chart values into pixels. This is the opposite
    /// method to `valueForTouchPoint(...)`.
    @objc open func pixelForValues(x: Double, y: Double, axis: YAxis.AxisDependency) -> CGPoint
    {
        return getTransformer(forAxis: axis).pixelForValues(x: x, y: y)
    }
    
    /// - Returns: The Entry object displayed at the touched position of the chart
    @objc open func getEntryByTouchPoint(point pt: CGPoint) -> ChartDataEntry!
    {
        if let h = getHighlightByTouchPoint(pt)
        {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            return data!.entry(for: h)
=======
            return _data!.entryForHighlight(h)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            return data!.entry(for: h)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
        return nil
    }
    
    /// - Returns: The DataSet object displayed at the touched position of the chart
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    @objc open func getDataSetByTouchPoint(point pt: CGPoint) -> BarLineScatterCandleBubbleChartDataSetProtocol?
    {
        guard let h = getHighlightByTouchPoint(pt) else {
            return nil
        }

        return data?[h.dataSetIndex] as? BarLineScatterCandleBubbleChartDataSetProtocol
=======
    @objc open func getDataSetByTouchPoint(point pt: CGPoint) -> IBarLineScatterCandleBubbleChartDataSet?
<<<<<<< HEAD
=======
    @objc open func getDataSetByTouchPoint(point pt: CGPoint) -> BarLineScatterCandleBubbleChartDataSetProtocol?
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    {
        guard let h = getHighlightByTouchPoint(pt) else {
            return nil
        }
<<<<<<< HEAD
        return nil
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======

        return data?[h.dataSetIndex] as? BarLineScatterCandleBubbleChartDataSetProtocol
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
    {
        let h = getHighlightByTouchPoint(pt)
        if h !== nil
        {
            return _data?.getDataSetByIndex(h!.dataSetIndex) as? IBarLineScatterCandleBubbleChartDataSet
        }
        return nil
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }

    /// The current x-scale factor
    @objc open var scaleX: CGFloat
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        return viewPortHandler.scaleX
=======
        if _viewPortHandler === nil
        {
            return 1.0
        }
        return _viewPortHandler.scaleX
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        return viewPortHandler.scaleX
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }

    /// The current y-scale factor
    @objc open var scaleY: CGFloat
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        return viewPortHandler.scaleY
    }

    /// if the chart is fully zoomed out, return true
    @objc open var isFullyZoomedOut: Bool { return viewPortHandler.isFullyZoomedOut }
=======
        if _viewPortHandler === nil
        {
            return 1.0
        }
        return _viewPortHandler.scaleY
    }

    /// if the chart is fully zoomed out, return true
    @objc open var isFullyZoomedOut: Bool { return _viewPortHandler.isFullyZoomedOut }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        return viewPortHandler.scaleY
    }

    /// if the chart is fully zoomed out, return true
    @objc open var isFullyZoomedOut: Bool { return viewPortHandler.isFullyZoomedOut }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

    /// - Returns: The y-axis object to the corresponding AxisDependency. In the
    /// horizontal bar-chart, LEFT == top, RIGHT == BOTTOM
    @objc open func getAxis(_ axis: YAxis.AxisDependency) -> YAxis
    {
        if axis == .left
        {
            return leftAxis
        }
        else
        {
            return rightAxis
        }
    }
    
    /// flag that indicates if pinch-zoom is enabled. if true, both x and y axis can be scaled simultaneously with 2 fingers, if false, x and y axis can be scaled separately
    @objc open var pinchZoomEnabled: Bool
    {
        get
        {
            return _pinchZoomEnabled
        }
        set
        {
            if _pinchZoomEnabled != newValue
            {
                _pinchZoomEnabled = newValue
                #if !os(tvOS)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                    _pinchGestureRecognizer.isEnabled = _pinchZoomEnabled || _scaleXEnabled || _scaleYEnabled
=======
                _pinchGestureRecognizer.isEnabled = _pinchZoomEnabled || _scaleXEnabled || _scaleYEnabled
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
                    _pinchGestureRecognizer.isEnabled = _pinchZoomEnabled || _scaleXEnabled || _scaleYEnabled
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                #endif
            }
        }
    }

    /// **default**: false
    /// `true` if pinch-zoom is enabled, `false` ifnot
    @objc open var isPinchZoomEnabled: Bool { return pinchZoomEnabled }

    /// Set an offset in dp that allows the user to drag the chart over it's
    /// bounds on the x-axis.
    @objc open func setDragOffsetX(_ offset: CGFloat)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        viewPortHandler.setDragOffsetX(offset)
=======
        _viewPortHandler.setDragOffsetX(offset)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        viewPortHandler.setDragOffsetX(offset)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }

    /// Set an offset in dp that allows the user to drag the chart over it's
    /// bounds on the y-axis.
    @objc open func setDragOffsetY(_ offset: CGFloat)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        viewPortHandler.setDragOffsetY(offset)
    }

    /// `true` if both drag offsets (x and y) are zero or smaller.
    @objc open var hasNoDragOffset: Bool { return viewPortHandler.hasNoDragOffset }
=======
        _viewPortHandler.setDragOffsetY(offset)
    }

    /// `true` if both drag offsets (x and y) are zero or smaller.
    @objc open var hasNoDragOffset: Bool { return _viewPortHandler.hasNoDragOffset }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        viewPortHandler.setDragOffsetY(offset)
    }

    /// `true` if both drag offsets (x and y) are zero or smaller.
    @objc open var hasNoDragOffset: Bool { return viewPortHandler.hasNoDragOffset }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

    open override var chartYMax: Double
    {
        return max(leftAxis._axisMaximum, rightAxis._axisMaximum)
    }

    open override var chartYMin: Double
    {
        return min(leftAxis._axisMinimum, rightAxis._axisMinimum)
    }
    
    /// `true` if either the left or the right or both axes are inverted.
    @objc open var isAnyAxisInverted: Bool
    {
        return leftAxis.isInverted || rightAxis.isInverted
    }
    
    /// flag that indicates if auto scaling on the y axis is enabled.
    /// if yes, the y axis automatically adjusts to the min and max y values of the current x axis range whenever the viewport changes
    @objc open var autoScaleMinMaxEnabled: Bool
    {
        get { return _autoScaleMinMaxEnabled }
        set { _autoScaleMinMaxEnabled = newValue }
    }
    
    /// **default**: false
    /// `true` if auto scaling on the y axis is enabled.
    @objc open var isAutoScaleMinMaxEnabled : Bool { return autoScaleMinMaxEnabled }
    
    /// Sets a minimum width to the specified y axis.
    @objc open func setYAxisMinWidth(_ axis: YAxis.AxisDependency, width: CGFloat)
    {
        if axis == .left
        {
            leftAxis.minWidth = width
        }
        else
        {
            rightAxis.minWidth = width
        }
    }
    
    /// **default**: 0.0
    ///
    /// - Returns: The (custom) minimum width of the specified Y axis.
    @objc open func getYAxisMinWidth(_ axis: YAxis.AxisDependency) -> CGFloat
    {
        if axis == .left
        {
            return leftAxis.minWidth
        }
        else
        {
            return rightAxis.minWidth
        }
    }
    /// Sets a maximum width to the specified y axis.
    /// Zero (0.0) means there's no maximum width
    @objc open func setYAxisMaxWidth(_ axis: YAxis.AxisDependency, width: CGFloat)
    {
        if axis == .left
        {
            leftAxis.maxWidth = width
        }
        else
        {
            rightAxis.maxWidth = width
        }
    }
    
    /// Zero (0.0) means there's no maximum width
    ///
    /// **default**: 0.0 (no maximum specified)
    ///
    /// - Returns: The (custom) maximum width of the specified Y axis.
    @objc open func getYAxisMaxWidth(_ axis: YAxis.AxisDependency) -> CGFloat
    {
        if axis == .left
        {
            return leftAxis.maxWidth
        }
        else
        {
            return rightAxis.maxWidth
        }
    }

    /// - Returns the width of the specified y axis.
    @objc open func getYAxisWidth(_ axis: YAxis.AxisDependency) -> CGFloat
    {
        if axis == .left
        {
            return leftAxis.requiredSize().width
        }
        else
        {
            return rightAxis.requiredSize().width
        }
    }
    
    // MARK: - BarLineScatterCandleBubbleChartDataProvider
    
    /// - Returns: The Transformer class that contains all matrices and is
    /// responsible for transforming values into pixels on the screen and
    /// backwards.
    open func getTransformer(forAxis axis: YAxis.AxisDependency) -> Transformer
    {
        if axis == .left
        {
            return _leftAxisTransformer
        }
        else
        {
            return _rightAxisTransformer
        }
    }
    
    /// the number of maximum visible drawn values on the chart only active when `drawValuesEnabled` is enabled
    open override var maxVisibleCount: Int
    {
        get
        {
            return _maxVisibleCount
        }
        set
        {
            _maxVisibleCount = newValue
        }
    }
    
    open func isInverted(axis: YAxis.AxisDependency) -> Bool
    {
        return getAxis(axis).isInverted
    }
    
    /// The lowest x-index (value on the x-axis) that is still visible on he chart.
    open var lowestVisibleX: Double
    {
        var pt = CGPoint(
            x: viewPortHandler.contentLeft,
            y: viewPortHandler.contentBottom)
        
        getTransformer(forAxis: .left).pixelToValues(&pt)
        
        return max(xAxis._axisMinimum, Double(pt.x))
    }
    
    /// The highest x-index (value on the x-axis) that is still visible on the chart.
    open var highestVisibleX: Double
    {
        var pt = CGPoint(
            x: viewPortHandler.contentRight,
            y: viewPortHandler.contentBottom)
        
        getTransformer(forAxis: .left).pixelToValues(&pt)

        return min(xAxis._axisMaximum, Double(pt.x))
    }
}
