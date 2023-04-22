//
//  ChartViewBase.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//
//  Based on https://github.com/PhilJay/MPAndroidChart/commit/c42b880

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
#if !os(OSX)
    import UIKit
#endif

=======
#if canImport(UIKit)
    import UIKit
#endif

#if canImport(Cocoa)
import Cocoa
#endif

>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
#if !os(OSX)
    import UIKit
#endif

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
@objc
public protocol ChartViewDelegate
{
    /// Called when a value has been selected inside the chart.
    ///
    /// - Parameters:
    ///   - entry: The selected Entry.
    ///   - highlight: The corresponding highlight object that contains information about the highlighted position such as dataSetIndex etc.
    @objc optional func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight)
    
    /// Called when a user stops panning between values on the chart
    @objc optional func chartViewDidEndPanning(_ chartView: ChartViewBase)
    
    // Called when nothing has been selected or an "un-select" has been made.
    @objc optional func chartValueNothingSelected(_ chartView: ChartViewBase)
    
    // Callbacks when the chart is scaled / zoomed via pinch zoom gesture.
    @objc optional func chartScaled(_ chartView: ChartViewBase, scaleX: CGFloat, scaleY: CGFloat)
    
    // Callbacks when the chart is moved / translated via drag gesture.
    @objc optional func chartTranslated(_ chartView: ChartViewBase, dX: CGFloat, dY: CGFloat)

    // Callbacks when Animator stops animating
    @objc optional func chartView(_ chartView: ChartViewBase, animatorDidStop animator: Animator)
}

open class ChartViewBase: NSUIView, ChartDataProvider, AnimatorDelegate
{
    // MARK: - Properties
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    /// The default IValueFormatter that has been determined by the chart considering the provided minimum and maximum values.
    internal lazy var defaultValueFormatter: ValueFormatter = DefaultValueFormatter(decimals: 0)

    /// object that holds all data that was originally set for the chart, before it was modified or any filtering algorithms had been applied
    @objc open var data: ChartData?
        {
        didSet
        {
            offsetsCalculated = false

            guard let data = data else { return }

            // calculate how many digits are needed
            setupDefaultFormatter(min: data.yMin, max: data.yMax)

            for set in data where set.valueFormatter is DefaultValueFormatter
            {
                set.valueFormatter = defaultValueFormatter
            }

            // let the chart know there is new data
            notifyDataSetChanged()
        }
    }

    /// If set to true, chart continues to scroll after touch up
    @objc open var dragDecelerationEnabled = true

    /// The object representing the labels on the x-axis
    @objc open internal(set) lazy var xAxis = XAxis()
    
    /// The `Description` object of the chart.
    @objc open lazy var chartDescription = Description()

    /// The legend object containing all data associated with the legend
    @objc open internal(set) lazy var legend = Legend()

=======
    /// - Returns: The object representing all x-labels, this method can be used to
    /// acquire the XAxis object and modify it (e.g. change the position of the
    /// labels)
    @objc open var xAxis: XAxis
    {
        return _xAxis
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    /// The default IValueFormatter that has been determined by the chart considering the provided minimum and maximum values.
    internal lazy var defaultValueFormatter: ValueFormatter = DefaultValueFormatter(decimals: 0)

    /// object that holds all data that was originally set for the chart, before it was modified or any filtering algorithms had been applied
    @objc open var data: ChartData?
        {
        didSet
        {
            offsetsCalculated = false

            guard let data = data else { return }

            // calculate how many digits are needed
            setupDefaultFormatter(min: data.yMin, max: data.yMax)

            for set in data where set.valueFormatter is DefaultValueFormatter
            {
                set.valueFormatter = defaultValueFormatter
            }

            // let the chart know there is new data
            notifyDataSetChanged()
        }
    }

    /// If set to true, chart continues to scroll after touch up
    @objc open var dragDecelerationEnabled = true

    /// The object representing the labels on the x-axis
    @objc open internal(set) lazy var xAxis = XAxis()
    
    /// The `Description` object of the chart.
    @objc open lazy var chartDescription = Description()

    /// The legend object containing all data associated with the legend
<<<<<<< HEAD
    internal var _legend: Legend!
    
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
    @objc open internal(set) lazy var legend = Legend()

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    /// The default IValueFormatter that has been determined by the chart considering the provided minimum and maximum values.
    internal lazy var defaultValueFormatter: ValueFormatter = DefaultValueFormatter(decimals: 0)

    /// object that holds all data that was originally set for the chart, before it was modified or any filtering algorithms had been applied
    @objc open var data: ChartData?
        {
        didSet
        {
            offsetsCalculated = false

            guard let data = data else { return }

            // calculate how many digits are needed
            setupDefaultFormatter(min: data.yMin, max: data.yMax)

            for set in data where set.valueFormatter is DefaultValueFormatter
            {
                set.valueFormatter = defaultValueFormatter
            }

            // let the chart know there is new data
            notifyDataSetChanged()
        }
    }

    /// If set to true, chart continues to scroll after touch up
    @objc open var dragDecelerationEnabled = true

    /// The object representing the labels on the x-axis
    @objc open internal(set) lazy var xAxis = XAxis()
    
    /// The `Description` object of the chart.
    @objc open lazy var chartDescription = Description()

    /// The legend object containing all data associated with the legend
<<<<<<< HEAD
    internal var _legend: Legend!
    
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    @objc open internal(set) lazy var legend = Legend()

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    /// delegate to receive chart events
    @objc open weak var delegate: ChartViewDelegate?
    
    /// text that is displayed when the chart is empty
    @objc open var noDataText = "No chart data available."
    
    /// Font to be used for the no data text.
    @objc open var noDataFont = NSUIFont.systemFont(ofSize: 12)
    
    /// color of the no data text
    @objc open var noDataTextColor: NSUIColor = .labelOrBlack

    /// alignment of the no data text
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
    @objc open var noDataTextAlignment: TextAlignment = .left

    /// The renderer object responsible for rendering / drawing the Legend.
    @objc open lazy var legendRenderer = LegendRenderer(viewPortHandler: viewPortHandler, legend: legend)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

    /// object responsible for rendering the data
    @objc open var renderer: DataRenderer?
    
    @objc open var highlighter: Highlighter?

    /// The ViewPortHandler of the chart that is responsible for the
    /// content area of the chart and its offsets and dimensions.
    @objc open internal(set) lazy var viewPortHandler = ViewPortHandler(width: bounds.size.width, height: bounds.size.height)

    /// The animator responsible for animating chart values.
    @objc open internal(set) lazy var chartAnimator: Animator = {
        let animator = Animator()
        animator.delegate = self
        return animator
    }()

    /// flag that indicates if offsets calculation has already been done or not
    private var offsetsCalculated = false

    /// The array of currently highlighted values. This might an empty if nothing is highlighted.
    @objc open internal(set) var highlighted = [Highlight]()
=======
    @objc open var noDataTextAlignment: NSTextAlignment = .left
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)

