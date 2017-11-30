//
//  FileManager.swift
//  capp
//
//  Created by Anton Skorodumov on 08.11.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

protocol LocalFileManager: class {
    
    /**
     @author Skorodumov Anton
     Получить содержимое файла по урл
     */
    func dataByUrl(_ url: String) -> Data?
    
    /**
     @author Skorodumov Anton
     Проверка существования файла в указанной директории
     */
    func existFileAtPath(_ url: String) -> Bool

    /**
     @author Skorodumov Anton
     На вход принимает имя файла
     На выходе добавляет к файлу путь до документ директории и проверяет что файл существует.
     Если файл не существует - отдает nil
     Если существует - путь до файла
     */
    func addDocumentDirectoryToFile(name: String) -> URL?
    
    /**
     @author Skorodumov Anton
    Удалить файл 
     */
    func removeFileByUrl(urlPath: URL)
    
    /**
     @author Skorodumov Anton
     переместить файл
     */
    func moveFile(from path: URL, to location: URL) -> Bool
    
}
