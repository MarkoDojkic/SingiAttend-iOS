//
//  PieData.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation

open class PieChartData: ChartData
{
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    public required init()
=======
    public override init()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    public required init()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    public required init()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        super.init()
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    public override init(dataSets: [ChartDataSetProtocol])
=======
    public override init(dataSets: [IChartDataSet]?)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    public override init(dataSets: [ChartDataSetProtocol])
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    public override init(dataSets: [ChartDataSetProtocol])
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        super.init(dataSets: dataSets)
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
    public required init(arrayLiteral elements: ChartDataSetProtocol...)
    {
        super.init(dataSets: elements)
    }

    @objc public var dataSet: PieChartDataSetProtocol?
    {
        get
        {
            return dataSets.first as? PieChartDataSetProtocol
        }
        set
        {
            if let set = newValue
            {
                dataSets = [set]
            }
            else
            {
                dataSets = []
            }
        }
    }

    /// - returns: All up to one dataSet object this ChartData object holds.
    @objc open override var dataSets: [ChartDataSetProtocol]
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
    /// All DataSet objects this ChartData object holds.
    @objc open override var dataSets: [IChartDataSet]
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
    {
        get
        {
            assert(super.dataSets.count <= 1, "Found multiple data sets while pie chart only allows one")
            return super.dataSets
        }
        set
        {
            super.dataSets = newValue
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
    
    open override func dataSet(at index: ChartData.Index) -> ChartData.Element?
    {
        guard index == 0 else { return nil }
        return self[index]
    }
    
    open override func dataSet(forLabel label: String, ignorecase: Bool) -> ChartDataSetProtocol?
    {
        if dataSets.first?.label == nil
=======

    @objc var dataSet: IPieChartDataSet?
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
    
    open override func dataSet(at index: ChartData.Index) -> ChartData.Element?
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
    {
        guard index == 0 else { return nil }
        return self[index]
    }
    
    open override func dataSet(forLabel label: String, ignorecase: Bool) -> ChartDataSetProtocol?
    {
<<<<<<< HEAD
=======
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        guard index == 0 else { return nil }
        return self[index]
    }
    
    open override func dataSet(forLabel label: String, ignorecase: Bool) -> ChartDataSetProtocol?
    {
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        if index != 0
        {
            return nil
        }
        return super.getDataSetByIndex(index)
    }
    
    open override func getDataSetByLabel(_ label: String, ignorecase: Bool) -> IChartDataSet?
    {
        if dataSets.count == 0 || dataSets[0].label == nil
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        if dataSets.first?.label == nil
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        if dataSets.first?.label == nil
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        {
            return nil
        }
        
        if ignorecase
        {
            if let label = dataSets[0].label, label.caseInsensitiveCompare(label) == .orderedSame
            {
                return dataSets[0]
            }
        }
        else
        {
            if label == dataSets[0].label
            {
                return dataSets[0]
            }
        }
        return nil
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc override open func entry(for highlight: Highlight) -> ChartDataEntry?
=======
    open override func entryForHighlight(_ highlight: Highlight) -> ChartDataEntry?
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @objc override open func entry(for highlight: Highlight) -> ChartDataEntry?
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    @objc override open func entry(for highlight: Highlight) -> ChartDataEntry?
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        return dataSet?.entryForIndex(Int(highlight.x))
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
    open override func addDataSet(_ d: IChartDataSet!)
    {   
        super.addDataSet(d)
    }
    
    /// Removes the DataSet at the given index in the DataSet array from the data object.
    /// Also recalculates all minimum and maximum values.
    ///
    /// - Returns: `true` if a DataSet was removed, `false` ifno DataSet could be removed.
    open override func removeDataSetByIndex(_ index: Int) -> Bool
    {
        if index >= _dataSets.count || index < 0
        {
            return false
        }
        
        return false
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
    /// The total y-value sum across all DataSet objects the this object represents.
    @objc open var yValueSum: Double
    {
        guard let dataSet = dataSet else { return 0.0 }
        return (0..<dataSet.entryCount).reduce(into: 0) {
            $0 += dataSet.entryForIndex($1)?.y ?? 0
        }
    }
}