    /// object responsible for rendering the data
    @objc open var renderer: DataRenderer?
    
    @objc open var highlighter: Highlighter?

    /// The ViewPortHandler of the chart that is responsible for the
    /// content area of the chart and its offsets and dimensions.
    @objc open internal(set) lazy var viewPortHandler = ViewPortHandler(width: bounds.size.width, height: bounds.size.height)

    /// The animator responsible for animating chart values.
    @objc open internal(set) lazy var chartAnimator: Animator = {
        let animator = Animator()
        animator.delegate = self
        return animator
    }()

    /// flag that indicates if offsets calculation has already been done or not
<<<<<<< HEAD
=======
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

    /// object responsible for rendering the data
    @objc open var renderer: DataRenderer?
    
    @objc open var highlighter: Highlighter?

    /// The ViewPortHandler of the chart that is responsible for the
    /// content area of the chart and its offsets and dimensions.
    @objc open internal(set) lazy var viewPortHandler = ViewPortHandler(width: bounds.size.width, height: bounds.size.height)

    /// The animator responsible for animating chart values.
    @objc open internal(set) lazy var chartAnimator: Animator = {
        let animator = Animator()
        animator.delegate = self
        return animator
    }()

    /// flag that indicates if offsets calculation has already been done or not
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    private var _offsetsCalculated = false
    
    /// array of Highlight objects that reference the highlighted slices in the chart
    internal var _indicesToHighlight = [Highlight]()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
    private var offsetsCalculated = false

    /// The array of currently highlighted values. This might an empty if nothing is highlighted.
    @objc open internal(set) var highlighted = [Highlight]()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    
    /// `true` if drawing the marker is enabled when tapping on values
    /// (use the `marker` property to specify a marker)
    @objc open var drawMarkers = true
    
    /// - Returns: `true` if drawing the marker is enabled when tapping on values
    /// (use the `marker` property to specify a marker)
    @objc open var isDrawMarkersEnabled: Bool { return drawMarkers }
    
    /// The marker that is displayed when a value is clicked on the chart
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc open var marker: Marker?

=======
    @objc open var marker: IMarker?
    
    private var _interceptTouchEvents = false
    
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
    @objc open var marker: Marker?

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    /// An extra offset to be appended to the viewport's top
    @objc open var extraTopOffset: CGFloat = 0.0
    
    /// An extra offset to be appended to the viewport's right
    @objc open var extraRightOffset: CGFloat = 0.0
    
    /// An extra offset to be appended to the viewport's bottom
    @objc open var extraBottomOffset: CGFloat = 0.0
    
    /// An extra offset to be appended to the viewport's left
    @objc open var extraLeftOffset: CGFloat = 0.0
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

=======
    
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
    @objc open func setExtraOffsets(left: CGFloat, top: CGFloat, right: CGFloat, bottom: CGFloat)
    {
        extraLeftOffset = left
        extraTopOffset = top
        extraRightOffset = right
        extraBottomOffset = bottom
    }
    
    // MARK: - Initializers
    
    public override init(frame: CGRect)
    {
        super.init(frame: frame)
        initialize()
    }
    
    public required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        initialize()
    }
    
    deinit
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        removeObserver(self, forKeyPath: "bounds")
        removeObserver(self, forKeyPath: "frame")
