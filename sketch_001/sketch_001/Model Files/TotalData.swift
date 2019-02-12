//
//  JasonParsing.swift
//  sketch_001
//
//  Created by 이채운 on 31/01/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import Foundation

class TotalData  {
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    var totalRecipes: [Food]?
    
    init() {
        if let fullPath = Bundle.main.path(forResource: "dataJson", ofType: "json"),
            let data = NSData(contentsOfFile: fullPath) as Data? {
            self.totalRecipes = try! decoder.decode([Food].self, from: data)
        }
    }
}

class CheckPlist: Codable {
    var id: Int
    var bookmarked: Bool
 
    init(id: Int, bookmarked: Bool) {
        self.id = id
        self.bookmarked = bookmarked
    }
}

class PlistCoding {
    let encoder = PropertyListEncoder()
    let decoder = PropertyListDecoder()
    let destPath = NSHomeDirectory() + "/Documents/idAndBookmark.plist"
    var indexedPlist: [CheckPlist]?
    
    init() {
        if FileManager.default.fileExists(atPath: destPath) {
            print("파일이 있습니다.")
        } else {
            self.indexedPlist = [CheckPlist]()//없으면 만들 빈 데이터
            do {
                let data = try encoder.encode(self.indexedPlist)
                try data.write(to: URL(fileURLWithPath: destPath))
                print("도큐먼트에 파일을 만들었습니다.")
            }
            catch{
                print(error)
            }
        }//plist가 도큐먼트에 있으면 만들지 말고, 없으면 만들라는 코드
    }
    
    func decodePlist(){
        if let data = NSData(contentsOfFile: destPath) as Data?{
            self.indexedPlist = try! decoder.decode([CheckPlist].self, from: data)
        }
    }
    
    func encodePlist(){
        if let data = try? encoder.encode(self.indexedPlist){
            try? data.write(to: URL(fileURLWithPath: destPath))
        }
    }
}





