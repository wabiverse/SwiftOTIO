// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
// SPDX-License-Identifier: Apache-2.0
// Copyright Contributors to the OpenTimelineIO project

import PackageDescription

let package = Package(
    name: "OpenTimelineIO",
    platforms: [
      .macOS(.v10_13),
      .iOS(.v12),
      .visionOS(.v1)
    ],
    products: [
        .library(name: "OpenTime_CXX", targets: ["OpenTime_CXX"]),
        .library(name: "OpenTimelineIO_CXX", targets: ["OpenTimelineIO_CXX"]),
        .library(name: "OpenTimelineIO", targets: ["OpenTimelineIO"])
    ],

    dependencies: [],
    targets: [
        .target(name: "otio_header_root",
            path: ".",
            exclude: [
                "CONTRIBUTORS.md", "NOTICE.txt", "CONTRIBUTING.md", "LICENSE.txt", "CODE_OF_CONDUCT.md",
                "OTIO_CLA_Corporate.pdf", "OTIO_CLA_Individual.pdf",
                "README.md", "Examples", "OpenTimelineIO", "Tests", "Sources/objc", "Sources/swift"],
            sources: ["Sources/shims/otio_header_root-shim.cpp"],
            publicHeadersPath:"OpenTimelineIO/src"),

        .target(name: "OpenTime_CXX",
            dependencies: ["otio_header_root"],
            path: "OpenTimelineIO/src/opentime",
            exclude: ["CMakeLists.txt", "OpenTimeConfig.cmake.in"],
            sources: ["."],
            publicHeadersPath: ".",
            cxxSettings: [ .headerSearchPath(".")]),

        .target(name: "OpenTimelineIO_CXX",
            dependencies: ["OpenTime_CXX"],
            path: "OpenTimelineIO/src/opentimelineio",
            exclude: ["CMakeLists.txt", "CORE_VERSION_MAP.last.cpp", "OpenTimelineIOConfig.cmake.in"],
            sources: ["."],
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("."),
                .headerSearchPath("../deps/any/"),
                .headerSearchPath("../deps/Imath/src/Imath"),
                .headerSearchPath("../../../Sources/cpp"),
                .headerSearchPath("../deps/rapidjson/include")]),

        .target(name: "OpenTimelineIO_objc",
            dependencies: ["OpenTimelineIO_CXX"],
            path: "Sources",
            exclude: ["swift", "shims"],
            sources: ["objc"],
            publicHeadersPath: "objc/include",
            cxxSettings: [
                .headerSearchPath("../OpenTimelineIO/src/deps/Imath/src/Imath"),
                .headerSearchPath("../Sources/cpp"),
                .headerSearchPath("objc/include")]),

        // public target
        .target(name: "OpenTimelineIO",
            dependencies: ["OpenTimelineIO_objc"],
            path: "Sources",
            exclude: ["objc", "shims"],
            sources: ["swift"]),

        .testTarget(name: "OpenTimelineIOTests",
            dependencies: ["OpenTimelineIO"],
            path: "Tests",
            sources: ["OpenTimelineIOTests"],
            resources: [ .copy("data") ])
    ],
    cxxLanguageStandard: .cxx17
)
