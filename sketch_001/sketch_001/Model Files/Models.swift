//
//  Model.swift
//  sketch_001
//
//  Created by 이채운 on 28/01/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import Foundation

//var foods = [
//    Food(name: "감바스", thumbnail: "감바스", time: "5분", descript: "간편하게 만들어 먹는 안주"),
//    Food(name: "계란볶음밥", thumbnail: "계란볶음밥", time: "5분", descript: "영양만점 손쉬운 볶음밥"),
//    Food(name: "김치볶음밥", thumbnail: "김치볶음밥", time: "5분", descript: "김치와 밥만 있으면 된다!"),
//    Food(name: "돼지고기 김치찌개", thumbnail: "돼지고기-김치찌개", time: "5분", descript: "김치찌개에서 돼지고기 골라먹는 재미"),
//    Food(name: "쇠고기무국", thumbnail: "쇠고기무국", time: "5분", descript: "집에서 먹던 그 맛, 뜨끈한 쇠고기 무국"),
//    Food(name: "참치마요", thumbnail: "참치마요", time: "5분", descript: "모두가 좋아하는 참치마요덮밥")
//]

class Ingredient: NSObject, NSCoding, Codable {
    var name: String
    var icon: String
    var ´class´: String
    var expirationDate: Int // 소비 기한
    var startDate: String? // 구매 날짜
    var isFrozen: Bool?
//    var amount: String? //양 측정 단위
    //양 숫자를 나타내는 변수 추가
    
    init(name: String, icon: String, ´class´: String, expirationDate: Int) {
        self.name = name
        self.icon = icon
        self.´class´ = ´class´
        self.expirationDate = expirationDate
    }
    
    convenience init(name: String, icon: String, ´class´: String, expirationDate: Int, startDate: String?) {
        self.init(name: name, icon: icon, ´class´: ´class´, expirationDate: expirationDate)
        self.startDate = startDate
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.icon = aDecoder.decodeObject(forKey: "icon") as! String
        self.´class´ = aDecoder.decodeObject(forKey: "´class´") as! String
        self.expirationDate = Int(aDecoder.decodeInteger(forKey: "expirationDate"))
        self.startDate = aDecoder.decodeObject(forKey: "startDate") as? String
        self.isFrozen = aDecoder.decodeObject(forKey: "isFrozen") as? Bool
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.icon, forKey: "icon")
        aCoder.encode(self.´class´, forKey: "´class´")
        aCoder.encode(self.expirationDate, forKey: "expirationDate")
        aCoder.encode(self.startDate, forKey: "startDate")
        aCoder.encode(self.isFrozen, forKey: "isFrozen")
    }
}

class Seasoning: NSObject, NSCoding, Codable {
    var name: String
    var icon: String
    
    init(name: String, icon: String) {
        self.name = name
        self.icon = icon
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.icon = aDecoder.decodeObject(forKey: "icon") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.icon, forKey: "icon")
    }
}

class Food: Codable {

    var name: String // 음식 이름
    var thumbnail: String // 음식 사진
    var time: String // 조리시간
    var ingredients: String?
    var ingreAmount: String?
    var seasoning: String?
    var descript: String?
    var method1: String?
    var method2: String?
    var method3: String?
    var method4: String?
    var method5: String?
    var method6: String?
    var method7: String?
    var id: Int?
    
    init(name: String, thumbnail: String, time: String) {
        self.name = name
        self.thumbnail = thumbnail
        self.time = time
    }
    
    init(name: String, thumbnail: String, time: String, descript: String?) {
        self.name = name
        self.thumbnail = thumbnail
        self.time = time
        self.descript = descript
    }
    
    convenience init(name: String, thumbnail: String, time: String, descript: String?, ingredients: String?, ingreAmount: String?, seasoning: String?, method1: String?, method2: String?, method3: String?, method4: String?, method5: String?, method6: String?, method7: String?, id: Int?) {
        self.init(name: name, thumbnail: thumbnail, time: time, descript: descript)
        self.ingredients = ingredients
        self.ingreAmount = ingreAmount
        self.seasoning = seasoning
        self.method1 = method1
        self.method2 = method1
        self.method3 = method1
        self.method4 = method1
        self.method5 = method1
        self.method6 = method1
        self.method7 = method1
        self.id = id
    }
}

//
//class Bookmark {
//    var saves: [Food] = []
//
//    var filePath: String { get {
//        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
//        return documentDirectory + fileName
//        }}
//
//    init() {
//        if FileManager.default.fileExists(atPath: self.filePath){
//            //read
//            if let unarchArray = NSKeyedUnarchiver.unarchiveObject(withFile: self.filePath) as? [Food] {
//                saves += unarchArray
//            }
//        } else {
//            //create
//        }
//    }
//
//    func save() {
//        NSKeyedArchiver.archiveRootObject(self.saves, toFile: self.filePath)
//    }
//
//    func isBookmarked(_ food: Food) -> Bool {
//        for one in saves {
//            if one.name == food.name {
//                return true
//            }
//        }
//        return false
//    }
//
//    func add(_ food: Food){
//        self.saves.append(food)
//    }
//
//    func remove(_ food: Food){
//        for (index, one) in saves.enumerated() {
//            if one.name == food.name {
//                saves.remove(at: index)
//                return
//            }
//        }
//    }
//}