=======
        self.removeObserver(self, forKeyPath: "bounds")
        self.removeObserver(self, forKeyPath: "frame")
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        removeObserver(self, forKeyPath: "bounds")
        removeObserver(self, forKeyPath: "frame")
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    internal func initialize()
    {
        #if os(iOS)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            self.backgroundColor = .clear
        #endif

        addObserver(self, forKeyPath: "bounds", options: .new, context: nil)
        addObserver(self, forKeyPath: "frame", options: .new, context: nil)
=======
        self.backgroundColor = NSUIColor.clear
        #endif

        _animator = Animator()
        _animator.delegate = self

        _viewPortHandler = ViewPortHandler(width: bounds.size.width, height: bounds.size.height)
        
        chartDescription = Description()
        
        _legend = Legend()
        _legendRenderer = LegendRenderer(viewPortHandler: _viewPortHandler, legend: _legend)
        
        _xAxis = XAxis()
        
        self.addObserver(self, forKeyPath: "bounds", options: .new, context: nil)
        self.addObserver(self, forKeyPath: "frame", options: .new, context: nil)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
            self.backgroundColor = .clear
        #endif

        addObserver(self, forKeyPath: "bounds", options: .new, context: nil)
        addObserver(self, forKeyPath: "frame", options: .new, context: nil)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    // MARK: - ChartViewBase
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    /// Clears the chart from all data (sets it to null) and refreshes it (by calling setNeedsDisplay()).
    @objc open func clear()
    {
        data = nil
        offsetsCalculated = false
        highlighted.removeAll()
=======
    /// The data for the chart
    open var data: ChartData?
    {
        get
        {
            return _data
        }
        set
        {
            _data = newValue
            _offsetsCalculated = false
            
            guard let _data = _data else
            {
                setNeedsDisplay()
                return
            }
            
            // calculate how many digits are needed
            setupDefaultFormatter(min: _data.getYMin(), max: _data.getYMax())
            
            for set in _data.dataSets
            {
                if set.needsFormatter || set.valueFormatter === _defaultValueFormatter
                {
                    set.valueFormatter = _defaultValueFormatter
                }
            }
            
            // let the chart know there is new data
            notifyDataSetChanged()
        }
    }
    
    /// Clears the chart from all data (sets it to null) and refreshes it (by calling setNeedsDisplay()).
    @objc open func clear()
    {
        _data = nil
        _offsetsCalculated = false
        _indicesToHighlight.removeAll()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
    /// Clears the chart from all data (sets it to null) and refreshes it (by calling setNeedsDisplay()).
    @objc open func clear()
    {
        data = nil
        offsetsCalculated = false
        highlighted.removeAll()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        lastHighlighted = nil
    
        setNeedsDisplay()
    }
    
    /// Removes all DataSets (and thereby Entries) from the chart. Does not set the data object to nil. Also refreshes the chart by calling setNeedsDisplay().
    @objc open func clearValues()
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        data?.clearValues()
=======
        _data?.clearValues()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        data?.clearValues()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        data?.clearValues()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        setNeedsDisplay()
    }

    /// - Returns: `true` if the chart is empty (meaning it's data object is either null or contains no entries).
    @objc open func isEmpty() -> Bool
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        return data?.isEmpty ?? true
=======
        guard let data = _data else { return true }

        if data.entryCount <= 0
        {
            return true
        }
        else
        {
            return false
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        return data?.isEmpty ?? true
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        return data?.isEmpty ?? true
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// Lets the chart know its underlying data has changed and should perform all necessary recalculations.
    /// It is crucial that this method is called everytime data is changed dynamically. Not calling this method can lead to crashes or unexpected behaviour.
    @objc open func notifyDataSetChanged()
    {
        fatalError("notifyDataSetChanged() cannot be called on ChartViewBase")
    }
    
    /// Calculates the offsets of the chart to the border depending on the position of an eventual legend or depending on the length of the y-axis and x-axis labels and their position
    internal func calculateOffsets()
    {
        fatalError("calculateOffsets() cannot be called on ChartViewBase")
    }
    
    /// calcualtes the y-min and y-max value and the y-delta and x-delta value
    internal func calcMinMax()
    {
        fatalError("calcMinMax() cannot be called on ChartViewBase")
    }
    
    /// calculates the required number of digits for the values that might be drawn in the chart (if enabled), and creates the default value formatter
    internal func setupDefaultFormatter(min: Double, max: Double)
    {
        // check if a custom formatter is set or not
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        var reference = 0.0
        
        if let data = data , data.entryCount >= 2
        {
            reference = abs(max - min)
        }
        else
        {
            reference = Swift.max(abs(min), abs(max))
        }
        
    
        if let formatter = defaultValueFormatter as? DefaultValueFormatter
        {
            // setup the formatter with a new number of digits
            let digits = reference.decimalPlaces
            formatter.decimals = digits
=======
        var reference = Double(0.0)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        var reference = 0.0
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        
        if let data = data , data.entryCount >= 2
        {
            reference = abs(max - min)
        }
        else
        {
            reference = Swift.max(abs(min), abs(max))
        }
        
    
        if let formatter = defaultValueFormatter as? DefaultValueFormatter
        {
            // setup the formatter with a new number of digits
            let digits = reference.decimalPlaces
<<<<<<< HEAD
=======
=======
=======
        var reference = 0.0
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        
        if let data = data , data.entryCount >= 2
        {
            reference = abs(max - min)
        }
        else
        {
            reference = Swift.max(abs(min), abs(max))
        }
        
    
        if let formatter = defaultValueFormatter as? DefaultValueFormatter
        {
            // setup the formatter with a new number of digits
            let digits = reference.decimalPlaces
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            
            (_defaultValueFormatter as? DefaultValueFormatter)?.decimals
             = digits
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
            formatter.decimals = digits
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
            formatter.decimals = digits
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        }
    }
    
    open override func draw(_ rect: CGRect)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        guard let context = NSUIGraphicsGetCurrentContext() else { return }

        if data === nil && !noDataText.isEmpty
=======
        let optionalContext = NSUIGraphicsGetCurrentContext()
        guard let context = optionalContext else { return }
        
        let frame = self.bounds

        if _data === nil && noDataText.count > 0
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        guard let context = NSUIGraphicsGetCurrentContext() else { return }

        if data === nil && !noDataText.isEmpty
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        {
            context.saveGState()
            defer { context.restoreGState() }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            let paragraphStyle = MutableParagraphStyle.default.mutableCopy() as! MutableParagraphStyle
=======
            let paragraphStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
            let paragraphStyle = MutableParagraphStyle.default.mutableCopy() as! MutableParagraphStyle
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
            let paragraphStyle = MutableParagraphStyle.default.mutableCopy() as! MutableParagraphStyle
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            paragraphStyle.minimumLineHeight = noDataFont.lineHeight
            paragraphStyle.lineBreakMode = .byWordWrapping
            paragraphStyle.alignment = noDataTextAlignment

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
            context.drawMultilineText(noDataText,
                                      at: CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0),
                                      constrainedTo: bounds.size,
                                      anchor: CGPoint(x: 0.5, y: 0.5),
                                      angleRadians: 0.0,
                                      attributes: [.font: noDataFont,
                                                   .foregroundColor: noDataTextColor,
                                                   .paragraphStyle: paragraphStyle])

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            return
        }
        
        if !offsetsCalculated
        {
            calculateOffsets()
            offsetsCalculated = true
=======
            ChartUtils.drawMultilineText(
                context: context,
                text: noDataText,
                point: CGPoint(x: frame.width / 2.0, y: frame.height / 2.0),
                attributes:
                [.font: noDataFont,
                 .foregroundColor: noDataTextColor,
                 .paragraphStyle: paragraphStyle],
                constrainedToSize: self.bounds.size,
                anchor: CGPoint(x: 0.5, y: 0.5),
                angleRadians: 0.0)
            
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
            return
        }
        
        if !offsetsCalculated
        {
            calculateOffsets()
<<<<<<< HEAD
            _offsetsCalculated = true
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
            offsetsCalculated = true
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            return
        }
        
        if !offsetsCalculated
        {
            calculateOffsets()
<<<<<<< HEAD
            _offsetsCalculated = true
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
            offsetsCalculated = true
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        }
    }
    
    /// Draws the description text in the bottom right corner of the chart (per default)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    internal func drawDescription(in context: CGContext)
    {
        let description = chartDescription

        // check if description should be drawn
        guard
            description.isEnabled,
            let descriptionText = description.text,
            !descriptionText.isEmpty
            else { return }
        
        let position = description.position ?? CGPoint(x: bounds.width - viewPortHandler.offsetRight - description.xOffset,
                                                       y: bounds.height - viewPortHandler.offsetBottom - description.yOffset - description.font.lineHeight)

        let attrs: [NSAttributedString.Key : Any] = [
            .font: description.font,
            .foregroundColor: description.textColor
        ]

        context.drawText(descriptionText,
                         at: position,
                         align: description.textAlign,
                         attributes: attrs)
=======
    internal func drawDescription(context: CGContext)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    internal func drawDescription(in context: CGContext)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    {
        let description = chartDescription

        // check if description should be drawn
        guard
            description.isEnabled,
            let descriptionText = description.text,
            !descriptionText.isEmpty
            else { return }
        
        let position = description.position ?? CGPoint(x: bounds.width - viewPortHandler.offsetRight - description.xOffset,
                                                       y: bounds.height - viewPortHandler.offsetBottom - description.yOffset - description.font.lineHeight)

<<<<<<< HEAD
=======
=======
=======
    internal func drawDescription(in context: CGContext)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        let description = chartDescription

        // check if description should be drawn
        guard
            description.isEnabled,
            let descriptionText = description.text,
            !descriptionText.isEmpty
            else { return }
        
        let position = description.position ?? CGPoint(x: bounds.width - viewPortHandler.offsetRight - description.xOffset,
                                                       y: bounds.height - viewPortHandler.offsetBottom - description.yOffset - description.font.lineHeight)

<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        ChartUtils.drawText(
            context: context,
            text: descriptionText,
            point: position,
            align: description.textAlign,
            attributes: attrs)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        let attrs: [NSAttributedString.Key : Any] = [
            .font: description.font,
            .foregroundColor: description.textColor
        ]

        context.drawText(descriptionText,
                         at: position,
                         align: description.textAlign,
                         attributes: attrs)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    // MARK: - Accessibility

    open override func accessibilityChildren() -> [Any]? {
        return renderer?.accessibleChartElements
    }

    // MARK: - Highlighting
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

    /// Set this to false to prevent values from being highlighted by tap gesture.
    /// Values can still be highlighted via drag or programmatically.
    /// **default**: true
    @objc open var highlightPerTapEnabled: Bool = true

=======
    
    /// The array of currently highlighted values. This might an empty if nothing is highlighted.
    @objc open var highlighted: [Highlight]
    {
        return _indicesToHighlight
    }
    
    /// Set this to false to prevent values from being highlighted by tap gesture.
    /// Values can still be highlighted via drag or programmatically.
    /// **default**: true
    @objc open var highlightPerTapEnabled: Bool
    {
        get { return _highlightPerTapEnabled }
        set { _highlightPerTapEnabled = newValue }
    }
    
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======

    /// Set this to false to prevent values from being highlighted by tap gesture.
    /// Values can still be highlighted via drag or programmatically.
    /// **default**: true
    @objc open var highlightPerTapEnabled: Bool = true

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    /// `true` if values can be highlighted via tap gesture, `false` ifnot.
    @objc open var isHighLightPerTapEnabled: Bool
    {
        return highlightPerTapEnabled
    }
    
    /// Checks if the highlight array is null, has a length of zero or if the first object is null.
    ///
    /// - Returns: `true` if there are values to highlight, `false` ifthere are no values to highlight.
    @objc open func valuesToHighlight() -> Bool
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        return !highlighted.isEmpty
=======
        return !_indicesToHighlight.isEmpty
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        return !highlighted.isEmpty
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        return !highlighted.isEmpty
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }

    /// Highlights the values at the given indices in the given DataSets. Provide
    /// null or an empty array to undo all highlighting. 
    /// This should be used to programmatically highlight values.
    /// This method *will not* call the delegate.
    @objc open func highlightValues(_ highs: [Highlight]?)
    {
        // set the indices to highlight
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        highlighted = highs ?? []

        lastHighlighted = highlighted.first
=======
        _indicesToHighlight = highs ?? [Highlight]()
        
        if _indicesToHighlight.isEmpty
        {
            self.lastHighlighted = nil
        }
        else
        {
            self.lastHighlighted = _indicesToHighlight[0]
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        highlighted = highs ?? []

        lastHighlighted = highlighted.first
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

        // redraw the chart
        setNeedsDisplay()
    }
    
    /// Highlights any y-value at the given x-value in the given DataSet.
    /// Provide -1 as the dataSetIndex to undo all highlighting.
    /// This method will call the delegate.
    ///
    /// - Parameters:
    ///   - x: The x-value to highlight
    ///   - dataSetIndex: The dataset index to search in
    ///   - dataIndex: The data index to search in (only used in CombinedChartView currently)
    @objc open func highlightValue(x: Double, dataSetIndex: Int, dataIndex: Int = -1)
    {
        highlightValue(x: x, dataSetIndex: dataSetIndex, dataIndex: dataIndex, callDelegate: true)
    }
    
    /// Highlights the value at the given x-value and y-value in the given DataSet.
    /// Provide -1 as the dataSetIndex to undo all highlighting.
    /// This method will call the delegate.
    ///
    /// - Parameters:
    ///   - x: The x-value to highlight
    ///   - y: The y-value to highlight. Supply `NaN` for "any"
    ///   - dataSetIndex: The dataset index to search in
    ///   - dataIndex: The data index to search in (only used in CombinedChartView currently)
    @objc open func highlightValue(x: Double, y: Double, dataSetIndex: Int, dataIndex: Int = -1)
    {
        highlightValue(x: x, y: y, dataSetIndex: dataSetIndex, dataIndex: dataIndex, callDelegate: true)
    }
    
    /// Highlights any y-value at the given x-value in the given DataSet.
    /// Provide -1 as the dataSetIndex to undo all highlighting.
    ///
    /// - Parameters:
    ///   - x: The x-value to highlight
    ///   - dataSetIndex: The dataset index to search in
    ///   - dataIndex: The data index to search in (only used in CombinedChartView currently)
    ///   - callDelegate: Should the delegate be called for this change
    @objc open func highlightValue(x: Double, dataSetIndex: Int, dataIndex: Int = -1, callDelegate: Bool)
    {
        highlightValue(x: x, y: .nan, dataSetIndex: dataSetIndex, dataIndex: dataIndex, callDelegate: callDelegate)
    }
    
    /// Highlights the value at the given x-value and y-value in the given DataSet.
    /// Provide -1 as the dataSetIndex to undo all highlighting.
    ///
    /// - Parameters:
    ///   - x: The x-value to highlight
    ///   - y: The y-value to highlight. Supply `NaN` for "any"
    ///   - dataSetIndex: The dataset index to search in
    ///   - dataIndex: The data index to search in (only used in CombinedChartView currently)
    ///   - callDelegate: Should the delegate be called for this change
    @objc open func highlightValue(x: Double, y: Double, dataSetIndex: Int, dataIndex: Int = -1, callDelegate: Bool)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        guard let data = data else
=======
        guard let data = _data else
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        guard let data = data else
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        guard let data = data else
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        {
            Swift.print("Value not highlighted because data is nil")
            return
        }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

        if data.indices.contains(dataSetIndex)
        {
            highlightValue(Highlight(x: x, y: y, dataSetIndex: dataSetIndex, dataIndex: dataIndex), callDelegate: callDelegate)
        }
        else
        {
            highlightValue(nil, callDelegate: callDelegate)
=======
        
        if dataSetIndex < 0 || dataSetIndex >= data.dataSetCount
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======

        if data.indices.contains(dataSetIndex)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
        {
            highlightValue(Highlight(x: x, y: y, dataSetIndex: dataSetIndex, dataIndex: dataIndex), callDelegate: callDelegate)
        }
        else
        {
<<<<<<< HEAD
            highlightValue(Highlight(x: x, y: y, dataSetIndex: dataSetIndex, dataIndex: dataIndex), callDelegate: callDelegate)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
            highlightValue(nil, callDelegate: callDelegate)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        {
            highlightValue(Highlight(x: x, y: y, dataSetIndex: dataSetIndex, dataIndex: dataIndex), callDelegate: callDelegate)
        }
        else
        {
<<<<<<< HEAD
            highlightValue(Highlight(x: x, y: y, dataSetIndex: dataSetIndex, dataIndex: dataIndex), callDelegate: callDelegate)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
            highlightValue(nil, callDelegate: callDelegate)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        }
    }
    
    /// Highlights the values represented by the provided Highlight object
    /// This method *will not* call the delegate.
    ///
    /// - Parameters:
    ///   - highlight: contains information about which entry should be highlighted
    @objc open func highlightValue(_ highlight: Highlight?)
    {
        highlightValue(highlight, callDelegate: false)
    }

    /// Highlights the value selected by touch gesture.
    @objc open func highlightValue(_ highlight: Highlight?, callDelegate: Bool)
    {
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
        var high = highlight
        guard
            let h = high,
            let entry = data?.entry(for: h)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            else
        {
                high = nil
                highlighted.removeAll(keepingCapacity: false)
                if callDelegate
                {
                    delegate?.chartValueNothingSelected?(self)
                }
                setNeedsDisplay()
                return
        }

        // set the indices to highlight
       highlighted = [h]

        if callDelegate
        {
            // notify the listener
            delegate?.chartValueSelected?(self, entry: entry, highlight: h)
        }

=======
        var entry: ChartDataEntry?
        var h = highlight
        
        if h == nil
        {
            self.lastHighlighted = nil
            _indicesToHighlight.removeAll(keepingCapacity: false)
        }
        else
        {
            // set the indices to highlight
            entry = _data?.entryForHighlight(h!)
            if entry == nil
            {
                h = nil
                _indicesToHighlight.removeAll(keepingCapacity: false)
            }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
            else
        {
                high = nil
                highlighted.removeAll(keepingCapacity: false)
                if callDelegate
                {
                    delegate?.chartValueNothingSelected?(self)
                }
                setNeedsDisplay()
                return
        }
<<<<<<< HEAD
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======

        // set the indices to highlight
       highlighted = [h]

        if callDelegate
        {
            // notify the listener
            delegate?.chartValueSelected?(self, entry: entry, highlight: h)
        }

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            else
        {
                high = nil
                highlighted.removeAll(keepingCapacity: false)
                if callDelegate
                {
                    delegate?.chartValueNothingSelected?(self)
                }
                setNeedsDisplay()
                return
        }
<<<<<<< HEAD
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======

        // set the indices to highlight
       highlighted = [h]

        if callDelegate
        {
            // notify the listener
            delegate?.chartValueSelected?(self, entry: entry, highlight: h)
        }

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        // redraw the chart
        setNeedsDisplay()
    }
    
    /// - Returns: The Highlight object (contains x-index and DataSet index) of the
    /// selected value at the given touch point inside the Line-, Scatter-, or
    /// CandleStick-Chart.
    @objc open func getHighlightByTouchPoint(_ pt: CGPoint) -> Highlight?
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        guard data != nil else
=======
        if _data === nil
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        guard data != nil else
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        guard data != nil else
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        {
            Swift.print("Can't select by touch. No data set.")
            return nil
        }
        
        return self.highlighter?.getHighlight(x: pt.x, y: pt.y)
    }

    /// The last value that was highlighted via touch.
    @objc open var lastHighlighted: Highlight?
  
    // MARK: - Markers

    /// draws all MarkerViews on the highlighted positions
    internal func drawMarkers(context: CGContext)
    {
        // if there is no marker view or drawing marker is disabled
        guard
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            let marker = marker,
            isDrawMarkersEnabled,
            valuesToHighlight()
            else { return }
        
        for highlight in highlighted
        {
            guard
                let set = data?[highlight.dataSetIndex],
                let e = data?.entry(for: highlight)
                else { continue }
            
            let entryIndex = set.entryIndex(entry: e)
            guard entryIndex <= Int(Double(set.entryCount) * chartAnimator.phaseX) else { continue }
=======
            let marker = marker
            , isDrawMarkersEnabled &&
                valuesToHighlight()
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
            let marker = marker,
            isDrawMarkersEnabled,
            valuesToHighlight()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
            else { return }
        
        for highlight in highlighted
        {
            guard
                let set = data?[highlight.dataSetIndex],
                let e = data?.entry(for: highlight)
                else { continue }
            
            let entryIndex = set.entryIndex(entry: e)
<<<<<<< HEAD
=======
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            else { return }
        
        for highlight in highlighted
        {
            guard
                let set = data?[highlight.dataSetIndex],
                let e = data?.entry(for: highlight)
                else { continue }
            
            let entryIndex = set.entryIndex(entry: e)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            if entryIndex > Int(Double(set.entryCount) * _animator.phaseX)
            {
                continue
            }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
            guard entryIndex <= Int(Double(set.entryCount) * chartAnimator.phaseX) else { continue }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
            guard entryIndex <= Int(Double(set.entryCount) * chartAnimator.phaseX) else { continue }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

            let pos = getMarkerPosition(highlight: highlight)

            // check bounds
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            guard viewPortHandler.isInBounds(x: pos.x, y: pos.y) else { continue }
=======
            if !_viewPortHandler.isInBounds(x: pos.x, y: pos.y)
            {
                continue
            }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
            guard viewPortHandler.isInBounds(x: pos.x, y: pos.y) else { continue }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
            guard viewPortHandler.isInBounds(x: pos.x, y: pos.y) else { continue }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

            // callbacks to update the content
            marker.refreshContent(entry: e, highlight: highlight)
            
            // draw the marker
            marker.draw(context: context, point: pos)
        }
    }
    
    /// - Returns: The actual position in pixels of the MarkerView for the given Entry in the given DataSet.
    @objc open func getMarkerPosition(highlight: Highlight) -> CGPoint
    {
        return CGPoint(x: highlight.drawX, y: highlight.drawY)
    }
    
    // MARK: - Animation
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

=======
    
    /// The animator responsible for animating chart values.
    @objc open var chartAnimator: Animator!
    {
        return _animator
    }
    
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
    /// Animates the drawing / rendering of the chart on both x- and y-axis with the specified animation time.
    /// If `animate(...)` is called, no further calling of `invalidate()` is necessary to refresh the chart.
    ///
    /// - Parameters:
    ///   - xAxisDuration: duration for animating the x axis
    ///   - yAxisDuration: duration for animating the y axis
    ///   - easingX: an easing function for the animation on the x axis
    ///   - easingY: an easing function for the animation on the y axis
    @objc open func animate(xAxisDuration: TimeInterval, yAxisDuration: TimeInterval, easingX: ChartEasingFunctionBlock?, easingY: ChartEasingFunctionBlock?)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        chartAnimator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easingX: easingX, easingY: easingY)
=======
        _animator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easingX: easingX, easingY: easingY)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        chartAnimator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easingX: easingX, easingY: easingY)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        chartAnimator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easingX: easingX, easingY: easingY)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// Animates the drawing / rendering of the chart on both x- and y-axis with the specified animation time.
    /// If `animate(...)` is called, no further calling of `invalidate()` is necessary to refresh the chart.
    ///
    /// - Parameters:
    ///   - xAxisDuration: duration for animating the x axis
    ///   - yAxisDuration: duration for animating the y axis
    ///   - easingOptionX: the easing function for the animation on the x axis
    ///   - easingOptionY: the easing function for the animation on the y axis
    @objc open func animate(xAxisDuration: TimeInterval, yAxisDuration: TimeInterval, easingOptionX: ChartEasingOption, easingOptionY: ChartEasingOption)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        chartAnimator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easingOptionX: easingOptionX, easingOptionY: easingOptionY)
=======
        _animator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easingOptionX: easingOptionX, easingOptionY: easingOptionY)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        chartAnimator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easingOptionX: easingOptionX, easingOptionY: easingOptionY)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        chartAnimator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easingOptionX: easingOptionX, easingOptionY: easingOptionY)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// Animates the drawing / rendering of the chart on both x- and y-axis with the specified animation time.
    /// If `animate(...)` is called, no further calling of `invalidate()` is necessary to refresh the chart.
    ///
    /// - Parameters:
    ///   - xAxisDuration: duration for animating the x axis
    ///   - yAxisDuration: duration for animating the y axis
    ///   - easing: an easing function for the animation
    @objc open func animate(xAxisDuration: TimeInterval, yAxisDuration: TimeInterval, easing: ChartEasingFunctionBlock?)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        chartAnimator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easing: easing)
