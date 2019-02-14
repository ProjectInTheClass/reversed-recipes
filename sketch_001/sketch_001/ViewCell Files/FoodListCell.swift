//
//  TableViewCell.swift
//  sketch_001
//
//  Created by 이채운 on 28/01/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//

import UIKit

class FoodListCell: UITableViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodTime: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    var food: Food?
    var plistCoding = PlistCoding()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func bookmarkButtonTapped(_ sender: Any) {
        
        print("현재 셀의 ID는: \(self.food!.id!)")
        
        // 버튼을 누르면 도큐먼트 폴더의 plist를 읽어서 디코딩
        if let data = NSData(contentsOfFile: plistCoding.destPath) as Data?{
            plistCoding.indexedPlist = try!  plistCoding.decoder.decode([CheckPlist].self, from: data)
        }

        //이미 셀이 있으면 그것을 수정하고 없으면 생성
        let tmpCheckPlist = plistCoding.indexedPlist?.first(where: {$0.id == self.food?.id})
        //현재 셀의 ID값과 도큐먼트에 있는 plist의 ID값이 같은 항목
        
        if tmpCheckPlist == nil{
            if let id = self.food?.id {
                let tmpCheckPlist = CheckPlist(id: id, bookmarked: true)//처음 눌렀으니까 바로 true로
                bookmarkButton.isSelected = true
                plistCoding.indexedPlist?.append(tmpCheckPlist)
                print("없어서 새로 만들고 true로 바꿨다")//없다면 생성하고 bool 값을 true로
            }
        }else {
            plistCoding.indexedPlist?.removeAll(where: {$0.id == self.food?.id})
            bookmarkButton.isSelected = false
//            if let tmpCheckPlist = tmpCheckPlist//있다면
//            {
//                tmpCheckPlist.bookmarked = !tmpCheckPlist.bookmarked
//                print("북마크의 bool값을 반대로 바꿨다")
//                print(tmpCheckPlist)
                //북마크의 bool 값을 변경
//            }
        }// 다시 인코딩하여 저장
    
        if let data = try? plistCoding.encoder.encode(plistCoding.indexedPlist){
            try?data.write(to: URL(fileURLWithPath: plistCoding.destPath))
        }
        
        //이미 있는 데이터에다가 버튼이 눌린 데이터를 추가
        
        //
        print("다시 인코딩해서 저장함")
        print(plistCoding.indexedPlist)

        //        if let food = self.food{
//            if bookMark.isBookmarked(food) {
//                bookMark.remove(food)
//                bookmarkButton.setImage(UIImage(named: "bookmark_outline"), for: .normal)
//            }
//            else{
//                bookMark.add(food)
//                bookmarkButton.setImage(UIImage(named: "bookmark_filled"), for: .normal)
//            }
//        }
//        bookMark.save()
    }
}

