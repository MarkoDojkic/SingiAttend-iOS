//
//  BarChartDataSet.swift
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
open class BarChartDataSet: BarLineScatterCandleBubbleChartDataSet, BarChartDataSetProtocol
=======
open class BarChartDataSet: BarLineScatterCandleBubbleChartDataSet, IBarChartDataSet
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
open class BarChartDataSet: BarLineScatterCandleBubbleChartDataSet, BarChartDataSetProtocol
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
open class BarChartDataSet: BarLineScatterCandleBubbleChartDataSet, BarChartDataSetProtocol
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
{
    private func initialize()
    {
        self.highlightColor = NSUIColor.black
        
        self.calcStackSize(entries: entries as! [BarChartDataEntry])
        self.calcEntryCountIncludingStacks(entries: entries as! [BarChartDataEntry])
    }
    
    public required init()
    {
        super.init()
        initialize()
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    public override init(entries: [ChartDataEntry], label: String)
=======
    public override init(entries: [ChartDataEntry]?, label: String?)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    public override init(entries: [ChartDataEntry], label: String)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    public override init(entries: [ChartDataEntry], label: String)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        super.init(entries: entries, label: label)
        initialize()
    }

    // MARK: - Data functions and accessors
    
    /// the maximum number of bars that are stacked upon each other, this value
    /// is calculated from the Entries that are added to the DataSet
    private var _stackSize = 1
    
    /// the overall entry count, including counting each stack-value individually
    private var _entryCountStacks = 0
    
    /// Calculates the total number of entries this DataSet represents, including
    /// stacks. All values belonging to a stack are calculated separately.
    private func calcEntryCountIncludingStacks(entries: [BarChartDataEntry])
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        _entryCountStacks = entries.lazy
            .map(\.stackSize)
            .reduce(into: 0, +=)
=======
        _entryCountStacks = 0
        
        for i in 0 ..< entries.count
        {
            if let vals = entries[i].yValues
            {
                _entryCountStacks += vals.count
            }
            else
            {
                _entryCountStacks += 1
            }
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        _entryCountStacks = entries.lazy
            .map(\.stackSize)
            .reduce(into: 0, +=)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// calculates the maximum stacksize that occurs in the Entries array of this DataSet
    private func calcStackSize(entries: [BarChartDataEntry])
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        _stackSize = entries.lazy
            .map(\.stackSize)
            .max() ?? 1
=======
        for i in 0 ..< entries.count
        {
            if let vals = entries[i].yValues
            {
                if vals.count > _stackSize
                {
                    _stackSize = vals.count
                }
            }
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        _stackSize = entries.lazy
            .map(\.stackSize)
            .max() ?? 1
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    open override func calcMinMax(entry e: ChartDataEntry)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        guard let e = e as? BarChartDataEntry,
            !e.y.isNaN
            else { return }
        
        if e.yValues == nil
        {
            _yMin = Swift.min(e.y, _yMin)
            _yMax = Swift.max(e.y, _yMax)
        }
        else
        {
            _yMin = Swift.min(-e.negativeSum, _yMin)
            _yMax = Swift.max(e.positiveSum, _yMax)
        }

        calcMinMaxX(entry: e)
=======
        guard let e = e as? BarChartDataEntry
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        guard let e = e as? BarChartDataEntry,
            !e.y.isNaN
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
            else { return }
        
        if e.yValues == nil
        {
            _yMin = Swift.min(e.y, _yMin)
            _yMax = Swift.max(e.y, _yMax)
        }
<<<<<<< HEAD
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
        else
        {
            _yMin = Swift.min(-e.negativeSum, _yMin)
            _yMax = Swift.max(e.positiveSum, _yMax)
        }

        calcMinMaxX(entry: e)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            else { return }
        
        if e.yValues == nil
        {
            _yMin = Swift.min(e.y, _yMin)
            _yMax = Swift.max(e.y, _yMax)
        }
<<<<<<< HEAD
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        else
        {
            _yMin = Swift.min(-e.negativeSum, _yMin)
            _yMax = Swift.max(e.positiveSum, _yMax)
        }

        calcMinMaxX(entry: e)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// The maximum number of bars that can be stacked upon another in this DataSet.
    open var stackSize: Int
    {
        return _stackSize
    }
    
    /// `true` if this DataSet is stacked (stacksize > 1) or not.
    open var isStacked: Bool
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        return _stackSize > 1
=======
        return _stackSize > 1 ? true : false
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        return _stackSize > 1
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        return _stackSize > 1
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// The overall entry count, including counting each stack-value individually
    @objc open var entryCountStacks: Int
    {
        return _entryCountStacks
    }
    
    /// array of labels used to describe the different values of the stacked bars
    open var stackLabels: [String] = []
    
    // MARK: - Styling functions and accessors
    
    /// the color used for drawing the bar-shadows. The bar shadows is a surface behind the bar that indicates the maximum value
    open var barShadowColor = NSUIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1.0)

    /// the width used for drawing borders around the bars. If borderWidth == 0, no border will be drawn.
    open var barBorderWidth : CGFloat = 0.0

    /// the color drawing borders around the bars.
    open var barBorderColor = NSUIColor.black

    /// the alpha value (transparency) that is used for drawing the highlight indicator bar. min = 0.0 (fully transparent), max = 1.0 (fully opaque)
    open var highlightAlpha = CGFloat(120.0 / 255.0)
    
    // MARK: - NSCopying
    
    open override func copy(with zone: NSZone? = nil) -> Any
    {
        let copy = super.copy(with: zone) as! BarChartDataSet
        copy._stackSize = _stackSize
        copy._entryCountStacks = _entryCountStacks
        copy.stackLabels = stackLabels

        copy.barShadowColor = barShadowColor
        copy.barBorderWidth = barBorderWidth
        copy.barBorderColor = barBorderColor
        copy.highlightAlpha = highlightAlpha
        return copy
    }
}