=======
        _animator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easing: easing)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        chartAnimator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easing: easing)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        chartAnimator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easing: easing)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// Animates the drawing / rendering of the chart on both x- and y-axis with the specified animation time.
    /// If `animate(...)` is called, no further calling of `invalidate()` is necessary to refresh the chart.
    ///
    /// - Parameters:
    ///   - xAxisDuration: duration for animating the x axis
    ///   - yAxisDuration: duration for animating the y axis
    ///   - easingOption: the easing function for the animation
    @objc open func animate(xAxisDuration: TimeInterval, yAxisDuration: TimeInterval, easingOption: ChartEasingOption)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        chartAnimator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easingOption: easingOption)
=======
        _animator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easingOption: easingOption)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        chartAnimator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easingOption: easingOption)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        chartAnimator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easingOption: easingOption)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// Animates the drawing / rendering of the chart on both x- and y-axis with the specified animation time.
    /// If `animate(...)` is called, no further calling of `invalidate()` is necessary to refresh the chart.
    ///
    /// - Parameters:
    ///   - xAxisDuration: duration for animating the x axis
    ///   - yAxisDuration: duration for animating the y axis
    @objc open func animate(xAxisDuration: TimeInterval, yAxisDuration: TimeInterval)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        chartAnimator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration)
