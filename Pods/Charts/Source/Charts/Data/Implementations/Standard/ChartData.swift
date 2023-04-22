//
//  ChartData.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
open class ChartData: NSObject, ExpressibleByArrayLiteral
{

    @objc public internal(set) var xMax = -Double.greatestFiniteMagnitude
    @objc public internal(set) var xMin = Double.greatestFiniteMagnitude
    @objc public internal(set) var yMax = -Double.greatestFiniteMagnitude
    @objc public internal(set) var yMin = Double.greatestFiniteMagnitude
    var leftAxisMax = -Double.greatestFiniteMagnitude
    var leftAxisMin = Double.greatestFiniteMagnitude
    var rightAxisMax = -Double.greatestFiniteMagnitude
    var rightAxisMin = Double.greatestFiniteMagnitude

    // MARK: - Accessibility
    
    /// When the data entry labels are generated identifiers, set this property to prepend a string before each identifier
    ///
    /// For example, if a label is "#3", settings this property to "Item" allows it to be spoken as "Item #3"
    @objc open var accessibilityEntryLabelPrefix: String?
    
    /// When the data entry value requires a unit, use this property to append the string representation of the unit to the value
    ///
    /// For example, if a value is "44.1", setting this property to "m" allows it to be spoken as "44.1 m"
    @objc open var accessibilityEntryLabelSuffix: String?
    
    /// If the data entry value is a count, set this to true to allow plurals and other grammatical changes
    /// **default**: false
    @objc open var accessibilityEntryLabelSuffixIsCount: Bool = false
    
    var _dataSets = [Element]()
    
    public override required init()
    {
        super.init()
    }

    public required init(arrayLiteral elements: Element...)
    {
        super.init()
        self.dataSets = elements
    }

    @objc public init(dataSets: [Element])
    {
        super.init()
        self.dataSets = dataSets
    }
    
