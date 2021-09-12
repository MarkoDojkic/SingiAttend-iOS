//
//  CandleChartDataSet.swift
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
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
open class CandleChartDataSet: LineScatterCandleRadarChartDataSet, CandleChartDataSetProtocol
=======
open class CandleChartDataSet: LineScatterCandleRadarChartDataSet, ICandleChartDataSet
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
open class CandleChartDataSet: LineScatterCandleRadarChartDataSet, CandleChartDataSetProtocol
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
{
    
    public required init()
    {
        super.init()
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    public override init(entries: [ChartDataEntry], label: String)
=======
    public override init(entries: [ChartDataEntry]?, label: String?)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    public override init(entries: [ChartDataEntry], label: String)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    {
        super.init(entries: entries, label: label)
    }
    
    // MARK: - Data functions and accessors
    
    open override func calcMinMax(entry e: ChartDataEntry)
    {
        guard let e = e as? CandleChartDataEntry
            else { return }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

        _yMin = Swift.min(e.low, _yMin)
        _yMax = Swift.max(e.high, _yMax)

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
        
        if e.low < _yMin
        {
            _yMin = e.low
        }
        
        if e.high > _yMax
        {
            _yMax = e.high
        }
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        calcMinMaxX(entry: e)
    }
    
    open override func calcMinMaxY(entry e: ChartDataEntry)
    {
        guard let e = e as? CandleChartDataEntry
            else { return }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

        _yMin = Swift.min(e.low, _yMin)
        _yMax = Swift.max(e.high, _yMin)

        _yMin = Swift.min(e.low, _yMax)
        _yMax = Swift.max(e.high, _yMax)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
        
        if e.high < _yMin
        {
            _yMin = e.high
        }
        if e.high > _yMax
        {
            _yMax = e.high
        }
        
        if e.low < _yMin
        {
            _yMin = e.low
        }
        if e.low > _yMax
        {
            _yMax = e.low
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
    
    // MARK: - Styling functions and accessors
    
    /// the space between the candle entries
    ///
    /// **default**: 0.1 (10%)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    private var _barSpace: CGFloat = 0.1

=======
    private var _barSpace = CGFloat(0.1)
    
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    private var _barSpace: CGFloat = 0.1

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    /// the space that is left out on the left and right side of each candle,
    /// **default**: 0.1 (10%), max 0.45, min 0.0
    open var barSpace: CGFloat
    {
        get
        {
            return _barSpace
        }
        set
        {
            _barSpace = newValue.clamped(to: 0...0.45)
        }
    }
    
    /// should the candle bars show?
    /// when false, only "ticks" will show
    ///
    /// **default**: true
    open var showCandleBar: Bool = true
    
    /// the width of the candle-shadow-line in pixels.
    ///
    /// **default**: 1.5
    open var shadowWidth = CGFloat(1.5)
    
    /// the color of the shadow line
    open var shadowColor: NSUIColor?
    
    /// use candle color for the shadow
    open var shadowColorSameAsCandle = false
    
    /// Is the shadow color same as the candle color?
    open var isShadowColorSameAsCandle: Bool { return shadowColorSameAsCandle }
    
    /// color for open == close
    open var neutralColor: NSUIColor?
    
    /// color for open > close
    open var increasingColor: NSUIColor?
    
    /// color for open < close
    open var decreasingColor: NSUIColor?
    
    /// Are increasing values drawn as filled?
    /// increasing candlesticks are traditionally hollow
    open var increasingFilled = false
    
    /// Are increasing values drawn as filled?
    open var isIncreasingFilled: Bool { return increasingFilled }
    
    /// Are decreasing values drawn as filled?
    /// descreasing candlesticks are traditionally filled
    open var decreasingFilled = true
    
    /// Are decreasing values drawn as filled?
    open var isDecreasingFilled: Bool { return decreasingFilled }
}
