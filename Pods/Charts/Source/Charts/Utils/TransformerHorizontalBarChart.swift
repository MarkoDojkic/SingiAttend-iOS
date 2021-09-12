//
//  TransformerHorizontalBarChart.swift
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

@objc(ChartTransformerHorizontalBarChart)
open class TransformerHorizontalBarChart: Transformer
{
    /// Prepares the matrix that contains all offsets.
    open override func prepareMatrixOffset(inverted: Bool)
    {
        if !inverted
        {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            matrixOffset = CGAffineTransform(translationX: viewPortHandler.offsetLeft, y: viewPortHandler.chartHeight - viewPortHandler.offsetBottom)
        }
        else
        {
            matrixOffset = CGAffineTransform(scaleX: -1.0, y: 1.0)
                .translatedBy(x: -(viewPortHandler.chartWidth - viewPortHandler.offsetRight),
                              y: viewPortHandler.chartHeight - viewPortHandler.offsetBottom)
=======
            _matrixOffset = CGAffineTransform(translationX: _viewPortHandler.offsetLeft, y: _viewPortHandler.chartHeight - _viewPortHandler.offsetBottom)
        }
        else
        {
            _matrixOffset = CGAffineTransform(scaleX: -1.0, y: 1.0)
            _matrixOffset = _matrixOffset.translatedBy(x: -(_viewPortHandler.chartWidth - _viewPortHandler.offsetRight),
                y: _viewPortHandler.chartHeight - _viewPortHandler.offsetBottom)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            matrixOffset = CGAffineTransform(translationX: viewPortHandler.offsetLeft, y: viewPortHandler.chartHeight - viewPortHandler.offsetBottom)
        }
        else
        {
            matrixOffset = CGAffineTransform(scaleX: -1.0, y: 1.0)
                .translatedBy(x: -(viewPortHandler.chartWidth - viewPortHandler.offsetRight),
                              y: viewPortHandler.chartHeight - viewPortHandler.offsetBottom)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
    }
}
