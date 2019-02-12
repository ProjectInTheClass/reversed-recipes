//
//  RefregeratorViewController.swift
//  sketch_001
//
//  Created by CAU on 07/02/2019.
//  Copyright © 2019 iOS App class. All rights reserved.
//
// 이 RefregeratorviewController.swift에서는 냉장고에 추가하는 재료의 정보가 들어간다.

import UIKit

protocol SendDataDelegate {
    func sendData(data: String)
}

class RefregeratorViewController: UIViewController{
    
    // +, 요리보기 버튼은 스토리보드상에 세그로 연결되어있어서 추가하지 않음
    @IBOutlet weak var myRefregeratorView: UIView!// 뭐에 연결되어있는지 모르겠음
    
    // 식재료 이름
    var ingredientName:String = ""
    // 조미료 이름
    var seasoningName:String = ""
    // 추가 버튼을 누르기 전 장바구니 식재료 Set
    var addesIngrePre: Set<String> = Set<String>()
    // 이전의 나의 냉장고 화면의 식재료 Set
    var addesIngreMain: Set<String> = Set<String>()
    // 추가 버튼을 누르기 전 장바구니 조미료 Set
    var addesSeasonPre: Set<String> = Set<String>()
    // 이전의 나의 냉장고 화면의 조미료 Set
    var addesSeasonMain: Set<String> = Set<String>()
    
    // 처음 세그먼티드 컨트롤을 쓰기 위한 컨테이너뷰 두 개와 세그멘티드 컨트롤 버튼
    @IBOutlet weak var ingredientSegmentedContainerView: UIView!
    @IBOutlet weak var seasoningSegmentedContainerView: UIView!
    @IBOutlet weak var SegmentedController: UISegmentedControl!
    
    // 세그멘티드 컨트롤을 눌렀을 때의 동작
    @IBAction func handleSegment(_ sender: Any) {
        switch SegmentedController.selectedSegmentIndex {
        case 0:
            ingredientSegmentedContainerView.isHidden = false
            seasoningSegmentedContainerView.isHidden = true
        default:
            ingredientSegmentedContainerView.isHidden = true
            seasoningSegmentedContainerView.isHidden = false
        }
    }
    
    // 첫 화면이 로딩될 때는 식재료 세그먼트가 보여야 한다.
    override func viewDidLoad() {
        super.viewDidLoad()
         ingredientSegmentedContainerView.isHidden = false
         seasoningSegmentedContainerView.isHidden = true
    }
    
    // 추가 버튼을 누르면 확인과 취소버튼이 있는 알러트 뷰가 뜨고 확인을 누르면 메인화면애 았는 식재료와 조미료가 업데이트됨
    @IBAction func addFinallyToMyRefregerator(_ sender: Any){
        let message = "추가된 재료는 나의 냉장고에 저장됩니다."
        let dialog = UIAlertController(title: "재료가 추가되었습니다", message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default){ (action) in
            // addesIngrePre와 addesIngreMain 사이에서 중복되는 것을 제외하고 addesIngreFin라는 새로운 addesIngreMain의 역할인 Set을 만든다.
            var addesIngreFin: Set<String> = self.addesIngreMain.union(self.addesIngrePre)
            // 장바구니를 초기화하여 다음 사용을 준비한다.
            self.addesIngrePre.removeAll()
            // 기존에 존재했던 재료들을 초기화 한 후 addesIngreFin을 다시 addesIngreMain에 넣어주어 반환된 addesIngreMain을 사용할 수 있게끔 한다.
            self.addesIngreMain.removeAll()
            self.addesIngreMain = addesIngreFin.union(self.addesIngreMain)
            addesIngreFin.removeAll()
            
            // 위와 똑같은 과정을 조미료 셋에도 적용시킨다.
            var addesSeasonFin: Set<String> = self.addesSeasonMain.union(self.addesSeasonPre)
            // 장바구니를 초기화하여 다음 사용을 준비한다.
            self.addesSeasonPre.removeAll()
            // 기존에 존재했던 재료들을 초기화 한 후 addesIngreFin을 다시 addesIngreMain에 넣어주어 반환된 addesIngreMain을 사용할 수 있게끔 한다.
            self.addesSeasonMain.removeAll()
            self.addesSeasonMain = addesSeasonFin.union(self.addesSeasonMain)
            addesSeasonFin.removeAll()
            
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        dialog.addAction(confirmAction)
        dialog.addAction(cancelAction)
        
        self.present(dialog, animated: true, completion: nil)
    }
    
}