=======
        _animator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        chartAnimator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        chartAnimator.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// Animates the drawing / rendering of the chart the x-axis with the specified animation time.
    /// If `animate(...)` is called, no further calling of `invalidate()` is necessary to refresh the chart.
    ///
    /// - Parameters:
    ///   - xAxisDuration: duration for animating the x axis
    ///   - easing: an easing function for the animation
    @objc open func animate(xAxisDuration: TimeInterval, easing: ChartEasingFunctionBlock?)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        chartAnimator.animate(xAxisDuration: xAxisDuration, easing: easing)
=======
        _animator.animate(xAxisDuration: xAxisDuration, easing: easing)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        chartAnimator.animate(xAxisDuration: xAxisDuration, easing: easing)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        chartAnimator.animate(xAxisDuration: xAxisDuration, easing: easing)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// Animates the drawing / rendering of the chart the x-axis with the specified animation time.
    /// If `animate(...)` is called, no further calling of `invalidate()` is necessary to refresh the chart.
    ///
    /// - Parameters:
    ///   - xAxisDuration: duration for animating the x axis
    ///   - easingOption: the easing function for the animation
    @objc open func animate(xAxisDuration: TimeInterval, easingOption: ChartEasingOption)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        chartAnimator.animate(xAxisDuration: xAxisDuration, easingOption: easingOption)
