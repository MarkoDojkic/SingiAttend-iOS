//
//  ChartDataSet.swift
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
import Algorithms
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
import Algorithms
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
import Algorithms
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
import Foundation

/// Determines how to round DataSet index values for `ChartDataSet.entryIndex(x, rounding)` when an exact x-value is not found.
@objc
public enum ChartDataSetRounding: Int
{
    case up = 0
    case down = 1
    case closest = 2
}

/// The DataSet class represents one group or type of entries (Entry) in the Chart that belong together.
/// It is designed to logically separate different groups of values inside the Chart (e.g. the values for a specific line in the LineChart, or the values of a specific group of bars in the BarChart).
open class ChartDataSet: ChartBaseDataSet
{
    public required init()
    {
        entries = []
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        
        super.init()
    }
    
    public override convenience init(label: String)
    {
        self.init(entries: [], label: label)
    }
    
    @objc public init(entries: [ChartDataEntry], label: String)
    {
        self.entries = entries 
=======

<<<<<<< HEAD
=======
        
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        super.init()
    }
    
    public override convenience init(label: String)
    {
        self.init(entries: [], label: label)
    }
    
    @objc public init(entries: [ChartDataEntry], label: String)
    {
<<<<<<< HEAD
        self.entries = entries ?? []
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
        self.entries = entries 
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
        super.init()
    }
    
    public override convenience init(label: String?)
    {
        self.init(entries: nil, label: label)
    }
    
    @objc public init(entries: [ChartDataEntry]?, label: String?)
    {
        self.entries = entries ?? []
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)

        super.init(label: label)

        self.calcMinMax()
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    @objc public convenience init(entries: [ChartDataEntry])
=======
    @objc public convenience init(entries: [ChartDataEntry]?)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    @objc public convenience init(entries: [ChartDataEntry])
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    {
        self.init(entries: entries, label: "DataSet")
    }
    
    // MARK: - Data functions and accessors

    /// - Note: Calls `notifyDataSetChanged()` after setting a new value.
    /// - Returns: The array of y-values that this DataSet represents.
    /// the entries that this dataset represents / holds together
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
    @available(*, unavailable, renamed: "entries")
    @objc
    open var values: [ChartDataEntry] { return entries }

>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    @objc
    open private(set) var entries: [ChartDataEntry]

    /// Used to replace all entries of a data set while retaining styling properties.
    /// This is a separate method from a setter on `entries` to encourage usage
    /// of `Collection` conformances.
    ///
    /// - Parameter entries: new entries to replace existing entries in the dataset
    @objc
    public func replaceEntries(_ entries: [ChartDataEntry]) {
        self.entries = entries
        notifyDataSetChanged()
    }

    /// maximum y-value in the value array
    internal var _yMax: Double = -Double.greatestFiniteMagnitude
    
    /// minimum y-value in the value array
    internal var _yMin: Double = Double.greatestFiniteMagnitude
    
    /// maximum x-value in the value array
    internal var _xMax: Double = -Double.greatestFiniteMagnitude
    
    /// minimum x-value in the value array
    internal var _xMin: Double = Double.greatestFiniteMagnitude
    
    open override func calcMinMax()
    {
        _yMax = -Double.greatestFiniteMagnitude
        _yMin = Double.greatestFiniteMagnitude
        _xMax = -Double.greatestFiniteMagnitude
        _xMin = Double.greatestFiniteMagnitude

        guard !isEmpty else { return }

        forEach(calcMinMax)
    }
    
