//
//  FileManagerImpl.swift
//  capp
//
//  Created by Anton Skorodumov on 08.11.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

class LocalFileManagerImpl {

    static let instance: LocalFileManager = LocalFileManagerImpl()
    
    fileprivate var manager: FileManager!
    fileprivate var path: String!
    fileprivate var pathURL: URL?
    
    init() {
        manager = FileManager.default
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectorPath: String = paths[0]
        path = documentDirectorPath.appendingFormat("")
        pathURL = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let isExist = manager.fileExists(atPath: path)
        if isExist == false {
            do {
                try manager.createDirectory(atPath: path,
                                            withIntermediateDirectories: true,
                                            attributes: nil)
            } catch {
                print("Something went wrong while creating a new folder")
            }
        }
    }
}

extension LocalFileManagerImpl: LocalFileManager {
    
    func dataByUrl(_ url: String) -> Data? {
        return manager.contents(atPath: url)
    }
    
    func existFileAtPath(_ url: String) -> Bool {
        return manager.fileExists(atPath: url)
    }
    
    func addDocumentDirectoryToFile(name: String) -> URL? {
        return pathURL?.appendingPathComponent(name)
    }
    
    func removeFileByUrl(urlPath: URL) {
        do {
            try manager.removeItem(at: urlPath)
        } catch {

        }
    }

    func moveFile(from path: URL, to location: URL) -> Bool {
        do {
            try manager.moveItem(at: path, to: location)
            return true
        } catch let error as Error {
            print (error.localizedDescription)
        }
        return false
    }
    
}
