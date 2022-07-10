//
//  CombinedChartRenderer.swift
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

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
open class CombinedChartRenderer: NSObject, DataRenderer
{
    public let viewPortHandler: ViewPortHandler

    public final var accessibleChartElements: [NSUIAccessibilityElement] = []

    public let animator: Animator

=======
open class CombinedChartRenderer: DataRenderer
{
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
open class CombinedChartRenderer: NSObject, DataRenderer
{
    public let viewPortHandler: ViewPortHandler

    public final var accessibleChartElements: [NSUIAccessibilityElement] = []

    public let animator: Animator

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc open weak var chart: CombinedChartView?
    
    /// if set to true, all values are drawn above their bars, instead of below their top
    @objc open var drawValueAboveBarEnabled = true
    
    /// if set to true, a grey area is drawn behind each bar that indicates the maximum value
    @objc open var drawBarShadowEnabled = false
    
    internal var _renderers = [DataRenderer]()
    
    internal var _drawOrder: [CombinedChartView.DrawOrder] = [.bar, .bubble, .line, .candle, .scatter]
    
    @objc public init(chart: CombinedChartView, animator: Animator, viewPortHandler: ViewPortHandler)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        self.chart = chart
        self.viewPortHandler = viewPortHandler
        self.animator = animator

        super.init()
=======
        super.init(animator: animator, viewPortHandler: viewPortHandler)
        
        self.chart = chart
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        self.chart = chart
        self.viewPortHandler = viewPortHandler
        self.animator = animator

        super.init()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        
        createRenderers()
    }
    
