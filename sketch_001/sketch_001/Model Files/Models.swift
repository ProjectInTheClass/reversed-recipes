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

class Ingredient: Codable {
    var name: String
    var icon: String
    var ´class´: String
    var expirationDate: Int // 소비기한
    var amount: String? //양 측정 단위
    //양 숫자를 나타내는 변수 추가
    
    init(name: String, icon: String, ´class´: String, expirationDate: Int) {
        self.name = name
        self.icon = icon
        self.´class´ = ´class´
        self.expirationDate = expirationDate
    }
    
    func isFrozen(ingredient: Ingredient) -> Bool {
        return true
    }
}

struct Seasoning: Codable {
    var name: String
    var icon: String
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
    
    init(name: String, thumbnail: String, time: String, descript: String) {
        self.name = name
        self.thumbnail = thumbnail
        self.time = time
        self.descript = descript
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
