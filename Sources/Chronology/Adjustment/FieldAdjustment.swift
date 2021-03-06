//
//  FieldAdjustment.swift
//  Chronology
//
//  Created by Dave DeLong on 2/19/18.
//

import Foundation


/// This is a nominal wrapper to an adjust to a single field on a CalendarValue
/// This wrapper enables syntax like "today + .days(3)"
public struct FieldAdjustment<F: CalendarValueField> {
    public let value: Int
    public let unit: Calendar.Component
    
    internal init(value: Int, unit: Calendar.Component) {
        self.value = value
        self.unit = unit
    }
}

public extension FieldAdjustment where F: YearField {
    public static func years(_ value: Int) -> FieldAdjustment { return self.init(value: value, unit: .year) }
}

public extension FieldAdjustment where F: MonthField {
    public static func months(_ value: Int) -> FieldAdjustment { return self.init(value: value, unit: .month) }
}

public extension FieldAdjustment where F: DayField {
    public static func days(_ value: Int) -> FieldAdjustment { return self.init(value: value, unit: .day) }
}

public extension FieldAdjustment where F: HourField {
    public static func hours(_ value: Int) -> FieldAdjustment { return self.init(value: value, unit: .hour) }
}

public extension FieldAdjustment where F: MinuteField {
    public static func minutes(_ value: Int) -> FieldAdjustment { return self.init(value: value, unit: .minute) }
}

public extension FieldAdjustment where F: SecondField {
    public static func seconds(_ value: Int) -> FieldAdjustment { return self.init(value: value, unit: .second) }
}

public extension FieldAdjustment where F: NanosecondField {
    public static func nanoseconds(_ value: Int) -> FieldAdjustment { return self.init(value: value, unit: .nanosecond) }
}


public func +<C: Anchored>(lhs: C, rhs: FieldAdjustment<C>) -> C {
    let adjustment = Adjustment<C, C>.add(value: rhs.value, unit: rhs.unit)
    return lhs.apply(adjustment)
}

public func -<C: Anchored>(lhs: C, rhs: FieldAdjustment<C>) -> C {
    return lhs + FieldAdjustment(value: -rhs.value, unit: rhs.unit)
}
