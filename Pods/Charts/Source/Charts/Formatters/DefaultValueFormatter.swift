//
//  DefaultValueFormatter.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
/// The default value formatter used for all chart components that needs a default
@objc(ChartDefaultValueFormatter)
open class DefaultValueFormatter: NSObject, ValueFormatter
=======
@objc(ChartDefaultValueFormatter)
open class DefaultValueFormatter: NSObject, IValueFormatter
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
/// The default value formatter used for all chart components that needs a default
@objc(ChartDefaultValueFormatter)
open class DefaultValueFormatter: NSObject, ValueFormatter
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
{
    public typealias Block = (
        _ value: Double,
        _ entry: ChartDataEntry,
        _ dataSetIndex: Int,
        _ viewPortHandler: ViewPortHandler?) -> String
    
    @objc open var block: Block?
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc open var hasAutoDecimals: Bool
    
    @objc open var formatter: NumberFormatter?
    {
        willSet
        {
            hasAutoDecimals = false
        }
    }
    
    open var decimals: Int?
    {
        didSet
        {
            setupDecimals(decimals: decimals)
        }
    }

    private func setupDecimals(decimals: Int?)
    {
        if let digits = decimals
        {
            formatter?.minimumFractionDigits = digits
            formatter?.maximumFractionDigits = digits
            formatter?.usesGroupingSeparator = true
=======
    @objc open var hasAutoDecimals: Bool = false
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @objc open var hasAutoDecimals: Bool
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    
    @objc open var formatter: NumberFormatter?
    {
        willSet
        {
            hasAutoDecimals = false
        }
    }
    
    open var decimals: Int?
    {
        didSet
        {
<<<<<<< HEAD
=======
=======
=======
    @objc open var hasAutoDecimals: Bool
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    
    @objc open var formatter: NumberFormatter?
    {
        willSet
        {
            hasAutoDecimals = false
        }
    }
    
    open var decimals: Int?
    {
        didSet
        {
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            _decimals = newValue
            
            if let digits = newValue
            {
                self.formatter?.minimumFractionDigits = digits
                self.formatter?.maximumFractionDigits = digits
                self.formatter?.usesGroupingSeparator = true
            }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
            setupDecimals(decimals: decimals)
        }
    }

    private func setupDecimals(decimals: Int?)
    {
        if let digits = decimals
        {
            formatter?.minimumFractionDigits = digits
            formatter?.maximumFractionDigits = digits
            formatter?.usesGroupingSeparator = true
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        }
    }
    
    public override init()
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        formatter = NumberFormatter()
        formatter?.usesGroupingSeparator = true
        decimals = 1
        hasAutoDecimals = true

        super.init()
        setupDecimals(decimals: decimals)
=======
        super.init()
        
        self.formatter = NumberFormatter()
        hasAutoDecimals = true
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        formatter = NumberFormatter()
        formatter?.usesGroupingSeparator = true
        decimals = 1
        hasAutoDecimals = true

        super.init()
        setupDecimals(decimals: decimals)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    @objc public init(formatter: NumberFormatter)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        self.formatter = formatter
        hasAutoDecimals = false

        super.init()
=======
        super.init()
        
        self.formatter = formatter
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        self.formatter = formatter
        hasAutoDecimals = false

        super.init()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    @objc public init(decimals: Int)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        formatter = NumberFormatter()
        formatter?.usesGroupingSeparator = true
        self.decimals = decimals
        hasAutoDecimals = true

        super.init()
        setupDecimals(decimals: decimals)
=======
        super.init()
        
        self.formatter = NumberFormatter()
        self.formatter?.usesGroupingSeparator = true
        self.decimals = decimals
        hasAutoDecimals = true
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        formatter = NumberFormatter()
        formatter?.usesGroupingSeparator = true
        self.decimals = decimals
        hasAutoDecimals = true

        super.init()
        setupDecimals(decimals: decimals)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    @objc public init(block: @escaping Block)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        self.block = block
        hasAutoDecimals = false

        super.init()
    }

    /// This function is deprecated - Use `init(block:)` instead.
    // DEC 11, 2017
    @available(*, deprecated, message: "Use `init(block:)` instead.")
    @objc public static func with(block: @escaping Block) -> DefaultValueFormatter
=======
        super.init()
        
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        self.block = block
        hasAutoDecimals = false

        super.init()
    }
<<<<<<< HEAD
    
    @objc public static func with(block: @escaping Block) -> DefaultValueFormatter?
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======

    /// This function is deprecated - Use `init(block:)` instead.
    // DEC 11, 2017
    @available(*, deprecated, message: "Use `init(block:)` instead.")
    @objc public static func with(block: @escaping Block) -> DefaultValueFormatter
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        self.block = block
        hasAutoDecimals = false

        super.init()
    }
<<<<<<< HEAD
    
    @objc public static func with(block: @escaping Block) -> DefaultValueFormatter?
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======

    /// This function is deprecated - Use `init(block:)` instead.
    // DEC 11, 2017
    @available(*, deprecated, message: "Use `init(block:)` instead.")
    @objc public static func with(block: @escaping Block) -> DefaultValueFormatter
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        return DefaultValueFormatter(block: block)
    }
    
    open func stringForValue(_ value: Double,
                             entry: ChartDataEntry,
                             dataSetIndex: Int,
                             viewPortHandler: ViewPortHandler?) -> String
    {
        if let block = block {
            return block(value, entry, dataSetIndex, viewPortHandler)
        } else {
            return formatter?.string(from: NSNumber(floatLiteral: value)) ?? ""
        }
    }
}
