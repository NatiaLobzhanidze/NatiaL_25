//
//  FMServices.swift
//  NatiaL_25
//
//  Created by Natia's Mac on 28.08.22.
//

import Foundation

class FMServices {
    
    //MARK: Create Folder
    func createFolder(with title : String ) {
        
        let url = FileManager.pathToDocumentsDirectory(with: title)
        do {
            try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
        } catch {
            print(error)
        }
    }
    
    //MARK: Read Folders
    
    func getListforDirectories(completion: @escaping ([String]?) -> (Void)) {
        
        do {
            let contentOfDirectory = try FileManager.default.contentsOfDirectory(atPath: FileManager.getSearchPath() )
            completion(contentOfDirectory)
        } catch {
            print(error)
        }
    }
    //MARK: Delete Folder
    func deleteDocument(folder named: String ) {
        let newPath = "/" + FileManager.getSearchPath() + "/" + named
        do {
            if FileManager.default.fileExists(atPath: newPath) {
                try FileManager.default.removeItem(atPath: newPath) }
        } catch {
            print(error)
        }
    }
    
    //    MARK:  Create File
    func addNewFile(with item : ReminderModel) {
        
        guard let atPath = NSURL(fileURLWithPath: FileManager.getSearchPath()).appendingPathComponent(item.folderName) else { return }
        
        try? FileManager.default.createDirectory(atPath: atPath.path, withIntermediateDirectories: true)
        let file = atPath.appendingPathComponent(item.fileName + ".txt")
        try? item.content.write(to: file, atomically: false, encoding: String.Encoding.utf8)
    }
    
    //    MARK:  Read Files
    
    func getFileNames(of folder: String) -> [String] {
        var strArr = [String]()
        let newPath = "/" + FileManager.getSearchPath() + "/" + folder
        let enumerator = FileManager.default.enumerator(atPath: newPath)
        let filePaths = enumerator?.allObjects as! [String]
        let txtFilePaths = filePaths.filter{$0.contains(".txt")}
        for txtFilePath in txtFilePaths{
            strArr.append(txtFilePath)
        }
        return strArr
    }
    
    
}