=======
        _animator.animate(xAxisDuration: xAxisDuration, easingOption: easingOption)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        chartAnimator.animate(xAxisDuration: xAxisDuration, easingOption: easingOption)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        chartAnimator.animate(xAxisDuration: xAxisDuration, easingOption: easingOption)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// Animates the drawing / rendering of the chart the x-axis with the specified animation time.
    /// If `animate(...)` is called, no further calling of `invalidate()` is necessary to refresh the chart.
    ///
    /// - Parameters:
    ///   - xAxisDuration: duration for animating the x axis
    @objc open func animate(xAxisDuration: TimeInterval)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        chartAnimator.animate(xAxisDuration: xAxisDuration)
=======
        _animator.animate(xAxisDuration: xAxisDuration)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        chartAnimator.animate(xAxisDuration: xAxisDuration)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        chartAnimator.animate(xAxisDuration: xAxisDuration)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// Animates the drawing / rendering of the chart the y-axis with the specified animation time.
    /// If `animate(...)` is called, no further calling of `invalidate()` is necessary to refresh the chart.
    ///
    /// - Parameters:
    ///   - yAxisDuration: duration for animating the y axis
    ///   - easing: an easing function for the animation
    @objc open func animate(yAxisDuration: TimeInterval, easing: ChartEasingFunctionBlock?)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        chartAnimator.animate(yAxisDuration: yAxisDuration, easing: easing)