    /// Creates the renderers needed for this combined-renderer in the required order. Also takes the DrawOrder into consideration.
    internal func createRenderers()
    {
        _renderers = [DataRenderer]()
        
        guard let chart = chart else { return }

        for order in drawOrder
        {
            switch (order)
            {
            case .bar:
                if chart.barData !== nil
                {
                    _renderers.append(BarChartRenderer(dataProvider: chart, animator: animator, viewPortHandler: viewPortHandler))
                }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

=======
                break
                
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            case .line:
                if chart.lineData !== nil
                {
                    _renderers.append(LineChartRenderer(dataProvider: chart, animator: animator, viewPortHandler: viewPortHandler))
                }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

=======
                break
                
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            case .candle:
                if chart.candleData !== nil
                {
                    _renderers.append(CandleStickChartRenderer(dataProvider: chart, animator: animator, viewPortHandler: viewPortHandler))
                }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

=======
                break
                
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            case .scatter:
                if chart.scatterData !== nil
                {
                    _renderers.append(ScatterChartRenderer(dataProvider: chart, animator: animator, viewPortHandler: viewPortHandler))
                }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

=======
                break
                
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            case .bubble:
                if chart.bubbleData !== nil
                {
                    _renderers.append(BubbleChartRenderer(dataProvider: chart, animator: animator, viewPortHandler: viewPortHandler))
                }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
                break
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
=======
                break
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            }
        }

    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    open func initBuffers()
=======
    open override func initBuffers()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    open func initBuffers()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    open func initBuffers()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        _renderers.forEach { $0.initBuffers() }
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    open func drawData(context: CGContext)
=======
    open override func drawData(context: CGContext)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    open func drawData(context: CGContext)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    open func drawData(context: CGContext)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        // If we redraw the data, remove and repopulate accessible elements to update label values and frames
        accessibleChartElements.removeAll()

        if
            let combinedChart = chart,
            let data = combinedChart.data {
            // Make the chart header the first element in the accessible elements array
            let element = createAccessibleHeader(usingChart: combinedChart,
                                                 andData: data,
                                                 withDefaultDescription: "Combined Chart")
            accessibleChartElements.append(element)
        }

        // TODO: Due to the potential complexity of data presented in Combined charts, a more usable way
        // for VO accessibility would be to use axis based traversal rather than by dataset.
        // Hence, accessibleChartElements is not populated below. (Individual renderers guard against dataSource being their respective views)
        _renderers.forEach { $0.drawData(context: context) }
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    open func drawValues(context: CGContext)
=======
    open override func drawValues(context: CGContext)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    open func drawValues(context: CGContext)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    open func drawValues(context: CGContext)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        _renderers.forEach { $0.drawValues(context: context) }
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    open func drawExtras(context: CGContext)
=======
    open override func drawExtras(context: CGContext)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    open func drawExtras(context: CGContext)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    open func drawExtras(context: CGContext)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        _renderers.forEach { $0.drawExtras(context: context) }
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    open func drawHighlighted(context: CGContext, indices: [Highlight])
=======
    open override func drawHighlighted(context: CGContext, indices: [Highlight])
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    open func drawHighlighted(context: CGContext, indices: [Highlight])
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    open func drawHighlighted(context: CGContext, indices: [Highlight])
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        for renderer in _renderers
        {
            var data: ChartData?
            
            if renderer is BarChartRenderer
            {
                data = (renderer as! BarChartRenderer).dataProvider?.barData
            }
            else if renderer is LineChartRenderer
            {
                data = (renderer as! LineChartRenderer).dataProvider?.lineData
            }
            else if renderer is CandleStickChartRenderer
            {
                data = (renderer as! CandleStickChartRenderer).dataProvider?.candleData
            }
            else if renderer is ScatterChartRenderer
            {
                data = (renderer as! ScatterChartRenderer).dataProvider?.scatterData
            }
            else if renderer is BubbleChartRenderer
            {
                data = (renderer as! BubbleChartRenderer).dataProvider?.bubbleData
            }
            
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            let dataIndex = data == nil ? nil : (chart?.data as? CombinedChartData)?.allData.firstIndex(of: data!)
=======
            let dataIndex: Int? = {
                guard let data = data else { return nil }
                return (chart?.data as? CombinedChartData)?
                    .allData
                    .firstIndex(of: data)
            }()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
            let dataIndex = data == nil ? nil : (chart?.data as? CombinedChartData)?.allData.firstIndex(of: data!)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
            let dataIndex = data == nil ? nil : (chart?.data as? CombinedChartData)?.allData.firstIndex(of: data!)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            
            let dataIndices = indices.filter{ $0.dataIndex == dataIndex || $0.dataIndex == -1 }
            
            renderer.drawHighlighted(context: context, indices: dataIndices)
        }
    }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    open func isDrawingValuesAllowed(dataProvider: ChartDataProvider?) -> Bool
    {
        guard let data = dataProvider?.data else { return false }
        return data.entryCount < Int(CGFloat(dataProvider?.maxVisibleCount ?? 0) * viewPortHandler.scaleX)
=======
    /// - Returns: The sub-renderer object at the specified index.
    @objc open func getSubRenderer(index: Int) -> DataRenderer?
    {
        if index >= _renderers.count || index < 0
        {
            return nil
        }
        else
        {
            return _renderers[index]
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
    open func isDrawingValuesAllowed(dataProvider: ChartDataProvider?) -> Bool
    {
        guard let data = dataProvider?.data else { return false }
        return data.entryCount < Int(CGFloat(dataProvider?.maxVisibleCount ?? 0) * viewPortHandler.scaleX)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }

    /// All sub-renderers.
    @objc open var subRenderers: [DataRenderer]
    {
        get { return _renderers }
        set { _renderers = newValue }
    }
    
    // MARK: Accessors
    
    /// `true` if drawing values above bars is enabled, `false` ifnot
    @objc open var isDrawValueAboveBarEnabled: Bool { return drawValueAboveBarEnabled }
    
    /// `true` if drawing shadows (maxvalue) for each bar is enabled, `false` ifnot
    @objc open var isDrawBarShadowEnabled: Bool { return drawBarShadowEnabled }
    
    /// the order in which the provided data objects should be drawn.
    /// The earlier you place them in the provided array, the further they will be in the background.
    /// e.g. if you provide [DrawOrder.Bar, DrawOrder.Line], the bars will be drawn behind the lines.
    open var drawOrder: [CombinedChartView.DrawOrder]
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        get { _drawOrder }
        set
        {
            if !newValue.isEmpty
=======
        get
        {
            return _drawOrder
        }
        set
        {
            if newValue.count > 0
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        get { _drawOrder }
        set
        {
            if !newValue.isEmpty
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            {
                _drawOrder = newValue
            }
        }
    }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    
    public func createAccessibleHeader(usingChart chart: ChartViewBase, andData data: ChartData, withDefaultDescription defaultDescription: String) -> NSUIAccessibilityElement {
        return AccessibleHeader.create(usingChart: chart, andData: data, withDefaultDescription: defaultDescription)
    }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
}
