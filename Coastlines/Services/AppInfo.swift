//
//  AppInfo.swift
//  Coastlines
//
//  Created by Kelby Mittan on 7/9/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation

struct ApplicationInfo {
    
    static func getVersionBuildNumber() -> String {
        guard let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString"),
            let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion")
            else {
                fatalError("no version info")
        }
        return "\(version)(\(build))"
    }
    
    static func getAppName() -> String {
        guard let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String else {
            fatalError("no app name")
        }
        return appName
    }
    
}
