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
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var kindSegmentedController: UISegmentedControl!
    
    // 세그멘티드 컨트롤을 눌렀을 때의 동작
    @IBAction func handleSegment(_ sender: Any) {
        switch kindSegmentedController.selectedSegmentIndex {
        case 0:
            firstView.isHidden = false
            secondView.isHidden = true
        default:
            firstView.isHidden = true
            secondView.isHidden = false
        }
    }
    
    // 첫 화면이 로딩될 때는 식재료 세그먼트가 보여야 한다.
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         firstView.isHidden = false
         secondView.isHidden = true
         */
    }
    
    // 고기류 버튼
    @IBOutlet weak var steakButton: UIButton!
    @IBOutlet weak var porkButton: UIButton!
    @IBOutlet weak var chickenButton: UIButton!
    
    // 채소류 버튼
    @IBOutlet weak var carrotButton: UIButton!
    @IBOutlet weak var cucumberButton: UIButton!
    @IBOutlet weak var whiteRadishButton: UIButton!
    
    // 과일류 버튼
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var pearButton: UIButton!
    @IBOutlet weak var waterMelonButton: UIButton!
    
    // 생선류 버튼
    @IBOutlet weak var mackerelButton: UIButton!
    @IBOutlet weak var hairtailButton: UIButton!
    @IBOutlet weak var croakerButton: UIButton!
    
    // 유제품류 버튼
    @IBOutlet weak var yogurtButton: UIButton!
    @IBOutlet weak var chocolateMilkButton: UIButton!
    @IBOutlet weak var milkButton: UIButton!
    
    // 조미료 버튼
    @IBOutlet weak var soySauceButton: UIButton!
    @IBOutlet weak var sugarButton: UIButton!
    @IBOutlet weak var saltButton: UIButton!
    @IBOutlet weak var maltSugarButton: UIButton!
    @IBOutlet weak var redPepperPasteButton: UIButton!
    
    
    // 버튼을 터치하면 버튼의 백그라운드 색이 바뀌고 addesIngrePre에 저장된다.
    // 고기류
    @IBAction func steakButtonSelected(_ sender: Any) {
        if steakButton.isSelected == true {
            steakButton.isSelected = false
            steakButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesIngrePre.remove("소고기")
        }
        else {
            steakButton.isSelected = true
            steakButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesIngrePre.insert("소고기")
        }
    }
    
    @IBAction func porkButtonSelected(_ sender: Any) {
        if porkButton.isSelected == true {
            porkButton.isSelected = false
            porkButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesIngrePre.remove("돼지고기")
        }
        else {
            porkButton.isSelected = true
            porkButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesIngrePre.insert("돼지고기")
        }
    }
    
    @IBAction func chickenButtonSelected(_ sender: Any) {
        if chickenButton.isSelected == true {
            chickenButton.isSelected = false
            chickenButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesIngrePre.remove("닭고기")
        }
        else {
            chickenButton.isSelected = true
            chickenButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesIngrePre.insert("닭고기")
        }
    }
    
    // 채소류
    @IBAction func carrotButtonSelected(_ sender: Any) {
        if carrotButton.isSelected == true {
            carrotButton.isSelected = false
            carrotButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesIngrePre.remove("당근")
        }
        else {
            carrotButton.isSelected = true
            carrotButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesIngrePre.insert("당근")
        }
    }
    
    @IBAction func cucumberButtonSelected(_ sender: Any) {
        if cucumberButton.isSelected == true {
            cucumberButton.isSelected = false
            cucumberButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesIngrePre.remove("오이")
        }
        else {
            cucumberButton.isSelected = true
            cucumberButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesIngrePre.insert("오이")
        }
    }
    
    @IBAction func whiteRadishButtonSelected(_ sender: Any) {
        if whiteRadishButton.isSelected == true {
            whiteRadishButton.isSelected = false
            whiteRadishButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesIngrePre.remove("무")
        }
        else {
            whiteRadishButton.isSelected = true
            whiteRadishButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesIngrePre.insert("무")
        }
    }
    
    // 과일류
    @IBAction func appleButtonSelected(_ sender: Any) {
        if appleButton.isSelected == true {
            appleButton.isSelected = false
            appleButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesIngrePre.remove("사과")
        }
        else {
            appleButton.isSelected = true
            appleButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesIngrePre.insert("사과")
        }
    }
    
    @IBAction func pearButtonSelected(_ sender: Any) {
        if pearButton.isSelected == true {
            pearButton.isSelected = false
            pearButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesIngrePre.remove("배")
        }
        else {
            pearButton.isSelected = true
            pearButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesIngrePre.insert("배")
        }
    }
    
    @IBAction func waterMelonButtonSelected(_ sender: Any) {
        if waterMelonButton.isSelected == true {
            waterMelonButton.isSelected = false
            waterMelonButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesIngrePre.remove("수박")
        }
        else {
            waterMelonButton.isSelected = true
            waterMelonButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesIngrePre.insert("수박")
        }
    }
    
    // 생선류
    @IBAction func mackerelButtonSelected(_ sender: Any) {
        if mackerelButton.isSelected == true {
            mackerelButton.isSelected = false
            mackerelButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesIngrePre.remove("고등어")
        }
        else {
            mackerelButton.isSelected = true
            mackerelButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesIngrePre.insert("고등어")
        }
    }
    
    @IBAction func hairtailButtonSelected(_ sender: Any) {
        if hairtailButton.isSelected == true {
            hairtailButton.isSelected = false
            hairtailButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesIngrePre.remove("갈치")
        }
        else {
            hairtailButton.isSelected = true
            hairtailButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesIngrePre.insert("갈치")
        }
    }
    
    @IBAction func croakerButtonSelected(_ sender: Any) {
        if croakerButton.isSelected == true {
            croakerButton.isSelected = false
            croakerButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesIngrePre.remove("조기")
        }
        else {
            croakerButton.isSelected = true
            croakerButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesIngrePre.insert("조기")
        }
    }
    
    // 유제품류
    @IBAction func yogurtButtonSelected(_ sender: Any) {
        if yogurtButton.isSelected == true {
            yogurtButton.isSelected = false
            yogurtButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesIngrePre.remove("요구르트")
        }
        else {
            yogurtButton.isSelected = true
            yogurtButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesIngrePre.insert("요구르트")
        }
    }
    
    @IBAction func chocolateMikButtonSelected(_ sender: Any) {
        if chocolateMilkButton.isSelected == true {
            chocolateMilkButton.isSelected = false
            chocolateMilkButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesIngrePre.remove("초코우유")
        }
        else {
            chocolateMilkButton.isSelected = true
            chocolateMilkButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesIngrePre.insert("초코우유")
        }
    }
    
    @IBAction func milkButtonSelected(_ sender: Any) {
        if milkButton.isSelected == true {
            milkButton.isSelected = false
            milkButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesIngrePre.remove("우유")
        }
        else {
            milkButton.isSelected = true
            milkButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesIngrePre.insert("우유")
        }
    }
    
    // 조미료
    @IBAction func soySauceButtonSelected(_ sender: Any) {
        if soySauceButton.isSelected == true {
            soySauceButton.isSelected = false
            soySauceButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesSeasonPre.remove("간장")
        }
        else {
            soySauceButton.isSelected = true
            soySauceButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesSeasonPre.insert("간장")
        }
    }
    
    @IBAction func sugarButtonSelected(_ sender: Any) {
        if sugarButton.isSelected == true {
            sugarButton.isSelected = false
            sugarButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesSeasonPre.remove("설탕")
        }
        else {
            sugarButton.isSelected = true
            sugarButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesSeasonPre.insert("설탕")
        }
    }
    
    @IBAction func saltButtonSelected(_ sender: Any) {
        if saltButton.isSelected == true {
            saltButton.isSelected = false
            saltButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesSeasonPre.remove("소금")
        }
        else {
            saltButton.isSelected = true
            saltButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesSeasonPre.insert("소금")
        }
    }
    
    @IBAction func maltSugarButtonSelected(_ sender: Any) {
        if maltSugarButton.isSelected == true {
            maltSugarButton.isSelected = false
            maltSugarButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesSeasonPre.remove("엿당")
        }
        else {
            maltSugarButton.isSelected = true
            maltSugarButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesSeasonPre.insert("엿당")
        }
    }
    
    @IBAction func redPepperPasteButtonSelected(_ sender: Any) {
        if redPepperPasteButton.isSelected == true {
            redPepperPasteButton.isSelected = false
            redPepperPasteButton.backgroundColor = UIColor(red: 255, green: 222, blue: 179, alpha: 1)
            self.addesSeasonPre.remove("고추장")
        }
        else {
            redPepperPasteButton.isSelected = true
            redPepperPasteButton.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
            self.addesSeasonPre.insert("고추장")
        }
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




