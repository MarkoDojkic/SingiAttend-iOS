//
//  TriangleShapeRenderer.swift
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
open class TriangleShapeRenderer : NSObject, ShapeRenderer
{
    open func renderShape(
        context: CGContext,
        dataSet: ScatterChartDataSetProtocol,
=======
open class TriangleShapeRenderer : NSObject, IShapeRenderer
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
open class TriangleShapeRenderer : NSObject, ShapeRenderer
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
        let shapeHoleSizeHalf = dataSet.scatterShapeHoleRadius
        let shapeHoleSize = shapeHoleSizeHalf * 2.0
        let shapeHoleColor = dataSet.scatterShapeHoleColor
        let shapeStrokeSize = (shapeSize - shapeHoleSize) / 2.0
        
        context.setFillColor(color.cgColor)
        
        // create a triangle path
        context.beginPath()
        context.move(to: CGPoint(x: point.x, y: point.y - shapeHalf))
        context.addLine(to: CGPoint(x: point.x + shapeHalf, y: point.y + shapeHalf))
        context.addLine(to: CGPoint(x: point.x - shapeHalf, y: point.y + shapeHalf))
        
        if shapeHoleSize > 0.0
        {
            context.addLine(to: CGPoint(x: point.x, y: point.y - shapeHalf))
            
            context.move(to: CGPoint(x: point.x - shapeHalf + shapeStrokeSize, y: point.y + shapeHalf - shapeStrokeSize))
            context.addLine(to: CGPoint(x: point.x + shapeHalf - shapeStrokeSize, y: point.y + shapeHalf - shapeStrokeSize))
            context.addLine(to: CGPoint(x: point.x, y: point.y - shapeHalf + shapeStrokeSize))
            context.addLine(to: CGPoint(x: point.x - shapeHalf + shapeStrokeSize, y: point.y + shapeHalf - shapeStrokeSize))
        }
        
        context.closePath()
        
        context.fillPath()
        
        if shapeHoleSize > 0.0 && shapeHoleColor != nil
        {
            context.setFillColor(shapeHoleColor!.cgColor)
            
            // create a triangle path
            context.beginPath()
            context.move(to: CGPoint(x: point.x, y: point.y - shapeHalf + shapeStrokeSize))
            context.addLine(to: CGPoint(x: point.x + shapeHalf - shapeStrokeSize, y: point.y + shapeHalf - shapeStrokeSize))
            context.addLine(to: CGPoint(x: point.x - shapeHalf + shapeStrokeSize, y: point.y + shapeHalf - shapeStrokeSize))
            context.closePath()
            
            context.fillPath()
        }
    }
}
