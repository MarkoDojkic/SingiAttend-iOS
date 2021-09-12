//
//  CombinedChartData.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation

open class CombinedChartData: BarLineScatterCandleBubbleChartData
{
    private var _lineData: LineChartData!
    private var _barData: BarChartData!
    private var _scatterData: ScatterChartData!
    private var _candleData: CandleChartData!
    private var _bubbleData: BubbleChartData!
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    public required init()
=======
    public override init()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    public required init()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    {
        super.init()
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    public override init(dataSets: [ChartDataSetProtocol])
    {
        super.init(dataSets: dataSets)
    }

    public required init(arrayLiteral elements: ChartDataSetProtocol...)
    {
        super.init(dataSets: elements)
    }
=======
    public override init(dataSets: [IChartDataSet]?)
    {
        super.init(dataSets: dataSets)
    }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    public override init(dataSets: [ChartDataSetProtocol])
    {
        super.init(dataSets: dataSets)
    }

    public required init(arrayLiteral elements: ChartDataSetProtocol...)
    {
        super.init(dataSets: elements)
    }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    
    @objc open var lineData: LineChartData!
    {
        get
        {
            return _lineData
        }
        set
        {
            _lineData = newValue
            notifyDataChanged()
        }
    }
    
    @objc open var barData: BarChartData!
    {
        get
        {
            return _barData
        }
        set
        {
            _barData = newValue
            notifyDataChanged()
        }
    }
    
    @objc open var scatterData: ScatterChartData!
    {
        get
        {
            return _scatterData
        }
        set
        {
            _scatterData = newValue
            notifyDataChanged()
        }
    }
    
    @objc open var candleData: CandleChartData!
    {
        get
        {
            return _candleData
        }
        set
        {
            _candleData = newValue
            notifyDataChanged()
        }
    }
    
    @objc open var bubbleData: BubbleChartData!
    {
        get
        {
            return _bubbleData
        }
        set
        {
            _bubbleData = newValue
            notifyDataChanged()
        }
    }
    
    open override func calcMinMax()
    {
        _dataSets.removeAll()
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        yMax = -Double.greatestFiniteMagnitude
        yMin = Double.greatestFiniteMagnitude
        xMax = -Double.greatestFiniteMagnitude
        xMin = Double.greatestFiniteMagnitude
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        
        leftAxisMax = -Double.greatestFiniteMagnitude
        leftAxisMin = Double.greatestFiniteMagnitude
        rightAxisMax = -Double.greatestFiniteMagnitude
        rightAxisMin = Double.greatestFiniteMagnitude
=======
        _yMax = -Double.greatestFiniteMagnitude
        _yMin = Double.greatestFiniteMagnitude
        _xMax = -Double.greatestFiniteMagnitude
        _xMin = Double.greatestFiniteMagnitude
        
        _leftAxisMax = -Double.greatestFiniteMagnitude
        _leftAxisMin = Double.greatestFiniteMagnitude
        _rightAxisMax = -Double.greatestFiniteMagnitude
        _rightAxisMin = Double.greatestFiniteMagnitude
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        
        leftAxisMax = -Double.greatestFiniteMagnitude
        leftAxisMin = Double.greatestFiniteMagnitude
        rightAxisMax = -Double.greatestFiniteMagnitude
        rightAxisMin = Double.greatestFiniteMagnitude
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        
        let allData = self.allData
        
        for data in allData
        {
            data.calcMinMax()
            
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            _dataSets.append(contentsOf: data)
            
            if data.yMax > yMax
            {
                yMax = data.yMax
            }
            
            if data.yMin < yMin
            {
                yMin = data.yMin
            }
            
            if data.xMax > xMax
            {
                xMax = data.xMax
            }
            
            if data.xMin < xMin
            {
                xMin = data.xMin
            }

            for set in data
            {
                if set.axisDependency == .left
                {
                    if set.yMax > leftAxisMax
                    {
                        leftAxisMax = set.yMax
                    }
                    if set.yMin < leftAxisMin
                    {
                        leftAxisMin = set.yMin
=======
            let sets = data.dataSets
            _dataSets.append(contentsOf: sets)
<<<<<<< HEAD
=======
            _dataSets.append(contentsOf: data)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
            
            if data.yMax > yMax
            {
                yMax = data.yMax
            }
            
            if data.yMin < yMin
            {
                yMin = data.yMin
            }
            
            if data.xMax > xMax
            {
                xMax = data.xMax
            }
            
            if data.xMin < xMin
            {
                xMin = data.xMin
            }

            for set in data
            {
                if set.axisDependency == .left
                {
                    if set.yMax > leftAxisMax
                    {
                        leftAxisMax = set.yMax
                    }
                    if set.yMin < leftAxisMin
                    {
<<<<<<< HEAD
                        _leftAxisMin = dataset.yMin
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
                        leftAxisMin = set.yMin
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
            
            if data.yMax > _yMax
            {
                _yMax = data.yMax
            }
            
            if data.yMin < _yMin
            {
                _yMin = data.yMin
            }
            
            if data.xMax > _xMax
            {
                _xMax = data.xMax
            }
            
            if data.xMin < _xMin
            {
                _xMin = data.xMin
            }

            for dataset in sets
            {
                if dataset.axisDependency == .left
                {
                    if dataset.yMax > _leftAxisMax
                    {
                        _leftAxisMax = dataset.yMax
                    }
                    if dataset.yMin < _leftAxisMin
                    {
                        _leftAxisMin = dataset.yMin
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
                    }
                }
                else
                {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                    if set.yMax > rightAxisMax
                    {
                        rightAxisMax = set.yMax
                    }
                    if set.yMin < rightAxisMin
                    {
                        rightAxisMin = set.yMin
=======
                    if dataset.yMax > _rightAxisMax
<<<<<<< HEAD
=======
                    if set.yMax > rightAxisMax
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
                    {
                        rightAxisMax = set.yMax
                    }
                    if set.yMin < rightAxisMin
                    {
<<<<<<< HEAD
                        _rightAxisMin = dataset.yMin
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
                        rightAxisMin = set.yMin
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
                    {
                        _rightAxisMax = dataset.yMax
                    }
                    if dataset.yMin < _rightAxisMin
                    {
                        _rightAxisMin = dataset.yMin
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
                    }
                }
            }
        }
    }
    
    /// All data objects in row: line-bar-scatter-candle-bubble if not null.
    @objc open var allData: [ChartData]
    {
        var data = [ChartData]()
        
        if lineData !== nil
        {
            data.append(lineData)
        }
        if barData !== nil
        {
            data.append(barData)
        }
        if scatterData !== nil
        {
            data.append(scatterData)
        }
        if candleData !== nil
        {
            data.append(candleData)
        }
        if bubbleData !== nil
        {
            data.append(bubbleData)
        }
        
        return data
    }
    
    @objc open func dataByIndex(_ index: Int) -> ChartData
    {
        return allData[index]
    }
    
    open func dataIndex(_ data: ChartData) -> Int?
    {
        return allData.firstIndex(of: data)
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    open override func removeDataSet(_ dataSet: ChartDataSetProtocol) -> Element?
    {
        for data in allData
        {
            if let e = data.removeDataSet(dataSet)
            {
                return e
            }
        }
        
        return nil
    }

=======
    open override func removeDataSet(_ dataSet: IChartDataSet) -> Bool
<<<<<<< HEAD
=======
    open override func removeDataSet(_ dataSet: ChartDataSetProtocol) -> Element?
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    {
        for data in allData
        {
            if let e = data.removeDataSet(dataSet)
            {
                return e
            }
        }
        
        return nil
    }
<<<<<<< HEAD
=======
    {
        return allData.contains { $0.removeDataSet(dataSet) }
    }
>>>>>>> e716a0e (Initial commit - transfer from other project)
    
    open override func removeDataSetByIndex(_ index: Int) -> Bool
    {
        print("removeDataSet(index) not supported for CombinedData", terminator: "\n")
        return false
    }
    
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    open override func removeEntry(_ entry: ChartDataEntry, dataSetIndex: Int) -> Bool
    {
        print("removeEntry(entry, dataSetIndex) not supported for CombinedData", terminator: "\n")
        return false
    }
    
    open override func removeEntry(xValue: Double, dataSetIndex: Int) -> Bool
    {
        print("removeEntry(xValue, dataSetIndex) not supported for CombinedData", terminator: "\n")
        return false
    }
    
    open override func notifyDataChanged()
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        _lineData?.notifyDataChanged()
        _barData?.notifyDataChanged()
        _scatterData?.notifyDataChanged()
        _candleData?.notifyDataChanged()
        _bubbleData?.notifyDataChanged()

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
        if _lineData !== nil
        {
            _lineData.notifyDataChanged()
        }
        if _barData !== nil
        {
            _barData.notifyDataChanged()
        }
        if _scatterData !== nil
        {
            _scatterData.notifyDataChanged()
        }
        if _candleData !== nil
        {
            _candleData.notifyDataChanged()
        }
        if _bubbleData !== nil
        {
            _bubbleData.notifyDataChanged()
        }
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        super.notifyDataChanged() // recalculate everything
    }
    
    /// Get the Entry for a corresponding highlight object
    ///
    /// - Parameters:
    ///   - highlight:
    /// - Returns: The entry that is highlighted
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    @objc override open func entry(for highlight: Highlight) -> ChartDataEntry?
    {
        // The value of the highlighted entry could be NaN - if we are not interested in highlighting a specific value.
        getDataSetByHighlight(highlight)?
            .entriesForXValue(highlight.x)
            .first { $0.y == highlight.y || highlight.y.isNaN }
=======
    open override func entryForHighlight(_ highlight: Highlight) -> ChartDataEntry?
<<<<<<< HEAD
=======
    @objc override open func entry(for highlight: Highlight) -> ChartDataEntry?
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    {
        // The value of the highlighted entry could be NaN - if we are not interested in highlighting a specific value.
<<<<<<< HEAD
        let entries = data.getDataSetByIndex(highlight.dataSetIndex).entriesForXValue(highlight.x)
        return entries.first { $0.y == highlight.y || highlight.y.isNaN }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
        getDataSetByHighlight(highlight)?
            .entriesForXValue(highlight.x)
            .first { $0.y == highlight.y || highlight.y.isNaN }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
    {
        if highlight.dataIndex >= allData.count
        {
            return nil
        }
        
        let data = dataByIndex(highlight.dataIndex)
        
        if highlight.dataSetIndex >= data.dataSetCount
        {
            return nil
        }
        
        // The value of the highlighted entry could be NaN - if we are not interested in highlighting a specific value.
        let entries = data.getDataSetByIndex(highlight.dataSetIndex).entriesForXValue(highlight.x)
        return entries.first { $0.y == highlight.y || highlight.y.isNaN }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
    
    /// Get dataset for highlight
    ///
    /// - Parameters:
    ///   - highlight: current highlight
    /// - Returns: dataset related to highlight
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    @objc open func getDataSetByHighlight(_ highlight: Highlight) -> ChartDataSetProtocol!
    {
        guard allData.indices.contains(highlight.dataIndex) else
        {
            return nil
        }

        let data = dataByIndex(highlight.dataIndex)

        guard data.indices.contains(highlight.dataSetIndex) else
        {
            return nil
        }

        // The value of the highlighted entry could be NaN - if we are not interested in highlighting a specific value.
        return data[highlight.dataSetIndex]
    }

    // MARK: Unsupported Collection Methods

    public override func append(_ newElement: ChartData.Element) {
        fatalError("append(_:) not supported for CombinedData")
    }

    public override func remove(at i: Int) -> ChartDataSetProtocol {
        fatalError("remove(at:) not supported for CombinedData")
=======
    @objc open func getDataSetByHighlight(_ highlight: Highlight) -> IChartDataSet!
    {  
        if highlight.dataIndex >= allData.count
<<<<<<< HEAD
=======
    @objc open func getDataSetByHighlight(_ highlight: Highlight) -> ChartDataSetProtocol!
    {
        guard allData.indices.contains(highlight.dataIndex) else
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        {
            return nil
        }

        let data = dataByIndex(highlight.dataIndex)

        guard data.indices.contains(highlight.dataSetIndex) else
        {
            return nil
        }
<<<<<<< HEAD
        
        return data.dataSets[highlight.dataSetIndex]
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======

        // The value of the highlighted entry could be NaN - if we are not interested in highlighting a specific value.
        return data[highlight.dataSetIndex]
    }

    // MARK: Unsupported Collection Methods

    public override func append(_ newElement: ChartData.Element) {
        fatalError("append(_:) not supported for CombinedData")
    }

    public override func remove(at i: Int) -> ChartDataSetProtocol {
        fatalError("remove(at:) not supported for CombinedData")
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
        {
            return nil
        }
        
        let data = dataByIndex(highlight.dataIndex)
        
        if highlight.dataSetIndex >= data.dataSetCount
        {
            return nil
        }
        
        return data.dataSets[highlight.dataSetIndex]
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
}
