//
//  testInterop.swift
//
// SPDX-License-Identifier: Apache-2.0
// Copyright Contributors to the OpenTimelineIO project

import Testing
@testable import OpenTimelineIO

import Foundation

public typealias ot = opentime.v1_0
public typealias otio = opentimelineio.v1_0

// dumb tests, remove these.
@Suite("Swift/C++ Interop")
struct InteropTests {
    @Test("Rational time equality checks", arguments: [
        (18, 24),
        (1, 24),
        (5, 24),
    ])
    func testInterop(value: Double, rate: Double) {
        let start_time = ot.RationalTime(value, rate)
        let duration = ot.RationalTime(value / 2, rate)
        
        let tr1 = ot.TimeRange(start_time, duration)
        let tr2 = ot.TimeRange(start_time, duration)
        
        #expect(tr1 == tr2)
    }
}
