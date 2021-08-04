//
//  FileManager.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//

import Foundation

extension FileManager {
    class var homeDir: String! {
        return NSHomeDirectory()
    }

    class var homeUrl: NSURL! {
        return NSURL(fileURLWithPath: homeDir, isDirectory: true)
    }

    class var docDirectory: String! {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
    }

    class var docUrl: NSURL! {
        return NSURL(fileURLWithPath: docDirectory, isDirectory: true)
    }

    class var libraryDirectory: String! {
        return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first
    }

    class var libraryUrl: NSURL! {
        return NSURL(fileURLWithPath: libraryDirectory, isDirectory: true)
    }

    class var appSupportDirectory: String! {
        return NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first
    }

    class var appSupportUrl: NSURL! {
        return NSURL(fileURLWithPath: appSupportDirectory, isDirectory: true)
    }

    class var tmpDirectory: String {
        return NSTemporaryDirectory()
    }

    class var tmpUrl: NSURL {
        return NSURL(fileURLWithPath: tmpDirectory, isDirectory: true)
    }

    @discardableResult
    class func skipBackup(path: String) -> Bool {
        let fm = `default`
        var isDir: ObjCBool = true
        if fm.fileExists(atPath: path, isDirectory: &isDir) {
            if isDir.boolValue {
                var success = true
                do {
                    let urls = try fm.contentsOfDirectory(atPath: path)
                    for url in urls {
                        success = success && skipBackup(path: url)
                    }
                    return success
                } catch {}
            } else {
                do {
                    let url = NSURL(fileURLWithPath: path)
                    try url.setResourceValue(true, forKey: URLResourceKey.isExcludedFromBackupKey)
                    return true
                } catch {}
            }
        }
        return false
    }

    class func skipBackup() {
        skipBackup(path: docDirectory)
        skipBackup(path: libraryDirectory)
    }
}