=======
        _animator.animate(yAxisDuration: yAxisDuration, easing: easing)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        chartAnimator.animate(yAxisDuration: yAxisDuration, easing: easing)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        chartAnimator.animate(yAxisDuration: yAxisDuration, easing: easing)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// Animates the drawing / rendering of the chart the y-axis with the specified animation time.
    /// If `animate(...)` is called, no further calling of `invalidate()` is necessary to refresh the chart.
    ///
    /// - Parameters:
    ///   - yAxisDuration: duration for animating the y axis
    ///   - easingOption: the easing function for the animation
    @objc open func animate(yAxisDuration: TimeInterval, easingOption: ChartEasingOption)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        chartAnimator.animate(yAxisDuration: yAxisDuration, easingOption: easingOption)
=======
        _animator.animate(yAxisDuration: yAxisDuration, easingOption: easingOption)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        chartAnimator.animate(yAxisDuration: yAxisDuration, easingOption: easingOption)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        chartAnimator.animate(yAxisDuration: yAxisDuration, easingOption: easingOption)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// Animates the drawing / rendering of the chart the y-axis with the specified animation time.
    /// If `animate(...)` is called, no further calling of `invalidate()` is necessary to refresh the chart.
    ///
    /// - Parameters:
    ///   - yAxisDuration: duration for animating the y axis
    @objc open func animate(yAxisDuration: TimeInterval)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        chartAnimator.animate(yAxisDuration: yAxisDuration)
=======
        _animator.animate(yAxisDuration: yAxisDuration)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        chartAnimator.animate(yAxisDuration: yAxisDuration)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        chartAnimator.animate(yAxisDuration: yAxisDuration)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    // MARK: - Accessors

    /// The current y-max value across all DataSets
    open var chartYMax: Double
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        return data?.yMax ?? 0.0
=======
        return _data?.yMax ?? 0.0
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        return data?.yMax ?? 0.0
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        return data?.yMax ?? 0.0
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }

    /// The current y-min value across all DataSets
    open var chartYMin: Double
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        return data?.yMin ?? 0.0
=======
        return _data?.yMin ?? 0.0
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        return data?.yMin ?? 0.0
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        return data?.yMin ?? 0.0
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    open var chartXMax: Double
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        return xAxis._axisMaximum
=======
        return _xAxis._axisMaximum
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        return xAxis._axisMaximum
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        return xAxis._axisMaximum
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    open var chartXMin: Double
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        return xAxis._axisMinimum
=======
        return _xAxis._axisMinimum
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        return xAxis._axisMinimum
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        return xAxis._axisMinimum
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    open var xRange: Double
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        return xAxis.axisRange
=======
        return _xAxis.axisRange
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        return xAxis.axisRange
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        return xAxis.axisRange
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// - Note: (Equivalent of getCenter() in MPAndroidChart, as center is already a standard in iOS that returns the center point relative to superview, and MPAndroidChart returns relative to self)*
    /// The center point of the chart (the whole View) in pixels.
    @objc open var midPoint: CGPoint
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        let bounds = self.bounds
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
=======
        let bounds = self.bounds
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        return CGPoint(x: bounds.origin.x + bounds.size.width / 2.0, y: bounds.origin.y + bounds.size.height / 2.0)
    }
    
    /// The center of the chart taking offsets under consideration. (returns the center of the content rectangle)
    open var centerOffsets: CGPoint
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        return viewPortHandler.contentCenter
    }

    /// The rectangle that defines the borders of the chart-value surface (into which the actual values are drawn).
    @objc open var contentRect: CGRect
    {
        return viewPortHandler.contentRect
    }

    /// - Returns: The bitmap that represents the chart.
    @objc open func getChartImage(transparent: Bool) -> NSUIImage?
    {
        NSUIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque || !transparent, NSUIMainScreen()?.nsuiScale ?? 1.0)
=======
        return _viewPortHandler.contentCenter
