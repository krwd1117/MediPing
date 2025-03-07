import ProjectDescription

let project = Project(
    name: "MediPing",
    targets: [
        // MARK: - App Target
        .target(
            name: "MediPing",
            destinations: .iOS,
            product: .app,
            bundleId: "com.krwd.mediping",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["MediPing/Sources/**"],
            resources: ["MediPing/Resources/**"],
            dependencies: [
                .target(name: "MediPingPresentation"),
                .target(name: "MediPingDomain"),
                .target(name: "MediPingData"),
                .target(name: "MediPingCore")
            ]
        ),
        
        // MARK: - Presentation Layer
        .target(
            name: "MediPingPresentation",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.krwd.mediping.presentation",
            infoPlist: .default,
            sources: ["MediPing/Sources/Presentation/**"],
            dependencies: [
                .target(name: "MediPingDomain"),
                .target(name: "MediPingCore")
            ]
        ),
        
        // MARK: - Domain Layer
        .target(
            name: "MediPingDomain",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.krwd.mediping.domain",
            infoPlist: .default,
            sources: ["MediPing/Sources/Domain/**"],
            dependencies: [
                .target(name: "MediPingCore")
            ]
        ),
        
        // MARK: - Data Layer
        .target(
            name: "MediPingData",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.krwd.mediping.data",
            infoPlist: .default,
            sources: ["MediPing/Sources/Data/**"],
            dependencies: [
                .target(name: "MediPingDomain"),
                .target(name: "MediPingCore")
            ]
        ),
        
        // MARK: - Core Layer
        .target(
            name: "MediPingCore",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.krwd.mediping.core",
            infoPlist: .default,
            sources: ["MediPing/Sources/Core/**"],
            dependencies: []
        ),
        
        // MARK: - Tests
        .target(
            name: "MediPingTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.krwd.mediping.tests",
            infoPlist: .default,
            sources: ["MediPing/Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "MediPing"),
                .target(name: "MediPingPresentation"),
                .target(name: "MediPingDomain"),
                .target(name: "MediPingData"),
                .target(name: "MediPingCore")
            ]
        )
    ]
)
