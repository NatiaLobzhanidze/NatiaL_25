//
//  FMServices.swift
//  NatiaL_25
//
//  Created by Natia's Mac on 28.08.22.
//

import Foundation

class FMServices {
    

    let searchInDocumentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
    
    func saveFolderTitle(with folder : String ) {
        
        let url = FileManager.pathToDocumentsDirectory(with: folder)
        do {
            try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
        } catch {
            print(error)
        }
    }
    
    func getListforDirectories(completion: @escaping ([String]?) -> (Void)) {
        
        do {
            let contentOfDirectory = try FileManager.default.contentsOfDirectory(atPath: searchInDocumentPath)
                completion(contentOfDirectory)
        } catch {
            print(error)
        }
    }
    
    func deleteDocument(folder named: String ) {
        
        let newPath = "/" + searchInDocumentPath + "/" + named
        do {
            if FileManager.default.fileExists(atPath: newPath) {
            try FileManager.default.removeItem(atPath: newPath) }
        } catch {
            print(error)
          }
    }
    
    func createFiletoDocument() {
        
        let sm = FileManager.getDocumentsDirectory().path
        FileManager.default.createFile(atPath: sm,
                                       contents: nil,
                                       attributes: [FileAttributeKey.creationDate : Date()])
    }
    
    
    func getFileNames(of folder: String) -> [String] {
        var sm = [String]()
        let newPath = "/" + searchInDocumentPath + "/" + folder
        let enumerator = FileManager.default.enumerator(atPath: newPath)
        let filePaths = enumerator?.allObjects as! [String]
        let txtFilePaths = filePaths.filter{$0.contains(".txt")}
        for txtFilePath in txtFilePaths{
            sm.append(txtFilePath)
        }
        return sm
    }
    
        func addNewFile(with item : ReminderModel) {
            
            guard let fileUrl = NSURL(fileURLWithPath:searchInDocumentPath).appendingPathComponent(item.folderName) else { return }
        do {
           
            try FileManager.default.createDirectory(
                atPath: fileUrl.path,
                withIntermediateDirectories: true)
     
            let file = fileUrl.appendingPathComponent(item.fileName + ".txt")
            
           //let text2 = try String(contentsOf: file, encoding: .utf8)
            
            try item.content.write(to: file,
                                   atomically: false,
                                   encoding: String.Encoding.utf8)
            //print(text2)
        } catch {
        print(error)
        }
    }
    
    func writeToDocumentsFile(fileName:String, value:String) {
       
//        let path = searchInDocumentPath.appending(fileName) .stringByAppendingPathComponent(fileName)
//        var error:NSError?
//        value.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding, error: &error)
    }
    
    
}

