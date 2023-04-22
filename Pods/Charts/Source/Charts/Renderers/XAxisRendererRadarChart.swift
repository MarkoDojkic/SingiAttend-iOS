//
//  XAxisRendererRadarChart.swift
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

open class XAxisRendererRadarChart: XAxisRenderer
{
    @objc open weak var chart: RadarChartView?
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc public init(viewPortHandler: ViewPortHandler, axis: XAxis, chart: RadarChartView)
    {
        super.init(viewPortHandler: viewPortHandler, axis: axis, transformer: nil)
=======
    @objc public init(viewPortHandler: ViewPortHandler, xAxis: XAxis?, chart: RadarChartView)
    {
        super.init(viewPortHandler: viewPortHandler, xAxis: xAxis, transformer: nil)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
    @objc public init(viewPortHandler: ViewPortHandler, axis: XAxis, chart: RadarChartView)
    {
        super.init(viewPortHandler: viewPortHandler, axis: axis, transformer: nil)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        
        self.chart = chart
    }
    
    open override func renderAxisLabels(context: CGContext)
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
        guard
            let chart = chart,
            axis.isEnabled,
            axis.isDrawLabelsEnabled
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            else { return }

        let labelFont = axis.labelFont
        let labelTextColor = axis.labelTextColor
        let labelRotationAngleRadians = axis.labelRotationAngle.RAD2DEG
=======
        guard let
            xAxis = axis as? XAxis,
            let chart = chart
            else { return }
        
        if !xAxis.isEnabled || !xAxis.isDrawLabelsEnabled
        {
            return
        }
        
        let labelFont = xAxis.labelFont
        let labelTextColor = xAxis.labelTextColor
        let labelRotationAngleRadians = xAxis.labelRotationAngle.RAD2DEG
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
            else { return }

        let labelFont = axis.labelFont
        let labelTextColor = axis.labelTextColor
        let labelRotationAngleRadians = axis.labelRotationAngle.RAD2DEG
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        let drawLabelAnchor = CGPoint(x: 0.5, y: 0.25)
        
        let sliceangle = chart.sliceAngle
        
        // calculate the factor that is needed for transforming the value to pixels
        let factor = chart.factor
        
        let center = chart.centerOffsets
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        for i in 0..<(chart.data?.maxEntryCountSet?.entryCount ?? 0)
        {
            let label = axis.valueFormatter?.stringForValue(Double(i), axis: axis) ?? ""
            let angle = (sliceangle * CGFloat(i) + chart.rotationAngle).truncatingRemainder(dividingBy: 360.0)
            let p = center.moving(distance: CGFloat(chart.yRange) * factor + axis.labelRotatedWidth / 2.0, atAngle: angle)

            drawLabel(context: context,
                      formattedLabel: label,
                      x: p.x,
                      y: p.y - axis.labelRotatedHeight / 2.0,
                      attributes: [.font: labelFont, .foregroundColor: labelTextColor],
=======
        for i in stride(from: 0, to: chart.data?.maxEntryCountSet?.entryCount ?? 0, by: 1)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        for i in 0..<(chart.data?.maxEntryCountSet?.entryCount ?? 0)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        {
            let label = axis.valueFormatter?.stringForValue(Double(i), axis: axis) ?? ""
            let angle = (sliceangle * CGFloat(i) + chart.rotationAngle).truncatingRemainder(dividingBy: 360.0)
            let p = center.moving(distance: CGFloat(chart.yRange) * factor + axis.labelRotatedWidth / 2.0, atAngle: angle)

            drawLabel(context: context,
                      formattedLabel: label,
                      x: p.x,
<<<<<<< HEAD
                      y: p.y - xAxis.labelRotatedHeight / 2.0,
                      attributes: [NSAttributedString.Key.font: labelFont, NSAttributedString.Key.foregroundColor: labelTextColor],
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
                      y: p.y - axis.labelRotatedHeight / 2.0,
                      attributes: [.font: labelFont, .foregroundColor: labelTextColor],
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
        for i in 0..<(chart.data?.maxEntryCountSet?.entryCount ?? 0)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        {
            let label = axis.valueFormatter?.stringForValue(Double(i), axis: axis) ?? ""
            let angle = (sliceangle * CGFloat(i) + chart.rotationAngle).truncatingRemainder(dividingBy: 360.0)
            let p = center.moving(distance: CGFloat(chart.yRange) * factor + axis.labelRotatedWidth / 2.0, atAngle: angle)

            drawLabel(context: context,
                      formattedLabel: label,
                      x: p.x,
<<<<<<< HEAD
                      y: p.y - xAxis.labelRotatedHeight / 2.0,
                      attributes: [NSAttributedString.Key.font: labelFont, NSAttributedString.Key.foregroundColor: labelTextColor],
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
                      y: p.y - axis.labelRotatedHeight / 2.0,
                      attributes: [.font: labelFont, .foregroundColor: labelTextColor],
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
                      anchor: drawLabelAnchor,
                      angleRadians: labelRotationAngleRadians)
        }
    }
    
    @objc open func drawLabel(
        context: CGContext,
        formattedLabel: String,
        x: CGFloat,
        y: CGFloat,
        attributes: [NSAttributedString.Key : Any],
        anchor: CGPoint,
        angleRadians: CGFloat)
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
        context.drawText(formattedLabel,
                         at: CGPoint(x: x, y: y),
                         anchor: anchor,
                         angleRadians: angleRadians,
                         attributes: attributes)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        ChartUtils.drawText(
            context: context,
            text: formattedLabel,
            point: CGPoint(x: x, y: y),
            attributes: attributes,
            anchor: anchor,
            angleRadians: angleRadians)
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
    }
    
    open override func renderLimitLines(context: CGContext)
    {
        /// XAxis LimitLines on RadarChart not yet supported.
    }
}