    open override func calcMinMaxY(fromX: Double, toX: Double)
    {
        _yMax = -Double.greatestFiniteMagnitude
        _yMin = Double.greatestFiniteMagnitude

        guard !isEmpty else { return }
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let indexFrom = entryIndex(x: fromX, closestToY: .nan, rounding: .closest)
        var indexTo = entryIndex(x: toX, closestToY: .nan, rounding: .up)
        if indexTo == -1 { indexTo = entryIndex(x: toX, closestToY: .nan, rounding: .closest) }
        
        guard indexTo >= indexFrom else { return }
=======
        let indexFrom = entryIndex(x: fromX, closestToY: Double.nan, rounding: .down)
        let indexTo = entryIndex(x: toX, closestToY: Double.nan, rounding: .up)
        
        guard !(indexTo < indexFrom) else { return }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let indexFrom = entryIndex(x: fromX, closestToY: .nan, rounding: .closest)
        var indexTo = entryIndex(x: toX, closestToY: .nan, rounding: .up)
        if indexTo == -1 { indexTo = entryIndex(x: toX, closestToY: .nan, rounding: .closest) }
        
        guard indexTo >= indexFrom else { return }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        // only recalculate y
        self[indexFrom...indexTo].forEach(calcMinMaxY)
    }
    
