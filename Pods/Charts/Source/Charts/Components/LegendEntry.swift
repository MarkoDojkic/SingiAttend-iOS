//
//  LegendEntry.swift
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

@objc(ChartLegendEntry)
open class LegendEntry: NSObject
{
    public override init()
    {
        super.init()
    }
    
    /// - Parameters:
    ///   - label:                  The legend entry text.
    ///                                     A `nil` label will start a group.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc public init(label: String?)
    {
        self.label = label
    }

    /// The legend entry text.
    /// A `nil` label will start a group.
    @objc open var label: String?

    /// The color for drawing the label
    @objc open var labelColor: NSUIColor?

=======
    ///   - form:                   The form to draw for this entry.
    ///   - formSize:               Set to NaN to use the legend's default.
    ///   - formLineWidth:          Set to NaN to use the legend's default.
    ///   - formLineDashPhase:      Line dash configuration.
    ///   - formLineDashLengths:    Line dash configurationas NaN to use the legend's default.
    ///   - formColor:              The color for drawing the form.
    @objc public init(label: String?,
                form: Legend.Form,
                formSize: CGFloat,
                formLineWidth: CGFloat,
                formLineDashPhase: CGFloat,
                formLineDashLengths: [CGFloat]?,
                formColor: NSUIColor?)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @objc public init(label: String?)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    {
        self.label = label
    }

    /// The legend entry text.
    /// A `nil` label will start a group.
    @objc open var label: String?
<<<<<<< HEAD
    
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======

    /// The color for drawing the label
    @objc open var labelColor: NSUIColor?

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
    @objc public init(label: String?)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        self.label = label
    }

    /// The legend entry text.
    /// A `nil` label will start a group.
    @objc open var label: String?
<<<<<<< HEAD
    
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======

    /// The color for drawing the label
    @objc open var labelColor: NSUIColor?

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    /// The form to draw for this entry.
    ///
    /// `None` will avoid drawing a form, and any related space.
    /// `Empty` will avoid drawing a form, but keep its space.
    /// `Default` will use the Legend's default.
    @objc open var form: Legend.Form = .default
    
    /// Form size will be considered except for when .None is used
    ///
    /// Set as NaN to use the legend's default
    @objc open var formSize: CGFloat = CGFloat.nan
    
    /// Line width used for shapes that consist of lines.
    ///
    /// Set to NaN to use the legend's default.
    @objc open var formLineWidth: CGFloat = CGFloat.nan
    
    /// Line dash configuration for shapes that consist of lines.
    ///
    /// This is how much (in pixels) into the dash pattern are we starting from.
    ///
    /// Set to NaN to use the legend's default.
    @objc open var formLineDashPhase: CGFloat = 0.0
    
    /// Line dash configuration for shapes that consist of lines.
    ///
    /// This is the actual dash pattern.
    /// I.e. [2, 3] will paint [--   --   ]
    /// [1, 3, 4, 2] will paint [-   ----  -   ----  ]
    ///
    /// Set to nil to use the legend's default.
    @objc open var formLineDashLengths: [CGFloat]?
    
    /// The color for drawing the form
    @objc open var formColor: NSUIColor?
}
