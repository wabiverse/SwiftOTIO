// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
// SPDX-License-Identifier: Apache-2.0
// Copyright Contributors to the OpenTimelineIO project

import PackageDescription

let package = Package(
    name: "OpenTimelineIO",
    platforms: [
      .macOS(.v14),
      .visionOS(.v1),
      .iOS(.v17),
      .tvOS(.v17),
      .watchOS(.v10),
    ],
    products: [
        .library(name: "Imath", targets: ["ImathConfig", "Imath"]),
        .library(name: "rapidjson", targets: ["rapidjson"]),
        .library(name: "OpenTime_CXX", targets: ["OpenTime_CXX"]),
        .library(name: "OpenTimelineIO_CXX", targets: ["OpenTimelineIO_CXX"]),
        .library(name: "OpenTimelineIO", targets: ["OpenTimelineIO"])
    ],

    dependencies: [],
    targets: [
        .target(name: "ImathConfig"),

        .target(name: "Imath",
            dependencies: ["ImathConfig"],
            path: "OpenTimelineIO/src/deps/Imath/src/Imath",
            exclude: ["toFloat.cpp"],
            publicHeadersPath: ".",
            cxxSettings: [
              .headerSearchPath("../.")
            ]),

        .target(name: "rapidjson",
            path: "OpenTimelineIO/src/deps/rapidjson",
            exclude: [
                "bin", "CMakeModules", "contrib", "doc",
                "docker", "example", "test", "thirdparty"
            ]),

        .target(name: "OpenTime_CXX",
            dependencies: ["Imath"],
            path: "OpenTimelineIO/src",
            exclude: ["deps", "opentimelineio", "opentimelineview", "py-opentimelineio"],
            publicHeadersPath: "."),

        .target(name: "OpenTimelineIO_CXX",
            dependencies: ["Imath", "rapidjson", "OpenTime_CXX"],
            path: "OpenTimelineIO/src",
            exclude: ["deps", "opentime", "opentimelineview", "py-opentimelineio", "opentimelineio/CORE_VERSION_MAP.last.cpp"],
            publicHeadersPath: "."),

        // .target(name: "OpenTimelineIO_objc",
        //     dependencies: ["OpenTimelineIO_CXX"],
        //     path: "Sources",
        //     exclude: ["swift", "shims", "interop", "ImathConfig"],
        //     sources: ["objc"],
        //     publicHeadersPath: "objc/include",
        //     cxxSettings: [
        //         .headerSearchPath("../OpenTimelineIO/src/deps/Imath/src/Imath"),
        //         .headerSearchPath("objc/include")]),

        .target(name: "OpenTimelineIO_cpp",
            dependencies: ["OpenTimelineIO_CXX"],
            path: "Sources/cpp"),

        // public swift/c++ target
        .target(name: "OpenTimelineIO",
            dependencies: ["OpenTimelineIO_cpp"],
            path: "Sources/interop",
            swiftSettings: [
                .interoperabilityMode(.Cxx)]),

        // public swift/objc target
        // .target(name: "OpenTimelineIO_OLD",
        //     dependencies: ["OpenTimelineIO_objc"],
        //     path: "Sources",
        //     exclude: ["objc", "shims", "interop", "ImathConfig"],
        //     sources: ["swift"]),

        // .testTarget(name: "OpenTimelineIOTests",
        //     dependencies: ["OpenTimelineIO"],
        //     path: "Tests",
        //     sources: ["OpenTimelineIOTests"],
        //     resources: [ .copy("data") ],
        //     swiftSettings: [
        //       .interoperabilityMode(.Cxx)
        //     ])

        .testTarget(name: "OpenTimelineIOInteropTests",
            dependencies: ["OpenTimelineIO"],
            path: "Tests",
            exclude: ["OpenTimelineIOTests"],
            sources: ["OpenTimelineIOInteropTests"],
            resources: [ .copy("data") ],
            swiftSettings: [
              .interoperabilityMode(.Cxx)
            ])
    ],
    cxxLanguageStandard: .cxx17
)
