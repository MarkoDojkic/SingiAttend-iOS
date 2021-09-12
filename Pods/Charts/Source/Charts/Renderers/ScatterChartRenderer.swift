//
//  ScatterChartRenderer.swift
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

open class ScatterChartRenderer: LineScatterCandleRadarRenderer
{
    @objc open weak var dataProvider: ScatterChartDataProvider?
    
    @objc public init(dataProvider: ScatterChartDataProvider, animator: Animator, viewPortHandler: ViewPortHandler)
    {
        super.init(animator: animator, viewPortHandler: viewPortHandler)
        
        self.dataProvider = dataProvider
    }

    open override func drawData(context: CGContext)
    {
        guard let scatterData = dataProvider?.scatterData else { return }

        // If we redraw the data, remove and repopulate accessible elements to update label values and frames
        accessibleChartElements.removeAll()
        
        if let chart = dataProvider as? ScatterChartView {
            // Make the chart header the first element in the accessible elements array
            let element = createAccessibleHeader(usingChart: chart,
                                                 andData: scatterData,
                                                 withDefaultDescription: "Scatter Chart")
            accessibleChartElements.append(element)
        }

        // TODO: Due to the potential complexity of data presented in Scatter charts, a more usable way
        // for VO accessibility would be to use axis based traversal rather than by dataset.
        // Hence, accessibleChartElements is not populated below. (Individual renderers guard against dataSource being their respective views)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let sets = scatterData.dataSets as? [ScatterChartDataSet]
        assert(sets != nil, "Datasets for ScatterChartRenderer must conform to IScatterChartDataSet")
        
        let drawDataSet = { self.drawDataSet(context: context, dataSet: $0) }
        sets!.lazy
            .filter(\.isVisible)
            .forEach(drawDataSet)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
        for i in 0 ..< scatterData.dataSetCount
        {
            guard let set = scatterData.getDataSetByIndex(i) else { continue }
            
            if set.isVisible
            {
                if !(set is IScatterChartDataSet)
                {
                    fatalError("Datasets for ScatterChartRenderer must conform to IScatterChartDataSet")
                }
                
                drawDataSet(context: context, dataSet: set as! IScatterChartDataSet)
            }
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
    
    private var _lineSegments = [CGPoint](repeating: CGPoint(), count: 2)
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    @objc open func drawDataSet(context: CGContext, dataSet: ScatterChartDataSetProtocol)
=======
    @objc open func drawDataSet(context: CGContext, dataSet: IScatterChartDataSet)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    @objc open func drawDataSet(context: CGContext, dataSet: ScatterChartDataSetProtocol)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    {
        guard let dataProvider = dataProvider else { return }
        
        let trans = dataProvider.getTransformer(forAxis: dataSet.axisDependency)
        
        let phaseY = animator.phaseY
        
        let entryCount = dataSet.entryCount
        
        var point = CGPoint()
        
        let valueToPixelMatrix = trans.valueToPixelMatrix
        
        if let renderer = dataSet.shapeRenderer
        {
            context.saveGState()
            
            for j in 0 ..< Int(min(ceil(Double(entryCount) * animator.phaseX), Double(entryCount)))
            {
                guard let e = dataSet.entryForIndex(j) else { continue }
                
                point.x = CGFloat(e.x)
                point.y = CGFloat(e.y * phaseY)
                point = point.applying(valueToPixelMatrix)
                
                if !viewPortHandler.isInBoundsRight(point.x)
                {
                    break
                }
                
                if !viewPortHandler.isInBoundsLeft(point.x) ||
                    !viewPortHandler.isInBoundsY(point.y)
                {
                    continue
                }
                
                renderer.renderShape(context: context, dataSet: dataSet, viewPortHandler: viewPortHandler, point: point, color: dataSet.color(atIndex: j))
            }
            
            context.restoreGState()
        }
        else
        {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            print("There's no ShapeRenderer specified for ScatterDataSet", terminator: "\n")
=======
            print("There's no IShapeRenderer specified for ScatterDataSet", terminator: "\n")
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            print("There's no ShapeRenderer specified for ScatterDataSet", terminator: "\n")
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
    }
    
    open override func drawValues(context: CGContext)
    {
        guard
            let dataProvider = dataProvider,
            let scatterData = dataProvider.scatterData
            else { return }
        
        // if values are drawn
        if isDrawingValuesAllowed(dataProvider: dataProvider)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        {            
=======
        {
            guard let dataSets = scatterData.dataSets as? [IScatterChartDataSet] else { return }
            
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        {            
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            let phaseY = animator.phaseY
            
            var pt = CGPoint()
            
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            for i in scatterData.indices
            {
                guard let dataSet = scatterData[i] as? ScatterChartDataSetProtocol,
                      shouldDrawValues(forDataSet: dataSet)
=======
            for i in 0 ..< scatterData.dataSetCount
            {
                let dataSet = dataSets[i]
                guard let
                    formatter = dataSet.valueFormatter,
                    shouldDrawValues(forDataSet: dataSet)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            for i in scatterData.indices
            {
                guard let dataSet = scatterData[i] as? ScatterChartDataSetProtocol,
                      shouldDrawValues(forDataSet: dataSet)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                    else { continue }
                
                let valueFont = dataSet.valueFont
                
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                let formatter = dataSet.valueFormatter
                
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
                let formatter = dataSet.valueFormatter
                
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                let trans = dataProvider.getTransformer(forAxis: dataSet.axisDependency)
                let valueToPixelMatrix = trans.valueToPixelMatrix
                
                let iconsOffset = dataSet.iconsOffset
                
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                let angleRadians = dataSet.valueLabelAngle.DEG2RAD
                
=======
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
                let angleRadians = dataSet.valueLabelAngle.DEG2RAD
                
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                let shapeSize = dataSet.scatterShapeSize
                let lineHeight = valueFont.lineHeight
                
                _xBounds.set(chart: dataProvider, dataSet: dataSet, animator: animator)
                
                for j in _xBounds
                {
                    guard let e = dataSet.entryForIndex(j) else { break }
                    
                    pt.x = CGFloat(e.x)
                    pt.y = CGFloat(e.y * phaseY)
                    pt = pt.applying(valueToPixelMatrix)
                    
                    if (!viewPortHandler.isInBoundsRight(pt.x))
                    {
                        break
                    }
                    
                    // make sure the lines don't do shitty things outside bounds
                    if (!viewPortHandler.isInBoundsLeft(pt.x)
                        || !viewPortHandler.isInBoundsY(pt.y))
                    {
                        continue
                    }
                    
                    let text = formatter.stringForValue(
                        e.y,
                        entry: e,
                        dataSetIndex: i,
                        viewPortHandler: viewPortHandler)
                    
                    if dataSet.isDrawValuesEnabled
                    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                        context.drawText(text,
                                         at: CGPoint(x: pt.x,
                                                     y: pt.y - shapeSize - lineHeight),
                                         align: .center,
                                         angleRadians: angleRadians,
                                         attributes: [.font: valueFont,
                                                      .foregroundColor: dataSet.valueTextColorAt(j)]
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
                        ChartUtils.drawText(
                            context: context,
                            text: text,
                            point: CGPoint(
                                x: pt.x,
                                y: pt.y - shapeSize - lineHeight),
                            align: .center,
                            attributes: [NSAttributedString.Key.font: valueFont, NSAttributedString.Key.foregroundColor: dataSet.valueTextColorAt(j)]
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                        )
                    }
                    
                    if let icon = e.icon, dataSet.isDrawIconsEnabled
                    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                        context.drawImage(icon,
                                          atCenter: CGPoint(x: pt.x + iconsOffset.x,
                                                          y: pt.y + iconsOffset.y),
                                          size: icon.size)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
                        ChartUtils.drawImage(context: context,
                                             image: icon,
                                             x: pt.x + iconsOffset.x,
                                             y: pt.y + iconsOffset.y,
                                             size: icon.size)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                    }
                }
            }
        }
    }
    
    open override func drawExtras(context: CGContext)
    {
        
    }
    
    open override func drawHighlighted(context: CGContext, indices: [Highlight])
    {
        guard
            let dataProvider = dataProvider,
            let scatterData = dataProvider.scatterData
            else { return }
        
        context.saveGState()
        
        for high in indices
        {
            guard
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                let set = scatterData[high.dataSetIndex] as? ScatterChartDataSetProtocol,
=======
                let set = scatterData.getDataSetByIndex(high.dataSetIndex) as? IScatterChartDataSet,
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
                let set = scatterData[high.dataSetIndex] as? ScatterChartDataSetProtocol,
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                set.isHighlightEnabled
                else { continue }
            
            guard let entry = set.entryForXValue(high.x, closestToY: high.y) else { continue }
            
            if !isInBoundsX(entry: entry, dataSet: set) { continue }
            
            context.setStrokeColor(set.highlightColor.cgColor)
            context.setLineWidth(set.highlightLineWidth)
            if set.highlightLineDashLengths != nil
            {
                context.setLineDash(phase: set.highlightLineDashPhase, lengths: set.highlightLineDashLengths!)
            }
            else
            {
                context.setLineDash(phase: 0.0, lengths: [])
            }
            
            let x = entry.x // get the x-position
            let y = entry.y * Double(animator.phaseY)
            
            let trans = dataProvider.getTransformer(forAxis: set.axisDependency)
            
            let pt = trans.pixelForValues(x: x, y: y)
            
            high.setDraw(pt: pt)
            
            // draw the lines
            drawHighlightLines(context: context, point: pt, set: set)
        }
        
        context.restoreGState()
    }
}
