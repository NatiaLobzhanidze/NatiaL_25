//
//  FileManagerExtension.swift
//  NatiaL_25
//
//  Created by Natia's Mac on 28.08.22.
//

import Foundation

extension FileManager {
    
    static func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory,
                                    in: .userDomainMask)[0]
    }
    
    static func pathToDocumentsDirectory(with fileName: String) -> URL {
        return getDocumentsDirectory().appendingPathComponent(fileName)
    }
    static func getSearchPath() -> String {
        NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                            .userDomainMask, true)[0]
    }
    
    

}
