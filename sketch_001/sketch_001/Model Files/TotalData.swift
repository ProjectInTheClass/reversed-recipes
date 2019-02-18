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
        if let fullPath = Bundle.main.path(forResource: "recipeJson", ofType: "json"),
            let data = NSData(contentsOfFile: fullPath) as Data? {
            self.totalRecipes = try! decoder.decode([Food].self, from: data)
        }
    }
}

class TotalIngredientsData  {
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    var totalIngredients: [Ingredient]?
    
    init() {
        if let fullPath = Bundle.main.path(forResource: "ingreJson", ofType: "json"),
            let data = NSData(contentsOfFile: fullPath) as Data? {
            self.totalIngredients = try! decoder.decode([Ingredient].self, from: data)
        }
    }
}

class TotalSeasoningData  {
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    var totalSeasoning: [Seasoning]?
    
    init() {
        if let fullPath = Bundle.main.path(forResource: "seasJson", ofType: "json"),
            let data = NSData(contentsOfFile: fullPath) as Data? {
            self.totalSeasoning = try! decoder.decode([Seasoning].self, from: data)
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

class Translation {
    var ingreDictionary = [String : String]()
    var seasDictionary = [String : String]()
    
    init() {
        do {
            if let file = Bundle.main.url(forResource: "dicIngreJson", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    print(object)
                } else if let object = json as? [Any] {
                    // json is an array
                    for anItem in object as! [Dictionary<String, AnyObject>] {
                        let Name = anItem["e_name"] as! String
                        let ID = anItem["k_name"] as! String
                        //                        let industry = Industry(name: industryName, id:industryID)
                        ingreDictionary[ID] = Name
                        //                        industries[industryID]?.getString()
                    }
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        
        do {
            if let file = Bundle.main.url(forResource: "dicSeasJson", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    print(object)
                } else if let object = json as? [Any] {
                    // json is an array
                    for anItem in object as! [Dictionary<String, AnyObject>] {
                        let Name = anItem["e_name"] as! String
                        let ID = anItem["k_name"] as! String
                        //                        let industry = Industry(name: industryName, id:industryID)
                        seasDictionary[ID] = Name
                        //                        industries[industryID]?.getString()
                    }
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        
//        print(dictionary["소고기"]!)
//        print("---------------")
    }
}