    @objc public convenience init(dataSet: Element)
    {
        self.init(dataSets: [dataSet])
    }

=======
open class ChartData: NSObject
<<<<<<< HEAD
<<<<<<< HEAD
=======
open class ChartData: NSObject, ExpressibleByArrayLiteral
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
{

    @objc public internal(set) var xMax = -Double.greatestFiniteMagnitude
    @objc public internal(set) var xMin = Double.greatestFiniteMagnitude
    @objc public internal(set) var yMax = -Double.greatestFiniteMagnitude
    @objc public internal(set) var yMin = Double.greatestFiniteMagnitude
    var leftAxisMax = -Double.greatestFiniteMagnitude
    var leftAxisMin = Double.greatestFiniteMagnitude
    var rightAxisMax = -Double.greatestFiniteMagnitude
    var rightAxisMin = Double.greatestFiniteMagnitude

    // MARK: - Accessibility
    
    /// When the data entry labels are generated identifiers, set this property to prepend a string before each identifier
    ///
    /// For example, if a label is "#3", settings this property to "Item" allows it to be spoken as "Item #3"
    @objc open var accessibilityEntryLabelPrefix: String?
    
    /// When the data entry value requires a unit, use this property to append the string representation of the unit to the value
    ///
    /// For example, if a value is "44.1", setting this property to "m" allows it to be spoken as "44.1 m"
    @objc open var accessibilityEntryLabelSuffix: String?
    
    /// If the data entry value is a count, set this to true to allow plurals and other grammatical changes
    /// **default**: false
    @objc open var accessibilityEntryLabelSuffixIsCount: Bool = false
    
    var _dataSets = [Element]()
    
    public override required init()
    {
        super.init()
    }

    public required init(arrayLiteral elements: Element...)
    {
        super.init()
        self.dataSets = elements
    }

    @objc public init(dataSets: [Element])
    {
        super.init()
        self.dataSets = dataSets
    }
    
    @objc public convenience init(dataSet: Element)
    {
        self.init(dataSets: [dataSet])
    }
<<<<<<< HEAD
    
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
open class ChartData: NSObject, ExpressibleByArrayLiteral
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
{

    @objc public internal(set) var xMax = -Double.greatestFiniteMagnitude
    @objc public internal(set) var xMin = Double.greatestFiniteMagnitude
    @objc public internal(set) var yMax = -Double.greatestFiniteMagnitude
    @objc public internal(set) var yMin = Double.greatestFiniteMagnitude
    var leftAxisMax = -Double.greatestFiniteMagnitude
    var leftAxisMin = Double.greatestFiniteMagnitude
    var rightAxisMax = -Double.greatestFiniteMagnitude
    var rightAxisMin = Double.greatestFiniteMagnitude

    // MARK: - Accessibility
    
    /// When the data entry labels are generated identifiers, set this property to prepend a string before each identifier
    ///
    /// For example, if a label is "#3", settings this property to "Item" allows it to be spoken as "Item #3"
    @objc open var accessibilityEntryLabelPrefix: String?
    
    /// When the data entry value requires a unit, use this property to append the string representation of the unit to the value
    ///
    /// For example, if a value is "44.1", setting this property to "m" allows it to be spoken as "44.1 m"
    @objc open var accessibilityEntryLabelSuffix: String?
    
    /// If the data entry value is a count, set this to true to allow plurals and other grammatical changes
    /// **default**: false
    @objc open var accessibilityEntryLabelSuffixIsCount: Bool = false
    
    var _dataSets = [Element]()
    
    public override required init()
    {
        super.init()
    }

    public required init(arrayLiteral elements: Element...)
    {
        super.init()
        self.dataSets = elements
    }

    @objc public init(dataSets: [Element])
    {
        super.init()
        self.dataSets = dataSets
    }
    
    @objc public convenience init(dataSet: Element)
    {
        self.init(dataSets: [dataSet])
    }
<<<<<<< HEAD
    
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    /// Call this method to let the ChartData know that the underlying data has changed.
    /// Calling this performs all necessary recalculations needed when the contained data has changed.
    @objc open func notifyDataChanged()
    {
        calcMinMax()
    }
    
    @objc open func calcMinMaxY(fromX: Double, toX: Double)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        forEach { $0.calcMinMaxY(fromX: fromX, toX: toX) }
        
=======
        _dataSets.forEach { $0.calcMinMaxY(fromX: fromX, toX: toX) }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        forEach { $0.calcMinMaxY(fromX: fromX, toX: toX) }
        
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        // apply the new data
        calcMinMax()
    }
    
    /// calc minimum and maximum y value over all datasets
    @objc open func calcMinMax()
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
        leftAxisMax = -.greatestFiniteMagnitude
        leftAxisMin = .greatestFiniteMagnitude
        rightAxisMax = -.greatestFiniteMagnitude
        rightAxisMin = .greatestFiniteMagnitude
        yMax = -.greatestFiniteMagnitude
        yMin = .greatestFiniteMagnitude
        xMax = -.greatestFiniteMagnitude
        xMin = .greatestFiniteMagnitude

        forEach { calcMinMax(dataSet: $0) }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        _yMax = -Double.greatestFiniteMagnitude
        _yMin = Double.greatestFiniteMagnitude
        _xMax = -Double.greatestFiniteMagnitude
        _xMin = Double.greatestFiniteMagnitude
        
        _dataSets.forEach { calcMinMax(dataSet: $0) }
        
        _leftAxisMax = -Double.greatestFiniteMagnitude
        _leftAxisMin = Double.greatestFiniteMagnitude
        _rightAxisMax = -Double.greatestFiniteMagnitude
        _rightAxisMin = Double.greatestFiniteMagnitude
        
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
        // left axis
        let firstLeft = getFirstLeft(dataSets: dataSets)
        
        if firstLeft !== nil
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
            leftAxisMax = firstLeft!.yMax
            leftAxisMin = firstLeft!.yMin

            for dataSet in _dataSets where dataSet.axisDependency == .left
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            {
                if dataSet.yMin < leftAxisMin
                {
                    leftAxisMin = dataSet.yMin
                }

                if dataSet.yMax > leftAxisMax
                {
                    leftAxisMax = dataSet.yMax
=======
            _leftAxisMax = firstLeft!.yMax
            _leftAxisMin = firstLeft!.yMin
            
            for dataSet in _dataSets
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
            {
                if dataSet.yMin < leftAxisMin
                {
<<<<<<< HEAD
=======
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            {
                if dataSet.yMin < leftAxisMin
                {
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
                    if dataSet.yMin < _leftAxisMin
                    {
                        _leftAxisMin = dataSet.yMin
                    }
                    
                    if dataSet.yMax > _leftAxisMax
                    {
                        _leftAxisMax = dataSet.yMax
                    }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
                    leftAxisMin = dataSet.yMin
                }

                if dataSet.yMax > leftAxisMax
                {
                    leftAxisMax = dataSet.yMax
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
                }
            }
        }
        
        // right axis
        let firstRight = getFirstRight(dataSets: dataSets)
        
        if firstRight !== nil
        {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            rightAxisMax = firstRight!.yMax
            rightAxisMin = firstRight!.yMin
            
            for dataSet in _dataSets where dataSet.axisDependency == .right
            {
                if dataSet.yMin < rightAxisMin
                {
                    rightAxisMin = dataSet.yMin
                }

                if dataSet.yMax > rightAxisMax
                {
                    rightAxisMax = dataSet.yMax
=======
            _rightAxisMax = firstRight!.yMax
            _rightAxisMin = firstRight!.yMin
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
            rightAxisMax = firstRight!.yMax
            rightAxisMin = firstRight!.yMin
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
            
            for dataSet in _dataSets where dataSet.axisDependency == .right
            {
                if dataSet.yMin < rightAxisMin
                {
<<<<<<< HEAD
=======
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            
            for dataSet in _dataSets where dataSet.axisDependency == .right
            {
                if dataSet.yMin < rightAxisMin
                {
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
                    if dataSet.yMin < _rightAxisMin
                    {
                        _rightAxisMin = dataSet.yMin
                    }
                    
                    if dataSet.yMax > _rightAxisMax
                    {
                        _rightAxisMax = dataSet.yMax
                    }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
                    rightAxisMin = dataSet.yMin
                }

                if dataSet.yMax > rightAxisMax
                {
                    rightAxisMax = dataSet.yMax
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
                }
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

    /// Adjusts the current minimum and maximum values based on the provided Entry object.
    @objc open func calcMinMax(entry e: ChartDataEntry, axis: YAxis.AxisDependency)
    {
        xMax = Swift.max(xMax, e.x)
        xMin = Swift.min(xMin, e.x)
        yMax = Swift.max(yMax, e.y)
        yMin = Swift.min(yMin, e.y)

        switch axis
        {
        case .left:
            leftAxisMax = Swift.max(leftAxisMax, e.y)
            leftAxisMin = Swift.min(leftAxisMin, e.y)

        case .right:
            rightAxisMax = Swift.max(rightAxisMax, e.y)
            rightAxisMin = Swift.min(rightAxisMin, e.y)
=======
    
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    /// Adjusts the current minimum and maximum values based on the provided Entry object.
    @objc open func calcMinMax(entry e: ChartDataEntry, axis: YAxis.AxisDependency)
    {
        xMax = Swift.max(xMax, e.x)
        xMin = Swift.min(xMin, e.x)
        yMax = Swift.max(yMax, e.y)
        yMin = Swift.min(yMin, e.y)

        switch axis
        {
<<<<<<< HEAD
=======
=======
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    /// Adjusts the current minimum and maximum values based on the provided Entry object.
    @objc open func calcMinMax(entry e: ChartDataEntry, axis: YAxis.AxisDependency)
    {
        xMax = Swift.max(xMax, e.x)
        xMin = Swift.min(xMin, e.x)
        yMax = Swift.max(yMax, e.y)
        yMin = Swift.min(yMin, e.y)

        switch axis
        {
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            _yMax = e.y
        }
        
        if _yMin > e.y
        {
            _yMin = e.y
        }
        
        if _xMax < e.x
        {
            _xMax = e.x
        }
        
        if _xMin > e.x
        {
            _xMin = e.x
        }
        
        if axis == .left
        {
            if _leftAxisMax < e.y
            {
                _leftAxisMax = e.y
            }
            
            if _leftAxisMin > e.y
            {
                _leftAxisMin = e.y
            }
        }
        else
        {
            if _rightAxisMax < e.y
            {
                _rightAxisMax = e.y
            }
            
            if _rightAxisMin > e.y
            {
                _rightAxisMin = e.y
            }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        case .left:
            leftAxisMax = Swift.max(leftAxisMax, e.y)
            leftAxisMin = Swift.min(leftAxisMin, e.y)

        case .right:
            rightAxisMax = Swift.max(rightAxisMax, e.y)
            rightAxisMin = Swift.min(rightAxisMin, e.y)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        }
    }
    
    /// Adjusts the minimum and maximum values based on the given DataSet.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc open func calcMinMax(dataSet d: Element)
    {
        xMax = Swift.max(xMax, d.xMax)
        xMin = Swift.min(xMin, d.xMin)
        yMax = Swift.max(yMax, d.yMax)
        yMin = Swift.min(yMin, d.yMin)

        switch d.axisDependency
        {
        case .left:
            leftAxisMax = Swift.max(leftAxisMax, d.yMax)
            leftAxisMin = Swift.min(leftAxisMin, d.yMin)

        case .right:
            rightAxisMax = Swift.max(rightAxisMax, d.yMax)
            rightAxisMin = Swift.min(rightAxisMin, d.yMin)
=======
    @objc open func calcMinMax(dataSet d: IChartDataSet)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @objc open func calcMinMax(dataSet d: Element)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    {
        xMax = Swift.max(xMax, d.xMax)
        xMin = Swift.min(xMin, d.xMin)
        yMax = Swift.max(yMax, d.yMax)
        yMin = Swift.min(yMin, d.yMin)

        switch d.axisDependency
        {
<<<<<<< HEAD
=======
=======
=======
    @objc open func calcMinMax(dataSet d: Element)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        xMax = Swift.max(xMax, d.xMax)
        xMin = Swift.min(xMin, d.xMin)
        yMax = Swift.max(yMax, d.yMax)
        yMin = Swift.min(yMin, d.yMin)

        switch d.axisDependency
        {
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            _yMax = d.yMax
        }
        
        if _yMin > d.yMin
        {
            _yMin = d.yMin
        }
        
        if _xMax < d.xMax
        {
            _xMax = d.xMax
        }
        
        if _xMin > d.xMin
        {
            _xMin = d.xMin
        }
        
        if d.axisDependency == .left
        {
            if _leftAxisMax < d.yMax
            {
                _leftAxisMax = d.yMax
            }
            
            if _leftAxisMin > d.yMin
            {
                _leftAxisMin = d.yMin
            }
        }
        else
        {
            if _rightAxisMax < d.yMax
            {
                _rightAxisMax = d.yMax
            }
            
            if _rightAxisMin > d.yMin
            {
                _rightAxisMin = d.yMin
            }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        case .left:
            leftAxisMax = Swift.max(leftAxisMax, d.yMax)
            leftAxisMin = Swift.min(leftAxisMin, d.yMin)

        case .right:
            rightAxisMax = Swift.max(rightAxisMax, d.yMax)
            rightAxisMin = Swift.min(rightAxisMin, d.yMin)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        }
    }
    
    /// The number of LineDataSets this object contains
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    // exists only for objc compatibility
    @objc open var dataSetCount: Int
    {
        return dataSets.count
    }

    @objc open func getYMin(axis: YAxis.AxisDependency) -> Double
    {
        // TODO: Why does it make sense to return the other axisMin if there is none for the one requested?
        switch axis
        {
        case .left:
            if leftAxisMin == .greatestFiniteMagnitude
            {
                return rightAxisMin
            }
            else
            {
                return leftAxisMin
            }

        case .right:
            if rightAxisMin == .greatestFiniteMagnitude
            {
                return leftAxisMin
            }
            else
            {
                return rightAxisMin
            }
        }
=======
<<<<<<< HEAD
<<<<<<< HEAD
=======
    // exists only for objc compatibility
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    @objc open var dataSetCount: Int
    {
        return dataSets.count
    }

    @objc open func getYMin(axis: YAxis.AxisDependency) -> Double
    {
        // TODO: Why does it make sense to return the other axisMin if there is none for the one requested?
        switch axis
        {
        case .left:
            if leftAxisMin == .greatestFiniteMagnitude
            {
                return rightAxisMin
            }
            else
            {
                return leftAxisMin
            }

        case .right:
            if rightAxisMin == .greatestFiniteMagnitude
            {
                return leftAxisMin
            }
            else
            {
                return rightAxisMin
=======
=======
=======
    // exists only for objc compatibility
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc open var dataSetCount: Int
    {
        return dataSets.count
    }

    @objc open func getYMin(axis: YAxis.AxisDependency) -> Double
    {
        // TODO: Why does it make sense to return the other axisMin if there is none for the one requested?
        switch axis
        {
        case .left:
            if leftAxisMin == .greatestFiniteMagnitude
            {
                return rightAxisMin
            }
            else
            {
                return leftAxisMin
            }

        case .right:
            if rightAxisMin == .greatestFiniteMagnitude
            {
                return leftAxisMin
            }
            else
            {
<<<<<<< HEAD
                return _rightAxisMin
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
                return rightAxisMin
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            }
        }
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    /// The greatest y-value the data object contains.
    @objc open var yMax: Double
    {
        return _yMax
    }
    
    @nonobjc
    open func getYMax() -> Double
    {
        return _yMax
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
    }
    
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
    @objc open func getYMax(axis: YAxis.AxisDependency) -> Double
    {
        if axis == .left
        {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            if leftAxisMax == -.greatestFiniteMagnitude
            {
                return rightAxisMax
            }
            else
            {
                return leftAxisMax
=======
            if _leftAxisMax == -Double.greatestFiniteMagnitude
<<<<<<< HEAD
<<<<<<< HEAD
=======
            if leftAxisMax == -.greatestFiniteMagnitude
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
            {
                return rightAxisMax
            }
            else
            {
<<<<<<< HEAD
                return _leftAxisMax
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
                return leftAxisMax
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
            if leftAxisMax == -.greatestFiniteMagnitude
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            {
                return rightAxisMax
            }
            else
            {
<<<<<<< HEAD
                return _leftAxisMax
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
                return leftAxisMax
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            }
        }
        else
        {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            if rightAxisMax == -.greatestFiniteMagnitude
            {
                return leftAxisMax
            }
            else
            {
                return rightAxisMax
=======
            if _rightAxisMax == -Double.greatestFiniteMagnitude
<<<<<<< HEAD
<<<<<<< HEAD
=======
            if rightAxisMax == -.greatestFiniteMagnitude
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
            {
                return leftAxisMax
            }
            else
            {
<<<<<<< HEAD
                return _rightAxisMax
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
                return rightAxisMax
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
            if rightAxisMax == -.greatestFiniteMagnitude
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            {
                return leftAxisMax
            }
            else
            {
<<<<<<< HEAD
                return _rightAxisMax
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
                return rightAxisMax
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
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
    /// All DataSet objects this ChartData object holds.
    @objc open var dataSets: [Element]
=======
    /// The minimum x-value the data object contains.
    @objc open var xMin: Double
    {
        return _xMin
    }
    /// The maximum x-value the data object contains.
    @objc open var xMax: Double
    {
        return _xMax
    }
    
    /// All DataSet objects this ChartData object holds.
    @objc open var dataSets: [IChartDataSet]
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
    /// All DataSet objects this ChartData object holds.
    @objc open var dataSets: [Element]
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        get
        {
            return _dataSets
        }
        set
        {
            _dataSets = newValue
            notifyDataChanged()
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
=======
    
    /// Retrieve the index of a ChartDataSet with a specific label from the ChartData. Search can be case sensitive or not.
    /// 
    /// **IMPORTANT: This method does calculations at runtime, do not over-use in performance critical situations.**
    ///
    /// - Parameters:
    ///   - dataSets: the DataSet array to search
    ///   - type:
    ///   - ignorecase: if true, the search is not case-sensitive
    /// - Returns: The index of the DataSet Object with the given label. Sensitive or not.
    internal func getDataSetIndexByLabel(_ label: String, ignorecase: Bool) -> Int
    {
        // TODO: Return nil instead of -1
        if ignorecase
        {
            return dataSets.firstIndex { $0.label?.caseInsensitiveCompare(label) == .orderedSame }
                ?? -1
        }
        else
        {
            return dataSets.firstIndex { $0.label == label }
                ?? -1
        }
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

    /// Get the Entry for a corresponding highlight object
    ///
    /// - Parameters:
    ///   - highlight:
    /// - Returns: The entry that is highlighted
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc open func entry(for highlight: Highlight) -> ChartDataEntry?
    {
        guard highlight.dataSetIndex < dataSets.endIndex else { return nil }
        return self[highlight.dataSetIndex].entryForXValue(highlight.x, closestToY: highlight.y)
=======
    @objc open func entryForHighlight(_ highlight: Highlight) -> ChartDataEntry?
    {
        if highlight.dataSetIndex >= dataSets.count
        {
            return nil
        }
        else
        {
            return dataSets[highlight.dataSetIndex].entryForXValue(highlight.x, closestToY: highlight.y)
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
    @objc open func entry(for highlight: Highlight) -> ChartDataEntry?
    {
        guard highlight.dataSetIndex < dataSets.endIndex else { return nil }
        return self[highlight.dataSetIndex].entryForXValue(highlight.x, closestToY: highlight.y)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// **IMPORTANT: This method does calculations at runtime. Use with care in performance critical situations.**
    ///
    /// - Parameters:
    ///   - label:
    ///   - ignorecase:
    /// - Returns: The DataSet Object with the given label. Sensitive or not.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc open func dataSet(forLabel label: String, ignorecase: Bool) -> Element?
    {
        guard let index = index(forLabel: label, ignoreCase: ignorecase) else { return nil }
        return self[index]
    }
    
    @objc(dataSetAtIndex:)
    open func dataSet(at index: Index) -> Element?
    {
        guard dataSets.indices.contains(index) else { return nil }
        return self[index]
    }

=======
    @objc open func getDataSetByLabel(_ label: String, ignorecase: Bool) -> IChartDataSet?
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @objc open func dataSet(forLabel label: String, ignorecase: Bool) -> Element?
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    {
        guard let index = index(forLabel: label, ignoreCase: ignorecase) else { return nil }
        return self[index]
    }
    
    @objc(dataSetAtIndex:)
    open func dataSet(at index: Index) -> Element?
    {
        guard dataSets.indices.contains(index) else { return nil }
        return self[index]
    }
<<<<<<< HEAD
=======
=======
=======
    @objc open func dataSet(forLabel label: String, ignorecase: Bool) -> Element?
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        guard let index = index(forLabel: label, ignoreCase: ignorecase) else { return nil }
        return self[index]
    }
    
    @objc(dataSetAtIndex:)
    open func dataSet(at index: Index) -> Element?
    {
        guard dataSets.indices.contains(index) else { return nil }
        return self[index]
    }
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    
    @objc open func addDataSet(_ dataSet: IChartDataSet!)
    {
        calcMinMax(dataSet: dataSet)
        
        _dataSets.append(dataSet)
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
    /// Removes the given DataSet from this data object.
    /// Also recalculates all minimum and maximum values.
    ///
    /// - Returns: `true` if a DataSet was removed, `false` ifno DataSet could be removed.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc @discardableResult open func removeDataSet(_ dataSet: Element) -> Element?
    {
        guard let index = firstIndex(where: { $0 === dataSet }) else { return nil }
        return remove(at: index)
    }

    /// Adds an Entry to the DataSet at the specified index. Entries are added to the end of the list.
    @objc(addEntry:dataSetIndex:)
    open func appendEntry(_ e: ChartDataEntry, toDataSet dataSetIndex: Index)
    {
        guard dataSets.indices.contains(dataSetIndex) else {
            return print("ChartData.addEntry() - Cannot add Entry because dataSetIndex too high or too low.", terminator: "\n")
        }

        let set = self[dataSetIndex]
        if !set.addEntry(e) { return }
        calcMinMax(entry: e, axis: set.axisDependency)
    }

    /// Removes the given Entry object from the DataSet at the specified index.
    @objc @discardableResult open func removeEntry(_ entry: ChartDataEntry, dataSetIndex: Index) -> Bool
    {
        guard dataSets.indices.contains(dataSetIndex) else { return false }

        // remove the entry from the dataset
        let removed = self[dataSetIndex].removeEntry(entry)
=======
    @objc @discardableResult open func removeDataSet(_ dataSet: IChartDataSet) -> Bool
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @objc @discardableResult open func removeDataSet(_ dataSet: Element) -> Element?
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    {
        guard let index = firstIndex(where: { $0 === dataSet }) else { return nil }
        return remove(at: index)
    }

    /// Adds an Entry to the DataSet at the specified index. Entries are added to the end of the list.
    @objc(addEntry:dataSetIndex:)
    open func appendEntry(_ e: ChartDataEntry, toDataSet dataSetIndex: Index)
    {
        guard dataSets.indices.contains(dataSetIndex) else {
            return print("ChartData.addEntry() - Cannot add Entry because dataSetIndex too high or too low.", terminator: "\n")
        }

        let set = self[dataSetIndex]
        if !set.addEntry(e) { return }
        calcMinMax(entry: e, axis: set.axisDependency)
    }

    /// Removes the given Entry object from the DataSet at the specified index.
    @objc @discardableResult open func removeEntry(_ entry: ChartDataEntry, dataSetIndex: Index) -> Bool
    {
        guard dataSets.indices.contains(dataSetIndex) else { return false }

        // remove the entry from the dataset
<<<<<<< HEAD
        let removed = _dataSets[dataSetIndex].removeEntry(entry)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
        let removed = self[dataSetIndex].removeEntry(entry)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
    @objc @discardableResult open func removeDataSet(_ dataSet: Element) -> Element?
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        guard let index = firstIndex(where: { $0 === dataSet }) else { return nil }
        return remove(at: index)
    }

    /// Adds an Entry to the DataSet at the specified index. Entries are added to the end of the list.
    @objc(addEntry:dataSetIndex:)
    open func appendEntry(_ e: ChartDataEntry, toDataSet dataSetIndex: Index)
    {
        guard dataSets.indices.contains(dataSetIndex) else {
            return print("ChartData.addEntry() - Cannot add Entry because dataSetIndex too high or too low.", terminator: "\n")
        }

        let set = self[dataSetIndex]
        if !set.addEntry(e) { return }
        calcMinMax(entry: e, axis: set.axisDependency)
    }

    /// Removes the given Entry object from the DataSet at the specified index.
    @objc @discardableResult open func removeEntry(_ entry: ChartDataEntry, dataSetIndex: Index) -> Bool
    {
        guard dataSets.indices.contains(dataSetIndex) else { return false }

        // remove the entry from the dataset
<<<<<<< HEAD
        let removed = _dataSets[dataSetIndex].removeEntry(entry)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        let removed = self[dataSetIndex].removeEntry(entry)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        
        if removed
        {
            calcMinMax()
        }
        
        return removed
    }
    
    /// Removes the Entry object closest to the given xIndex from the ChartDataSet at the
    /// specified index. 
    ///
    /// - Returns: `true` if an entry was removed, `false` ifno Entry was found that meets the specified requirements.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc @discardableResult open func removeEntry(xValue: Double, dataSetIndex: Index) -> Bool
    {
        guard
            dataSets.indices.contains(dataSetIndex),
            let entry = self[dataSetIndex].entryForXValue(xValue, closestToY: .nan)
            else { return false }

        return removeEntry(entry, dataSetIndex: dataSetIndex)
    }
    
    /// - Returns: The DataSet that contains the provided Entry, or null, if no DataSet contains this entry.
    @objc open func getDataSetForEntry(_ e: ChartDataEntry) -> Element?
    {
        return first { $0.entryForXValue(e.x, closestToY: e.y) === e }
    }

    /// - Returns: The index of the provided DataSet in the DataSet array of this data object, or -1 if it does not exist.
    @objc open func index(of dataSet: Element) -> Index
    {
        // TODO: Return nil instead of -1
        return firstIndex(where: { $0 === dataSet }) ?? -1
    }
    
    /// - Returns: The first DataSet from the datasets-array that has it's dependency on the left axis. Returns null if no DataSet with left dependency could be found.
    @objc open func getFirstLeft(dataSets: [Element]) -> Element?
    {
        return first { $0.axisDependency == .left }
    }
    
    /// - Returns: The first DataSet from the datasets-array that has it's dependency on the right axis. Returns null if no DataSet with right dependency could be found.
    @objc open func getFirstRight(dataSets: [Element]) -> Element?
    {
        return first { $0.axisDependency == .right }
    }
    
    /// - Returns: All colors used across all DataSet objects this object represents.
    @objc open var colors: [NSUIColor]
    {
        // TODO: Don't return nil
        return reduce(into: []) { $0 += $1.colors }
    }
    
    /// Sets a custom ValueFormatter for all DataSets this data object contains.
    @objc open func setValueFormatter(_ formatter: ValueFormatter)
    {
        forEach { $0.valueFormatter = formatter }
=======
    @objc @discardableResult open func removeEntry(xValue: Double, dataSetIndex: Int) -> Bool
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @objc @discardableResult open func removeEntry(xValue: Double, dataSetIndex: Index) -> Bool
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    {
        guard
            dataSets.indices.contains(dataSetIndex),
            let entry = self[dataSetIndex].entryForXValue(xValue, closestToY: .nan)
            else { return false }

        return removeEntry(entry, dataSetIndex: dataSetIndex)
    }
    
    /// - Returns: The DataSet that contains the provided Entry, or null, if no DataSet contains this entry.
    @objc open func getDataSetForEntry(_ e: ChartDataEntry) -> Element?
    {
        return first { $0.entryForXValue(e.x, closestToY: e.y) === e }
    }

    /// - Returns: The index of the provided DataSet in the DataSet array of this data object, or -1 if it does not exist.
    @objc open func index(of dataSet: Element) -> Index
    {
        // TODO: Return nil instead of -1
        return firstIndex(where: { $0 === dataSet }) ?? -1
    }
    
    /// - Returns: The first DataSet from the datasets-array that has it's dependency on the left axis. Returns null if no DataSet with left dependency could be found.
    @objc open func getFirstLeft(dataSets: [Element]) -> Element?
    {
        return first { $0.axisDependency == .left }
    }
    
    /// - Returns: The first DataSet from the datasets-array that has it's dependency on the right axis. Returns null if no DataSet with right dependency could be found.
    @objc open func getFirstRight(dataSets: [Element]) -> Element?
    {
        return first { $0.axisDependency == .right }
    }
    
    /// - Returns: All colors used across all DataSet objects this object represents.
    @objc open var colors: [NSUIColor]
    {
        // TODO: Don't return nil
        return reduce(into: []) { $0 += $1.colors }
    }
    
    /// Sets a custom ValueFormatter for all DataSets this data object contains.
    @objc open func setValueFormatter(_ formatter: ValueFormatter)
    {
<<<<<<< HEAD
        dataSets.forEach { $0.valueFormatter = formatter }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
        forEach { $0.valueFormatter = formatter }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
    @objc @discardableResult open func removeEntry(xValue: Double, dataSetIndex: Index) -> Bool
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        guard
            dataSets.indices.contains(dataSetIndex),
            let entry = self[dataSetIndex].entryForXValue(xValue, closestToY: .nan)
            else { return false }

        return removeEntry(entry, dataSetIndex: dataSetIndex)
    }
    
    /// - Returns: The DataSet that contains the provided Entry, or null, if no DataSet contains this entry.
    @objc open func getDataSetForEntry(_ e: ChartDataEntry) -> Element?
    {
        return first { $0.entryForXValue(e.x, closestToY: e.y) === e }
    }

    /// - Returns: The index of the provided DataSet in the DataSet array of this data object, or -1 if it does not exist.
    @objc open func index(of dataSet: Element) -> Index
    {
        // TODO: Return nil instead of -1
        return firstIndex(where: { $0 === dataSet }) ?? -1
    }
    
    /// - Returns: The first DataSet from the datasets-array that has it's dependency on the left axis. Returns null if no DataSet with left dependency could be found.
    @objc open func getFirstLeft(dataSets: [Element]) -> Element?
    {
        return first { $0.axisDependency == .left }
    }
    
    /// - Returns: The first DataSet from the datasets-array that has it's dependency on the right axis. Returns null if no DataSet with right dependency could be found.
    @objc open func getFirstRight(dataSets: [Element]) -> Element?
    {
        return first { $0.axisDependency == .right }
    }
    
    /// - Returns: All colors used across all DataSet objects this object represents.
    @objc open var colors: [NSUIColor]
    {
        // TODO: Don't return nil
        return reduce(into: []) { $0 += $1.colors }
    }
    
    /// Sets a custom ValueFormatter for all DataSets this data object contains.
    @objc open func setValueFormatter(_ formatter: ValueFormatter)
    {
<<<<<<< HEAD
        dataSets.forEach { $0.valueFormatter = formatter }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        forEach { $0.valueFormatter = formatter }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// Sets the color of the value-text (color in which the value-labels are drawn) for all DataSets this data object contains.
    @objc open func setValueTextColor(_ color: NSUIColor)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        forEach { $0.valueTextColor = color }
=======
        dataSets.forEach { $0.valueTextColor = color }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        forEach { $0.valueTextColor = color }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        forEach { $0.valueTextColor = color }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// Sets the font for all value-labels for all DataSets this data object contains.
    @objc open func setValueFont(_ font: NSUIFont)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        forEach { $0.valueFont = font }
=======
        dataSets.forEach { $0.valueFont = font }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        forEach { $0.valueFont = font }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        forEach { $0.valueFont = font }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }

    /// Enables / disables drawing values (value-text) for all DataSets this data object contains.
    @objc open func setDrawValues(_ enabled: Bool)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        forEach { $0.drawValuesEnabled = enabled }
=======
        dataSets.forEach { $0.drawValuesEnabled = enabled }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        forEach { $0.drawValuesEnabled = enabled }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        forEach { $0.drawValuesEnabled = enabled }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// Enables / disables highlighting values for all DataSets this data object contains.
    /// If set to true, this means that values can be highlighted programmatically or by touch gesture.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc open var isHighlightEnabled: Bool
    {
        get { return allSatisfy { $0.isHighlightEnabled } }
        set { forEach { $0.highlightEnabled = newValue } }
    }

=======
    @objc open var highlightEnabled: Bool
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @objc open var isHighlightEnabled: Bool
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    {
        get { return allSatisfy { $0.isHighlightEnabled } }
        set { forEach { $0.highlightEnabled = newValue } }
    }
<<<<<<< HEAD
=======
=======
=======
    @objc open var isHighlightEnabled: Bool
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        get { return allSatisfy { $0.isHighlightEnabled } }
        set { forEach { $0.highlightEnabled = newValue } }
    }
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    
    /// if true, value highlightning is enabled
    @objc open var isHighlightEnabled: Bool { return highlightEnabled }
    
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
    /// Clears this data object from all DataSets and removes all Entries.
    /// Don't forget to invalidate the chart after this.
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
        removeAll(keepingCapacity: false)
=======
        dataSets.removeAll(keepingCapacity: false)
        notifyDataChanged()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        removeAll(keepingCapacity: false)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        removeAll(keepingCapacity: false)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// Checks if this data object contains the specified DataSet. 
    ///
    /// - Returns: `true` if so, `false` ifnot.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc open func contains(dataSet: Element) -> Bool
    {
        return contains { $0 === dataSet }
=======
    @objc open func contains(dataSet: IChartDataSet) -> Bool
    {
        return dataSets.contains { $0 === dataSet }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
    @objc open func contains(dataSet: Element) -> Bool
    {
        return contains { $0 === dataSet }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// The total entry count across all DataSet objects this data object contains.
    @objc open var entryCount: Int
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        return reduce(0) { return $0 + $1.entryCount }
    }

    /// The DataSet object with the maximum number of entries or null if there are no DataSets.
    @objc open var maxEntryCountSet: Element?
    {
        return self.max { $0.entryCount < $1.entryCount }
    }
}

// MARK: MutableCollection
extension ChartData: MutableCollection
{
    public typealias Index = Int
    public typealias Element = ChartDataSetProtocol

    public var startIndex: Index
    {
        return dataSets.startIndex
    }

    public var endIndex: Index
    {
        return dataSets.endIndex
    }

    public func index(after: Index) -> Index
    {
        return dataSets.index(after: after)
    }

    public subscript(position: Index) -> Element
    {
        get { return dataSets[position] }
        set { self._dataSets[position] = newValue }
    }
}

// MARK: RandomAccessCollection
extension ChartData: RandomAccessCollection
{
    public func index(before: Index) -> Index
    {
        return dataSets.index(before: before)
    }
}

// TODO: Conform when dropping Objective-C support
// MARK: RangeReplaceableCollection
extension ChartData//: RangeReplaceableCollection
{
    @objc(addDataSet:)
    public func append(_ newElement: Element)
    {
        _dataSets.append(newElement)
        calcMinMax(dataSet: newElement)
    }

    @objc(removeDataSetByIndex:)
    public func remove(at position: Index) -> Element
    {
        let element = _dataSets.remove(at: position)
        calcMinMax()
        return element
    }

    public func removeFirst() -> Element
    {
        assert(!(self is CombinedChartData), "\(#function) not supported for CombinedData")

        let element = _dataSets.removeFirst()
        notifyDataChanged()
        return element
    }

    public func removeFirst(_ n: Int)
    {
        assert(!(self is CombinedChartData), "\(#function) not supported for CombinedData")

        _dataSets.removeFirst(n)
        notifyDataChanged()
    }

    public func removeLast() -> Element
    {
        assert(!(self is CombinedChartData), "\(#function) not supported for CombinedData")

        let element = _dataSets.removeLast()
        notifyDataChanged()
        return element
    }

    public func removeLast(_ n: Int)
    {
        assert(!(self is CombinedChartData), "\(#function) not supported for CombinedData")

        _dataSets.removeLast(n)
        notifyDataChanged()
    }

    public func removeSubrange<R>(_ bounds: R) where R : RangeExpression, Index == R.Bound
    {
        assert(!(self is CombinedChartData), "\(#function) not supported for CombinedData")

        _dataSets.removeSubrange(bounds)
        notifyDataChanged()
    }

    public func removeAll(keepingCapacity keepCapacity: Bool)
    {
        assert(!(self is CombinedChartData), "\(#function) not supported for CombinedData")

        _dataSets.removeAll(keepingCapacity: keepCapacity)
        notifyDataChanged()
    }

    public func replaceSubrange<C>(_ subrange: Swift.Range<Index>, with newElements: C) where C : Collection, Element == C.Element
    {
        assert(!(self is CombinedChartData), "\(#function) not supported for CombinedData")

        _dataSets.replaceSubrange(subrange, with: newElements)
        newElements.forEach { self.calcMinMax(dataSet: $0) }
    }
}

// MARK: Swift Accessors
extension ChartData
{
    /// Retrieve the index of a ChartDataSet with a specific label from the ChartData. Search can be case sensitive or not.
    /// **IMPORTANT: This method does calculations at runtime, do not over-use in performance critical situations.**
    ///
    /// - Parameters:
    ///   - label: The label to search for
    ///   - ignoreCase: if true, the search is not case-sensitive
    /// - Returns: The index of the DataSet Object with the given label. `nil` if not found
    public func index(forLabel label: String, ignoreCase: Bool) -> Index?
    {
        return ignoreCase
            ? firstIndex { $0.label?.caseInsensitiveCompare(label) == .orderedSame }
            : firstIndex { $0.label == label }
    }

    public subscript(label label: String, ignoreCase ignoreCase: Bool) -> Element?
    {
        guard let index = index(forLabel: label, ignoreCase: ignoreCase) else { return nil }
        return self[index]
    }

    public subscript(entry entry: ChartDataEntry) -> Element?
    {
        assert(!(self is CombinedChartData), "\(#function) not supported for CombinedData")

        guard let index = firstIndex(where: { $0.entryForXValue(entry.x, closestToY: entry.y) === entry }) else { return nil }
        return self[index]
    }
=======
        return _dataSets.reduce(0) { $0 + $1.entryCount }
<<<<<<< HEAD
<<<<<<< HEAD
=======
        return reduce(0) { return $0 + $1.entryCount }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    }

    /// The DataSet object with the maximum number of entries or null if there are no DataSets.
    @objc open var maxEntryCountSet: Element?
    {
        return self.max { $0.entryCount < $1.entryCount }
    }
}

// MARK: MutableCollection
extension ChartData: MutableCollection
{
    public typealias Index = Int
    public typealias Element = ChartDataSetProtocol

    public var startIndex: Index
    {
        return dataSets.startIndex
    }

    public var endIndex: Index
    {
        return dataSets.endIndex
    }

    public func index(after: Index) -> Index
    {
        return dataSets.index(after: after)
    }

<<<<<<< HEAD
=======
=======
=======
        return reduce(0) { return $0 + $1.entryCount }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }

    /// The DataSet object with the maximum number of entries or null if there are no DataSets.
    @objc open var maxEntryCountSet: Element?
    {
        return self.max { $0.entryCount < $1.entryCount }
    }
}

// MARK: MutableCollection
extension ChartData: MutableCollection
{
    public typealias Index = Int
    public typealias Element = ChartDataSetProtocol

    public var startIndex: Index
    {
        return dataSets.startIndex
    }

    public var endIndex: Index
    {
        return dataSets.endIndex
    }

    public func index(after: Index) -> Index
    {
        return dataSets.index(after: after)
    }

<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    /// When the data entry value requires a unit, use this property to append the string representation of the unit to the value
    ///
    /// For example, if a value is "44.1", setting this property to "m" allows it to be spoken as "44.1 m"
    @objc open var accessibilityEntryLabelSuffix: String?

    /// If the data entry value is a count, set this to true to allow plurals and other grammatical changes
    /// **default**: false
    @objc open var accessibilityEntryLabelSuffixIsCount: Bool = false
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
    public subscript(position: Index) -> Element
    {
        get { return dataSets[position] }
        set { self._dataSets[position] = newValue }
    }
}

// MARK: RandomAccessCollection
extension ChartData: RandomAccessCollection
{
    public func index(before: Index) -> Index
    {
        return dataSets.index(before: before)
    }
}

// TODO: Conform when dropping Objective-C support
// MARK: RangeReplaceableCollection
extension ChartData//: RangeReplaceableCollection
{
    @objc(addDataSet:)
    public func append(_ newElement: Element)
    {
        _dataSets.append(newElement)
        calcMinMax(dataSet: newElement)
    }

    @objc(removeDataSetByIndex:)
    public func remove(at position: Index) -> Element
    {
        let element = _dataSets.remove(at: position)
        calcMinMax()
        return element
    }

    public func removeFirst() -> Element
    {
        assert(!(self is CombinedChartData), "\(#function) not supported for CombinedData")

        let element = _dataSets.removeFirst()
        notifyDataChanged()
        return element
    }

    public func removeFirst(_ n: Int)
    {
        assert(!(self is CombinedChartData), "\(#function) not supported for CombinedData")

        _dataSets.removeFirst(n)
        notifyDataChanged()
    }

    public func removeLast() -> Element
    {
        assert(!(self is CombinedChartData), "\(#function) not supported for CombinedData")

        let element = _dataSets.removeLast()
        notifyDataChanged()
        return element
    }

    public func removeLast(_ n: Int)
    {
        assert(!(self is CombinedChartData), "\(#function) not supported for CombinedData")

        _dataSets.removeLast(n)
        notifyDataChanged()
    }

    public func removeSubrange<R>(_ bounds: R) where R : RangeExpression, Index == R.Bound
    {
        assert(!(self is CombinedChartData), "\(#function) not supported for CombinedData")

        _dataSets.removeSubrange(bounds)
        notifyDataChanged()
    }

    public func removeAll(keepingCapacity keepCapacity: Bool)
    {
        assert(!(self is CombinedChartData), "\(#function) not supported for CombinedData")

        _dataSets.removeAll(keepingCapacity: keepCapacity)
        notifyDataChanged()
    }

    public func replaceSubrange<C>(_ subrange: Swift.Range<Index>, with newElements: C) where C : Collection, Element == C.Element
    {
        assert(!(self is CombinedChartData), "\(#function) not supported for CombinedData")

        _dataSets.replaceSubrange(subrange, with: newElements)
        newElements.forEach { self.calcMinMax(dataSet: $0) }
    }
}

// MARK: Swift Accessors
extension ChartData
{
    /// Retrieve the index of a ChartDataSet with a specific label from the ChartData. Search can be case sensitive or not.
    /// **IMPORTANT: This method does calculations at runtime, do not over-use in performance critical situations.**
    ///
    /// - Parameters:
    ///   - label: The label to search for
    ///   - ignoreCase: if true, the search is not case-sensitive
    /// - Returns: The index of the DataSet Object with the given label. `nil` if not found
    public func index(forLabel label: String, ignoreCase: Bool) -> Index?
    {
        return ignoreCase
            ? firstIndex { $0.label?.caseInsensitiveCompare(label) == .orderedSame }
            : firstIndex { $0.label == label }
    }

    public subscript(label label: String, ignoreCase ignoreCase: Bool) -> Element?
    {
        guard let index = index(forLabel: label, ignoreCase: ignoreCase) else { return nil }
        return self[index]
    }

    public subscript(entry entry: ChartDataEntry) -> Element?
    {
        assert(!(self is CombinedChartData), "\(#function) not supported for CombinedData")

        guard let index = firstIndex(where: { $0.entryForXValue(entry.x, closestToY: entry.y) === entry }) else { return nil }
        return self[index]
    }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
}
