//
//  CrossShapeRenderer.swift
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
open class CrossShapeRenderer : NSObject, ShapeRenderer
{
    open func renderShape(
        context: CGContext,
        dataSet: ScatterChartDataSetProtocol,
=======
open class CrossShapeRenderer : NSObject, IShapeRenderer
{
    open func renderShape(
        context: CGContext,
        dataSet: IScatterChartDataSet,
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
open class CrossShapeRenderer : NSObject, ShapeRenderer
{
    open func renderShape(
        context: CGContext,
        dataSet: ScatterChartDataSetProtocol,
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        viewPortHandler: ViewPortHandler,
        point: CGPoint,
        color: NSUIColor)
    {
        let shapeSize = dataSet.scatterShapeSize
        let shapeHalf = shapeSize / 2.0
        
        context.setLineWidth(1.0)
        context.setStrokeColor(color.cgColor)
        
        context.beginPath()
        context.move(to: CGPoint(x: point.x - shapeHalf, y: point.y))
        context.addLine(to: CGPoint(x: point.x + shapeHalf, y: point.y))
        context.move(to: CGPoint(x: point.x, y: point.y - shapeHalf))
        context.addLine(to: CGPoint(x: point.x, y: point.y + shapeHalf))
        context.strokePath()
    }
}
