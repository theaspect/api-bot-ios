//
//  ServiceError.swift
//  safesensor
//
//  Created by Anton Skorodumov on 26.07.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

enum ServiceError {
    
    case photoLibraryNoErrorsNoSaved()
    case photoLibraryPermitionDenided()
    case photoLibraryCannotCreateAlbum()
    
    case connectWifiCannotFindCamera()
    
    case imagePickerCropError()
    
}

extension ServiceError: ApplicationError {
    
    var title: String {
        switch self {
        case .photoLibraryNoErrorsNoSaved():
            return "Не смог сохранить видео файл"
        case .photoLibraryPermitionDenided():
            return "Нет привелегий"
        case .connectWifiCannotFindCamera():
            return "Камера не подключена"
        case .photoLibraryCannotCreateAlbum():
            return "Не смог сохранить видео файл"
        case .imagePickerCropError():
            return "Не удалось получить изображение"
        }
    }
    
    var code: Int {
        switch self {
        case .photoLibraryNoErrorsNoSaved():
            return -10006
        case .photoLibraryPermitionDenided():
            return -10007
        case .connectWifiCannotFindCamera():
            return -10008
        case .photoLibraryCannotCreateAlbum():
            return -10009
        case .imagePickerCropError():
            return -10010
        }
    }
    
    var message: String {
        switch self {
        case .photoLibraryNoErrorsNoSaved():
            return "Не смог сохранить видео файл"
        case .photoLibraryPermitionDenided():
            return "Нет привелегий"
        case .connectWifiCannotFindCamera():
            return "Камера не подключена"
        case .photoLibraryCannotCreateAlbum():
            return "Не смог сохранить видео файл"
        case .imagePickerCropError():
            return "Не удалось получить изображение"
        }
    }
    
    var log: String {
        switch self {
        case .photoLibraryNoErrorsNoSaved():
            return "Не смог сохранить файл, но ошибок не отдал"
        case .photoLibraryPermitionDenided():
            return "Нет привелегий"
        case .connectWifiCannotFindCamera():
            return "Не смог найти камеру, либо бек не работает"
        case .photoLibraryCannotCreateAlbum():
            return "Не смог сохранить видео файл"
        case .imagePickerCropError():
            return "Не удалось получить изображение"
        }
    }
    
    var extra: Extra? {
        return nil
    }
    
}