    @objc open func calcMinMaxX(entry e: ChartDataEntry)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        _xMin = Swift.min(e.x, _xMin)
        _xMax = Swift.max(e.x, _xMax)
=======
        if e.x < _xMin
        {
            _xMin = e.x
        }
        if e.x > _xMax
        {
            _xMax = e.x
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        _xMin = Swift.min(e.x, _xMin)
        _xMax = Swift.max(e.x, _xMax)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
    
    @objc open func calcMinMaxY(entry e: ChartDataEntry)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        _yMin = Swift.min(e.y, _yMin)
        _yMax = Swift.max(e.y, _yMax)
=======
        if e.y < _yMin
        {
            _yMin = e.y
        }
        if e.y > _yMax
        {
            _yMax = e.y
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        _yMin = Swift.min(e.y, _yMin)
        _yMax = Swift.max(e.y, _yMax)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
    
    /// Updates the min and max x and y value of this DataSet based on the given Entry.
    ///
    /// - Parameters:
    ///   - e:
    internal func calcMinMax(entry e: ChartDataEntry)
    {
        calcMinMaxX(entry: e)
        calcMinMaxY(entry: e)
    }
    
    /// The minimum y-value this DataSet holds
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    @objc open override var yMin: Double { return _yMin }
    
    /// The maximum y-value this DataSet holds
    @objc open override var yMax: Double { return _yMax }
    
    /// The minimum x-value this DataSet holds
    @objc open override var xMin: Double { return _xMin }
    
    /// The maximum x-value this DataSet holds
    @objc open override var xMax: Double { return _xMax }
=======
    open override var yMin: Double { return _yMin }
<<<<<<< HEAD
=======
    @objc open override var yMin: Double { return _yMin }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    
    /// The maximum y-value this DataSet holds
    @objc open override var yMax: Double { return _yMax }
    
    /// The minimum x-value this DataSet holds
    @objc open override var xMin: Double { return _xMin }
    
    /// The maximum x-value this DataSet holds
<<<<<<< HEAD
    open override var xMax: Double { return _xMax }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
    @objc open override var xMax: Double { return _xMax }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
    
    /// The maximum y-value this DataSet holds
    open override var yMax: Double { return _yMax }
    
    /// The minimum x-value this DataSet holds
    open override var xMin: Double { return _xMin }
    
    /// The maximum x-value this DataSet holds
    open override var xMax: Double { return _xMax }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
    
    /// The number of y-values this DataSet represents
    @available(*, deprecated, message: "Use `count` instead")
    open override var entryCount: Int { return count }
    
    /// - Throws: out of bounds
    /// if `i` is out of bounds, it may throw an out-of-bounds exception
    /// - Returns: The entry object found at the given index (not x-value!)
    @available(*, deprecated, message: "Use `subscript(index:)` instead.")
    open override func entryForIndex(_ i: Int) -> ChartDataEntry?
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        guard indices.contains(i) else {
=======
        guard i >= startIndex, i < endIndex else {
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        guard indices.contains(i) else {
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            return nil
        }
        return self[i]
    }
    
    /// - Parameters:
    ///   - xValue: the x-value
    ///   - closestToY: If there are multiple y-values for the specified x-value,
    ///   - rounding: determine whether to round up/down/closest if there is no Entry matching the provided x-value
    /// - Returns: The first Entry object found at the given x-value with binary search.
    /// If the no Entry at the specified x-value is found, this method returns the Entry at the closest x-value according to the rounding.
    /// nil if no Entry object at that x-value.
    open override func entryForXValue(
        _ xValue: Double,
        closestToY yValue: Double,
        rounding: ChartDataSetRounding) -> ChartDataEntry?
    {
        let index = entryIndex(x: xValue, closestToY: yValue, rounding: rounding)
        if index > -1
        {
            return self[index]
        }
        return nil
    }
    
    /// - Parameters:
    ///   - xValue: the x-value
    ///   - closestToY: If there are multiple y-values for the specified x-value,
    /// - Returns: The first Entry object found at the given x-value with binary search.
    /// If the no Entry at the specified x-value is found, this method returns the Entry at the closest x-value.
    /// nil if no Entry object at that x-value.
    open override func entryForXValue(
        _ xValue: Double,
        closestToY yValue: Double) -> ChartDataEntry?
    {
        return entryForXValue(xValue, closestToY: yValue, rounding: .closest)
    }
    
    /// - Returns: All Entry objects found at the given xIndex with binary search.
    /// An empty array if no Entry object at that index.
    open override func entriesForXValue(_ xValue: Double) -> [ChartDataEntry]
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let match: (ChartDataEntry) -> Bool = { $0.x == xValue }
        var partitioned = self.entries
        _ = partitioned.partition(by: match)
        let i = partitioned.partitioningIndex(where: match)
        guard i < endIndex else { return [] }
        return partitioned[i...].prefix(while: match)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
        var entries = [ChartDataEntry]()
        
        var low = startIndex
        var high = endIndex - 1
        
        while low <= high
        {
            var m = (high + low) / 2
            var entry = self[m]
            
            // if we have a match
            if xValue == entry.x
            {
                while m > 0 && self[m - 1].x == xValue
                {
                    m -= 1
                }
                
                high = endIndex
                
                // loop over all "equal" entries
                while m < high
                {
                    entry = self[m]
                    if entry.x == xValue
                    {
                        entries.append(entry)
                    }
                    else
                    {
                        break
                    }
                    
                    m += 1
                }
                
                break
            }
            else
            {
                if xValue > entry.x
                {
                    low = m + 1
                }
                else
                {
                    high = m - 1
                }
            }
        }
        
        return entries
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
    
    /// - Parameters:
    ///   - xValue: x-value of the entry to search for
    ///   - closestToY: If there are multiple y-values for the specified x-value,
    ///   - rounding: Rounding method if exact value was not found
    /// - Returns: The array-index of the specified entry.
    /// If the no Entry at the specified x-value is found, this method returns the index of the Entry at the closest x-value according to the rounding.
    open override func entryIndex(
        x xValue: Double,
        closestToY yValue: Double,
        rounding: ChartDataSetRounding) -> Int
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        var closest = partitioningIndex { $0.x >= xValue }
        guard closest < endIndex else { return index(before: endIndex) }

        var closestXValue = self[closest].x

        switch rounding {
        case .up:
            // If rounding up, and found x-value is lower than specified x, and we can go upper...
            if closestXValue < xValue && closest < index(before: endIndex)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            {
                formIndex(after: &closest)
            }

        case .down:
            // If rounding down, and found x-value is upper than specified x, and we can go lower...
            if closestXValue > xValue && closest > startIndex
            {
                formIndex(before: &closest)
            }

        case .closest:
            // The closest value in the beginning of this function
            // `var closest = partitioningIndex { $0.x >= xValue }`
            // doesn't guarantee closest rounding method
            if closest > startIndex {
                let distanceAfter = abs(self[closest].x - xValue)
                let distanceBefore = abs(self[index(before: closest)].x - xValue)
                if distanceBefore < distanceAfter
                {
                    closest = index(before: closest)
                }
                closestXValue = self[closest].x
            }
        }

        // Search by closest to y-value
        if !yValue.isNaN
        {
            while closest > startIndex && self[index(before: closest)].x == closestXValue
            {
                formIndex(before: &closest)
            }

            var closestYValue = self[closest].y
            var closestYIndex = closest

            while closest < index(before: endIndex)
            {
                formIndex(after: &closest)
                let value = self[closest]

                if value.x != closestXValue { break }
                if abs(value.y - yValue) <= abs(closestYValue - yValue)
                {
                    closestYValue = yValue
                    closestYIndex = closest
                }
            }

            closest = closestYIndex
=======
        var low = startIndex
        var high = endIndex - 1
        var closest = high
        
        while low < high
        {
            let m = (low + high) / 2
            
            let d1 = self[m].x - xValue
            let d2 = self[m + 1].x - xValue
            let ad1 = abs(d1), ad2 = abs(d2)
            
            if ad2 < ad1
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
            {
                formIndex(after: &closest)
            }

        case .down:
            // If rounding down, and found x-value is upper than specified x, and we can go lower...
            if closestXValue > xValue && closest > startIndex
            {
                formIndex(before: &closest)
            }

        case .closest:
            // The closest value in the beginning of this function
            // `var closest = partitioningIndex { $0.x >= xValue }`
            // doesn't guarantee closest rounding method
            if closest > startIndex {
                let distanceAfter = abs(self[closest].x - xValue)
                let distanceBefore = abs(self[index(before: closest)].x - xValue)
                if distanceBefore < distanceAfter
                {
                    closest = index(before: closest)
                }
                closestXValue = self[closest].x
            }
        }

        // Search by closest to y-value
        if !yValue.isNaN
        {
            while closest > startIndex && self[index(before: closest)].x == closestXValue
            {
                formIndex(before: &closest)
            }

            var closestYValue = self[closest].y
            var closestYIndex = closest

            while closest < index(before: endIndex)
            {
                formIndex(after: &closest)
                let value = self[closest]

                if value.x != closestXValue { break }
                if abs(value.y - yValue) <= abs(closestYValue - yValue)
                {
                    closestYValue = yValue
                    closestYIndex = closest
                }
            }
<<<<<<< HEAD
=======
            {
                // [m + 1] is closer to xValue
                // Search in an higher place
                low = m + 1
            }
            else if ad1 < ad2
            {
                // [m] is closer to xValue
                // Search in a lower place
                high = m
            }
            else
            {
                // We have multiple sequential x-value with same distance
                
                if d1 >= 0.0
                {
                    // Search in a lower place
                    high = m
                }
                else if d1 < 0.0
                {
                    // Search in an higher place
                    low = m + 1
                }
            }
            
            closest = high
        }
        
        if closest != -1
        {
            let closestXValue = self[closest].x
            
            if rounding == .up
            {
                // If rounding up, and found x-value is lower than specified x, and we can go upper...
                if closestXValue < xValue && closest < endIndex - 1
                {
                    closest += 1
                }
            }
>>>>>>> e716a0e (Initial commit - transfer from other project)
            else if rounding == .down
            {
                // If rounding down, and found x-value is upper than specified x, and we can go lower...
                if closestXValue > xValue && closest > 0
                {
                    closest -= 1
                }
            }
            
            // Search by closest to y-value
            if !yValue.isNaN
            {
                while closest > 0 && self[closest - 1].x == closestXValue
                {
                    closest -= 1
                }
                
                var closestYValue = self[closest].y
                var closestYIndex = closest
                
                while true
                {
                    closest += 1
                    if closest >= endIndex { break }
                    
                    let value = self[closest]
                    
                    if value.x != closestXValue { break }
                    if abs(value.y - yValue) <= abs(closestYValue - yValue)
                    {
                        closestYValue = yValue
                        closestYIndex = closest
                    }
                }
                
                closest = closestYIndex
            }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======

            closest = closestYIndex
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
        
        return closest
    }
    
    /// - Parameters:
    ///   - e: the entry to search for
    /// - Returns: The array-index of the specified entry
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    // TODO: Should be returning `nil` to follow Swift convention
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
    // TODO: Should be returning `nil` to follow Swift convention
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
    // TODO: Should be returning `nil` to follow Swift convention
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
    @available(*, deprecated, message: "Use `firstIndex(of:)` or `lastIndex(of:)`")
    open override func entryIndex(entry e: ChartDataEntry) -> Int
    {
        return firstIndex(of: e) ?? -1
    }
    
    /// Adds an Entry to the DataSet dynamically.
    /// Entries are added to the end of the list.
    /// This will also recalculate the current minimum and maximum values of the DataSet and the value-sum.
    ///
    /// - Parameters:
    ///   - e: the entry to add
    /// - Returns: True
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    // TODO: This should return `Void` to follow Swift convention
    @available(*, deprecated, message: "Use `append(_:)` instead", renamed: "append(_:)")
=======
    @available(*, deprecated, message: "Use `append(_:)` instead")
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    // TODO: This should return `Void` to follow Swift convention
    @available(*, deprecated, message: "Use `append(_:)` instead", renamed: "append(_:)")
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    open override func addEntry(_ e: ChartDataEntry) -> Bool
    {
        append(e)
        return true
    }
    
    /// Adds an Entry to the DataSet dynamically.
    /// Entries are added to their appropriate index respective to it's x-index.
    /// This will also recalculate the current minimum and maximum values of the DataSet and the value-sum.
    ///
    /// - Parameters:
    ///   - e: the entry to add
    /// - Returns: True
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    // TODO: This should return `Void` to follow Swift convention
    open override func addEntryOrdered(_ e: ChartDataEntry) -> Bool
    {
        if let last = last, last.x > e.x
        {
            let startIndex = entryIndex(x: e.x, closestToY: e.y, rounding: .up)
            let closestIndex = self[startIndex...].lastIndex { $0.x < e.x }
                ?? startIndex
            calcMinMax(entry: e)
=======
<<<<<<< HEAD
=======
    // TODO: This should return `Void` to follow Swift convention
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    open override func addEntryOrdered(_ e: ChartDataEntry) -> Bool
    {
        if let last = last, last.x > e.x
        {
<<<<<<< HEAD
=======
    open override func addEntryOrdered(_ e: ChartDataEntry) -> Bool
    {
        calcMinMax(entry: e)
        
        if let last = last, last.x > e.x
        {
>>>>>>> e716a0e (Initial commit - transfer from other project)
            var closestIndex = entryIndex(x: e.x, closestToY: e.y, rounding: .up)
            while self[closestIndex].x < e.x
            {
                closestIndex += 1
            }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            let startIndex = entryIndex(x: e.x, closestToY: e.y, rounding: .up)
            let closestIndex = self[startIndex...].lastIndex { $0.x < e.x }
                ?? startIndex
            calcMinMax(entry: e)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            entries.insert(e, at: closestIndex)
        }
        else
        {
            append(e)
        }
        
        return true
    }
    
    @available(*, renamed: "remove(_:)")
    open override func removeEntry(_ entry: ChartDataEntry) -> Bool
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        remove(entry)
=======
        return remove(entry)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        remove(entry)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }

    /// Removes an Entry from the DataSet dynamically.
    /// This will also recalculate the current minimum and maximum values of the DataSet and the value-sum.
    ///
    /// - Parameters:
    ///   - entry: the entry to remove
    /// - Returns: `true` if the entry was removed successfully, else if the entry does not exist
    open func remove(_ entry: ChartDataEntry) -> Bool
    {
        guard let index = firstIndex(of: entry) else { return false }
        _ = remove(at: index)
        return true
    }

    /// Removes the first Entry (at index 0) of this DataSet from the entries array.
    ///
    /// - Returns: `true` if successful, `false` if not.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    // TODO: This should return the removed entry to follow Swift convention.
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
    // TODO: This should return the removed entry to follow Swift convention.
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
    // TODO: This should return the removed entry to follow Swift convention.
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
    @available(*, deprecated, message: "Use `func removeFirst() -> ChartDataEntry` instead.")
    open override func removeFirst() -> Bool
    {
        let entry: ChartDataEntry? = isEmpty ? nil : removeFirst()
        return entry != nil
    }
    
    /// Removes the last Entry (at index size-1) of this DataSet from the entries array.
    ///
    /// - Returns: `true` if successful, `false` if not.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    // TODO: This should return the removed entry to follow Swift convention.
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
    // TODO: This should return the removed entry to follow Swift convention.
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
    // TODO: This should return the removed entry to follow Swift convention.
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
    @available(*, deprecated, message: "Use `func removeLast() -> ChartDataEntry` instead.")
    open override func removeLast() -> Bool
    {
        let entry: ChartDataEntry? = isEmpty ? nil : removeLast()
        return entry != nil
    }

    /// Removes all values from this DataSet and recalculates min and max value.
    @available(*, deprecated, message: "Use `removeAll(keepingCapacity:)` instead.")
    open override func clear()
    {
        removeAll(keepingCapacity: true)
    }
    
    // MARK: - Data functions and accessors
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    
=======

>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    // MARK: - NSCopying
    
    open override func copy(with zone: NSZone? = nil) -> Any
    {
        let copy = super.copy(with: zone) as! ChartDataSet
        
        copy.entries = entries
        copy._yMax = _yMax
        copy._yMin = _yMin
        copy._xMax = _xMax
        copy._xMin = _xMin

        return copy
    }
}

// MARK: MutableCollection
extension ChartDataSet: MutableCollection {
    public typealias Index = Int
    public typealias Element = ChartDataEntry

    public var startIndex: Index {
        return entries.startIndex
    }

    public var endIndex: Index {
        return entries.endIndex
    }

    public func index(after: Index) -> Index {
        return entries.index(after: after)
    }

    @objc
    public subscript(position: Index) -> Element {
        get {
            // This is intentionally not a safe subscript to mirror
            // the behaviour of the built in Swift Collection Types
            return entries[position]
        }
        set {
            calcMinMax(entry: newValue)
            entries[position] = newValue
        }
    }
}

// MARK: RandomAccessCollection
extension ChartDataSet: RandomAccessCollection {
    public func index(before: Index) -> Index {
        return entries.index(before: before)
    }
}

// MARK: RangeReplaceableCollection
extension ChartDataSet: RangeReplaceableCollection {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    public func replaceSubrange<C>(_ subrange: Swift.Range<Index>, with newElements: C) where C : Collection, Element == C.Element {
        entries.replaceSubrange(subrange, with: newElements)
        notifyDataSetChanged()
    }
    
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
    public func append(_ newElement: Element) {
        calcMinMax(entry: newElement)
        entries.append(newElement)
    }

    public func remove(at position: Index) -> Element {
        let element = entries.remove(at: position)
        notifyDataSetChanged()
        return element
    }

    public func removeFirst() -> Element {
        let element = entries.removeFirst()
        notifyDataSetChanged()
        return element
    }

    public func removeFirst(_ n: Int) {
        entries.removeFirst(n)
        notifyDataSetChanged()
    }

    public func removeLast() -> Element {
        let element = entries.removeLast()
        notifyDataSetChanged()
        return element
    }

    public func removeLast(_ n: Int) {
        entries.removeLast(n)
        notifyDataSetChanged()
    }

    public func removeSubrange<R>(_ bounds: R) where R : RangeExpression, Index == R.Bound {
        entries.removeSubrange(bounds)
        notifyDataSetChanged()
    }

    @objc
    public func removeAll(keepingCapacity keepCapacity: Bool) {
        entries.removeAll(keepingCapacity: keepCapacity)
        notifyDataSetChanged()
    }
}