<<<<<<< HEAD
<<<<<<< HEAD
=======
        return viewPortHandler.contentCenter
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    }

    /// The rectangle that defines the borders of the chart-value surface (into which the actual values are drawn).
    @objc open var contentRect: CGRect
    {
        return viewPortHandler.contentRect
    }

    /// - Returns: The bitmap that represents the chart.
    @objc open func getChartImage(transparent: Bool) -> NSUIImage?
    {
<<<<<<< HEAD
        NSUIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque || !transparent, NSUIScreen.nsuiMain?.nsuiScale ?? 1.0)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
        NSUIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque || !transparent, NSUIMainScreen()?.nsuiScale ?? 1.0)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
        return viewPortHandler.contentCenter
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }

    /// The rectangle that defines the borders of the chart-value surface (into which the actual values are drawn).
    @objc open var contentRect: CGRect
    {
        return viewPortHandler.contentRect
    }

    /// - Returns: The bitmap that represents the chart.
    @objc open func getChartImage(transparent: Bool) -> NSUIImage?
    {
<<<<<<< HEAD
        NSUIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque || !transparent, NSUIScreen.nsuiMain?.nsuiScale ?? 1.0)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        NSUIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque || !transparent, NSUIMainScreen()?.nsuiScale ?? 1.0)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        
        guard let context = NSUIGraphicsGetCurrentContext()
            else { return nil }
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        let rect = CGRect(origin: .zero, size: bounds.size)
=======
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: bounds.size)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        let rect = CGRect(origin: .zero, size: bounds.size)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        let rect = CGRect(origin: .zero, size: bounds.size)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        
        if isOpaque || !transparent
        {
            // Background color may be partially transparent, we must fill with white if we want to output an opaque image
            context.setFillColor(NSUIColor.white.cgColor)
            context.fill(rect)
            
            if let backgroundColor = self.backgroundColor
            {
                context.setFillColor(backgroundColor.cgColor)
                context.fill(rect)
            }
        }
        
        nsuiLayer?.render(in: context)
        
        let image = NSUIGraphicsGetImageFromCurrentImageContext()
        
        NSUIGraphicsEndImageContext()
        
        return image
    }
    
    public enum ImageFormat
    {
        case jpeg
        case png
    }
    
    /// Saves the current chart state with the given name to the given path on
    /// the sdcard leaving the path empty "" will put the saved file directly on
    /// the SD card chart is saved as a PNG image, example:
    /// saveToPath("myfilename", "foldername1/foldername2")
    ///
    /// - Parameters:
    ///   - to: path to the image to save
    ///   - format: the format to save
    ///   - compressionQuality: compression quality for lossless formats (JPEG)
    /// - Returns: `true` if the image was saved successfully
    open func save(to path: String, format: ImageFormat, compressionQuality: Double) -> Bool
    {
        guard let image = getChartImage(transparent: format != .jpeg) else { return false }
        
        let imageData: Data?
        switch (format)
        {
        case .png: imageData = NSUIImagePNGRepresentation(image)
        case .jpeg: imageData = NSUIImageJPEGRepresentation(image, CGFloat(compressionQuality))
        }
        
        guard let data = imageData else { return false }
        
        do
        {
            try data.write(to: URL(fileURLWithPath: path), options: .atomic)
        }
        catch
        {
            return false
        }
        
        return true
    }
    
    internal var _viewportJobs = [ViewPortJob]()
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
    {
        if keyPath == "bounds" || keyPath == "frame"
        {
            let bounds = self.bounds
            
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            if ((bounds.size.width != viewPortHandler.chartWidth ||
                bounds.size.height != viewPortHandler.chartHeight))
            {
                viewPortHandler.setChartDimens(width: bounds.size.width, height: bounds.size.height)
=======
            if (_viewPortHandler !== nil &&
                (bounds.size.width != _viewPortHandler.chartWidth ||
                bounds.size.height != _viewPortHandler.chartHeight))
            {
                _viewPortHandler.setChartDimens(width: bounds.size.width, height: bounds.size.height)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
            if ((bounds.size.width != viewPortHandler.chartWidth ||
                bounds.size.height != viewPortHandler.chartHeight))
            {
                viewPortHandler.setChartDimens(width: bounds.size.width, height: bounds.size.height)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
                
                // This may cause the chart view to mutate properties affecting the view port -- lets do this
                // before we try to run any pending jobs on the view port itself
                notifyDataSetChanged()

                // Finish any pending viewport changes
                while (!_viewportJobs.isEmpty)
                {
                    let job = _viewportJobs.remove(at: 0)
                    job.doJob()
                }
            }
        }
    }
    
    @objc open func removeViewportJob(_ job: ViewPortJob)
    {
        if let index = _viewportJobs.firstIndex(where: { $0 === job })
        {
            _viewportJobs.remove(at: index)
        }
    }
    
    @objc open func clearAllViewportJobs()
    {
        _viewportJobs.removeAll(keepingCapacity: false)
    }
    
    @objc open func addViewportJob(_ job: ViewPortJob)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        if viewPortHandler.hasChartDimens
=======
        if _viewPortHandler.hasChartDimens
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        if viewPortHandler.hasChartDimens
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        if viewPortHandler.hasChartDimens
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        {
            job.doJob()
        }
        else
        {
            _viewportJobs.append(job)
        }
    }
    
    /// **default**: true
    /// `true` if chart continues to scroll after touch up, `false` ifnot.
    @objc open var isDragDecelerationEnabled: Bool
        {
            return dragDecelerationEnabled
    }
    
    /// Deceleration friction coefficient in [0 ; 1] interval, higher values indicate that speed will decrease slowly, for example if it set to 0, it will stop immediately.
    /// 1 is an invalid value, and will be converted to 0.999 automatically.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
    /// 
    /// **default**: true
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
    @objc open var dragDecelerationFrictionCoef: CGFloat
    {
        get
        {
            return _dragDecelerationFrictionCoef
        }
        set
        {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            _dragDecelerationFrictionCoef = max(0, min(newValue, 0.999))
        }
    }
    private var _dragDecelerationFrictionCoef: CGFloat = 0.9
=======
            var val = newValue
            if val < 0.0
            {
                val = 0.0
            }
            if val >= 1.0
            {
                val = 0.999
            }
            
            _dragDecelerationFrictionCoef = val
        }
    }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
            _dragDecelerationFrictionCoef = max(0, min(newValue, 0.999))
        }
    }
    private var _dragDecelerationFrictionCoef: CGFloat = 0.9
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    
    /// The maximum distance in screen pixels away from an entry causing it to highlight.
    /// **default**: 500.0
    open var maxHighlightDistance: CGFloat = 500.0
    
    /// the number of maximum visible drawn values on the chart only active when `drawValuesEnabled` is enabled
    open var maxVisibleCount: Int
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        return .max
=======
        return Int(INT_MAX)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        return .max
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        return .max
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    // MARK: - AnimatorDelegate
    
    open func animatorUpdated(_ chartAnimator: Animator)
    {
        setNeedsDisplay()
    }
    
    open func animatorStopped(_ chartAnimator: Animator)
    {
        delegate?.chartView?(self, animatorDidStop: chartAnimator)
    }
    
    // MARK: - Touches
    
    open override func nsuiTouchesBegan(_ touches: Set<NSUITouch>, withEvent event: NSUIEvent?)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        super.nsuiTouchesBegan(touches, withEvent: event)
=======
        if !_interceptTouchEvents
        {
            super.nsuiTouchesBegan(touches, withEvent: event)
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        super.nsuiTouchesBegan(touches, withEvent: event)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        super.nsuiTouchesBegan(touches, withEvent: event)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    open override func nsuiTouchesMoved(_ touches: Set<NSUITouch>, withEvent event: NSUIEvent?)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        super.nsuiTouchesMoved(touches, withEvent: event)
=======
        if !_interceptTouchEvents
        {
            super.nsuiTouchesMoved(touches, withEvent: event)
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        super.nsuiTouchesMoved(touches, withEvent: event)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        super.nsuiTouchesMoved(touches, withEvent: event)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    open override func nsuiTouchesEnded(_ touches: Set<NSUITouch>, withEvent event: NSUIEvent?)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        super.nsuiTouchesEnded(touches, withEvent: event)
=======
        if !_interceptTouchEvents
        {
            super.nsuiTouchesEnded(touches, withEvent: event)
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        super.nsuiTouchesEnded(touches, withEvent: event)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        super.nsuiTouchesEnded(touches, withEvent: event)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    open override func nsuiTouchesCancelled(_ touches: Set<NSUITouch>?, withEvent event: NSUIEvent?)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        super.nsuiTouchesCancelled(touches, withEvent: event)
=======
        if !_interceptTouchEvents
        {
            super.nsuiTouchesCancelled(touches, withEvent: event)
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        super.nsuiTouchesCancelled(touches, withEvent: event)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        super.nsuiTouchesCancelled(touches, withEvent: event)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
}
