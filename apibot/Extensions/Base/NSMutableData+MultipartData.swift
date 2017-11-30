//
//  NSMutableData+MultipartData.swift
//  capp
//
//  Created by Anton Skorodumov on 09.11.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import Foundation

extension NSMutableData {
    
    func addBoundary(_ boundary: String) {
        guard let data = String("--\(boundary)\r\n").data(using: String.Encoding.utf8) else {return}
        self.append(data)
    }
    
    func addData(_ data: Data) {
        guard let contentTypeData = String("Content-Type: image/*\r\n\r\n").data(using: String.Encoding.utf8),
              let endData = String("\r\n").data(using: String.Encoding.utf8) else {return}
        self.append(contentTypeData)
        self.append(data)
        self.append(endData)
    }
    
    func addDesposition() {
        guard let data = String("Content-Disposition: form-data; name=\"file\"; filename=\"file.png\"\r\n").data(using: String.Encoding.utf8) else {return}
        self.append(data)
    }
    
    func closeBoundary(_ boundary: String) {
        guard let data = String("--\(boundary)--\r\n").data(using: String.Encoding.utf8) else {return}
        self.append(data)
    }
    
    func appendDataWith(name: String,
                        value: Data,
                        boundary: String)
    {
        guard let startData = String("--\(boundary)\r\n").data(using: String.Encoding.utf8),
            let nameData = String("Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n").data(using: String.Encoding.utf8),
            let endData = String("\r\n").data(using: String.Encoding.utf8) else {return}
        
        self.append(startData)
        self.append(nameData)
        self.append(value)
        self.append(endData)
    }
    
    func appendDataFileWith(name: String,
                            value: Data,
                            type: String,
                            filename: String,
                            boundary: String)
    {
        guard let startData = String("--\(boundary)\r\n").data(using: String.Encoding.utf8),
            let filenameData = String("Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(filename)\"\r\n").data(using: String.Encoding.utf8),
            let typeData = String("Content-Type: \(type)/*\r\n\r\n").data(using: String.Encoding.utf8),
            let endData = String("\r\n").data(using: String.Encoding.utf8) else {return}
        
        self.append(startData)
        self.append(filenameData)
        self.append(typeData)
        self.append(value)
        self.append(endData)
    }
    
}
