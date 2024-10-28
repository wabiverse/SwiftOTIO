//
//  testInterop.swift
//
// SPDX-License-Identifier: Apache-2.0
// Copyright Contributors to the OpenTimelineIO project

import Testing
@testable import OpenTimelineIO

import Foundation

// dumb tests, remove these.
@Suite("Swift/C++ Interop")
struct InteropTests {
    @Test("Rational time equality checks", arguments: [
        (18, 24),
        (1, 24),
        (5, 24),
    ])
    func testInterop(value: Double, rate: Double) {
        let start_time = opentime.v1_0.RationalTime(value, rate)
        let duration = opentime.v1_0.RationalTime(value / 2, rate)
        
        let tr1 = opentime.v1_0.TimeRange(start_time, duration)
        let tr2 = opentime.v1_0.TimeRange(start_time, duration)

        #expect(tr1 == tr2)
    }

    @Test("Item creation and name property", arguments: [
        "hello item",
        "example item",
        "otio item",
    ])
    func testTrack(name: String)
    {
        let item = otio.otio_new_item()

        #expect(item != nil)

        item?.set_name(std.string(name))

        #expect(item?.name() == std.string(name))
    }
}
