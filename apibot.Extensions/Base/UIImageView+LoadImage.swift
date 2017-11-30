//
//  UIImageView+LoadImage.swift
//  capp
//
//  Created by Андрей Гутов on 18.10.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setImageWith(_ url: String?,
                      placeholder: UIImage?) {
        if let placeholder = placeholder {
            image = placeholder
        }
        guard let url = url, url != "" else { return }
        guard setLocalFileImage(url) == false else { return }
        guard setCachedImage(url) == false else { return }
        guard setLoadingImage(url) == false else { return }
    }
    
    func setImageClearCacheWith(_ url: String?,
                                placeholder: UIImage?) {
        if let placeholder = placeholder {
            image = placeholder
        }
        guard let url = url, url != "" else { return }
        setCachedImage(url)
        setLoadingImage(url)
    }
    
    func setCachedImage(_ url: String) -> Bool {
        guard let url  = URL(string: url) else { return false }
        let request = URLRequest(url: url,
                                   cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy,
                                   timeoutInterval: 30)
        let cachedResponse = URLCache.shared.cachedResponse(for: request)
        if let data = cachedResponse?.data {
            image = UIImage(data: data)
            return true
        }
        return false
    }
    
    func setLocalFileImage(_ url: String) -> Bool {
        let fileManager = LocalFileManagerImpl.instance
        guard fileManager.existFileAtPath(url) else { return false }
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.default)
        //let queue = DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default)
        queue.async(execute: {
            guard let data = fileManager.dataByUrl(url) else { return }
            guard let fileImage = UIImage(data: data) else { return }
            DispatchQueue.main.async(execute: { [weak self] in
                self?.image = fileImage
            })
        })
        return true
    }
    
    func setLoadingImage(_ url: String) -> Bool {
        guard let url = URL(string: url) else { return false }
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.default)
        //let queue = DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default)
        queue.async(execute: {
            guard let data = try? Data(contentsOf: url) else { return }
            guard let fileImage = UIImage(data: data) else { return }
            DispatchQueue.main.async(execute: { [weak self] in
                self?.image = fileImage
            })
        })
        return true
    }
    
}
