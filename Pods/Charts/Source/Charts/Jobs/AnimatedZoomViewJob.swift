//
//  AnimatedZoomViewJob.swift
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

open class AnimatedZoomViewJob: AnimatedViewPortJob
{
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    internal var yAxis: YAxis
=======
    internal var yAxis: YAxis?
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    internal var yAxis: YAxis
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    internal var xAxisRange: Double = 0.0
    internal var scaleX: CGFloat = 0.0
    internal var scaleY: CGFloat = 0.0
    internal var zoomOriginX: CGFloat = 0.0
    internal var zoomOriginY: CGFloat = 0.0
    internal var zoomCenterX: CGFloat = 0.0
    internal var zoomCenterY: CGFloat = 0.0

    @objc public init(
        viewPortHandler: ViewPortHandler,
        transformer: Transformer,
        view: ChartViewBase,
        yAxis: YAxis,
        xAxisRange: Double,
        scaleX: CGFloat,
        scaleY: CGFloat,
        xOrigin: CGFloat,
        yOrigin: CGFloat,
        zoomCenterX: CGFloat,
        zoomCenterY: CGFloat,
        zoomOriginX: CGFloat,
        zoomOriginY: CGFloat,
        duration: TimeInterval,
        easing: ChartEasingFunctionBlock?)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        self.yAxis = yAxis
        self.xAxisRange = xAxisRange
        self.scaleX = scaleX
        self.scaleY = scaleY
        self.zoomCenterX = zoomCenterX
        self.zoomCenterY = zoomCenterY
        self.zoomOriginX = zoomOriginX
        self.zoomOriginY = zoomOriginY

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
        super.init(viewPortHandler: viewPortHandler,
            xValue: 0.0,
            yValue: 0.0,
            transformer: transformer,
            view: view,
            xOrigin: xOrigin,
            yOrigin: yOrigin,
            duration: duration,
            easing: easing)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
        
        self.yAxis = yAxis
        self.xAxisRange = xAxisRange
        self.scaleX = scaleX
        self.scaleY = scaleY
        self.zoomCenterX = zoomCenterX
        self.zoomCenterY = zoomCenterY
        self.zoomOriginX = zoomOriginX
        self.zoomOriginY = zoomOriginY
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
    
    internal override func animationUpdate()
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
        guard
            let viewPortHandler = viewPortHandler,
            let transformer = transformer,
            let view = view
            else { return }
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let scaleX = xOrigin + (self.scaleX - xOrigin) * phase
        let scaleY = yOrigin + (self.scaleY - yOrigin) * phase
        
        var matrix = viewPortHandler.setZoom(scaleX: scaleX, scaleY: scaleY)
        viewPortHandler.refresh(newMatrix: matrix, chart: view, invalidate: false)
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let valsInView = CGFloat(yAxis.axisRange) / viewPortHandler.scaleY
=======
        let valsInView = CGFloat(yAxis?.axisRange ?? 0.0) / viewPortHandler.scaleY
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let valsInView = CGFloat(yAxis.axisRange) / viewPortHandler.scaleY
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let xsInView = CGFloat(xAxisRange) / viewPortHandler.scaleX
        
        var pt = CGPoint(
            x: zoomOriginX + ((zoomCenterX - xsInView / 2.0) - zoomOriginX) * phase,
            y: zoomOriginY + ((zoomCenterY + valsInView / 2.0) - zoomOriginY) * phase
        )
        
        transformer.pointValueToPixel(&pt)
        
        matrix = viewPortHandler.translate(pt: pt)
        viewPortHandler.refresh(newMatrix: matrix, chart: view, invalidate: true)
    }
    
    internal override func animationEnd()
    {
        (view as? BarLineChartViewBase)?.calculateOffsets()
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        view.setNeedsDisplay()
=======
        view?.setNeedsDisplay()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        view.setNeedsDisplay()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
}
