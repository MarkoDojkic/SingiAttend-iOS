//
//  ScatterChartDataSet.swift
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
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
open class ScatterChartDataSet: LineScatterCandleRadarChartDataSet, ScatterChartDataSetProtocol
=======
open class ScatterChartDataSet: LineScatterCandleRadarChartDataSet, IScatterChartDataSet
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
open class ScatterChartDataSet: LineScatterCandleRadarChartDataSet, ScatterChartDataSetProtocol
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
{
    
    @objc(ScatterShape)
    public enum Shape: Int
    {
        case square
        case circle
        case triangle
        case cross
        case x
        case chevronUp
        case chevronDown
    }
    
    /// The size the scatter shape will have
    open var scatterShapeSize = CGFloat(10.0)
    
    /// The radius of the hole in the shape (applies to Square, Circle and Triangle)
    /// **default**: 0.0
    open var scatterShapeHoleRadius: CGFloat = 0.0
    
    /// Color for the hole in the shape. Setting to `nil` will behave as transparent.
    /// **default**: nil
    open var scatterShapeHoleColor: NSUIColor? = nil
    
    /// Sets the ScatterShape this DataSet should be drawn with.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    /// This will search for an available ShapeRenderer and set this renderer for the DataSet
=======
    /// This will search for an available IShapeRenderer and set this renderer for the DataSet
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    /// This will search for an available ShapeRenderer and set this renderer for the DataSet
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    @objc open func setScatterShape(_ shape: Shape)
    {
        self.shapeRenderer = ScatterChartDataSet.renderer(forShape: shape)
    }
    
    /// The IShapeRenderer responsible for rendering this DataSet.
    /// This can also be used to set a custom IShapeRenderer aside from the default ones.
    /// **default**: `SquareShapeRenderer`
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    open var shapeRenderer: ShapeRenderer? = SquareShapeRenderer()
    
    @objc open class func renderer(forShape shape: Shape) -> ShapeRenderer
=======
    open var shapeRenderer: IShapeRenderer? = SquareShapeRenderer()
    
    @objc open class func renderer(forShape shape: Shape) -> IShapeRenderer
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    open var shapeRenderer: ShapeRenderer? = SquareShapeRenderer()
    
    @objc open class func renderer(forShape shape: Shape) -> ShapeRenderer
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    {
        switch shape
        {
        case .square: return SquareShapeRenderer()
        case .circle: return CircleShapeRenderer()
        case .triangle: return TriangleShapeRenderer()
        case .cross: return CrossShapeRenderer()
        case .x: return XShapeRenderer()
        case .chevronUp: return ChevronUpShapeRenderer()
        case .chevronDown: return ChevronDownShapeRenderer()
        }
    }
    
    // MARK: NSCopying
    
    open override func copy(with zone: NSZone? = nil) -> Any
    {
        let copy = super.copy(with: zone) as! ScatterChartDataSet
        copy.scatterShapeSize = scatterShapeSize
        copy.scatterShapeHoleRadius = scatterShapeHoleRadius
        copy.scatterShapeHoleColor = scatterShapeHoleColor
        copy.shapeRenderer = shapeRenderer
        return copy
    }
}
