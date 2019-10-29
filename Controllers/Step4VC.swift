//
//  Step4VC.swift
//  Multiviasta
//
//  Created by Eric on 2019/10/8.
//  Copyright © 2019 Javier. All rights reserved.
//

import UIKit

class Step4VC: UIViewController {

    @IBOutlet weak var ingredientCombox: SWComboxView!
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientCombox.defaultSelectedIndex = appDel.selInd
        ingredientCombox.dataSource = self
        ingredientCombox.delegate = self
        ingredientCombox.showMaxCount = 4
    }
    
    @IBAction func prevStep3(_ sender: UIButton) {
        performSegue(withIdentifier: "prevStep3Segue", sender: self)
    }
    
    @IBAction func nextConfirm(_ sender: UIButton) {
        performSegue(withIdentifier: "nextConfirmSegue", sender: self)
    }
}

// SWComboxViewDataSourcce
extension Step4VC: SWComboxViewDataSourcce {
    func comboBoxSeletionItems(combox: SWComboxView) -> [Any] {
        return appDel.ingredients
    }
    
    
    func comboxSeletionView(combox: SWComboxView) -> SWComboxSelectionView {
        return SWComboxTextSelection()
    }
    
    func configureComboxCell(combox: SWComboxView, cell: inout SWComboxSelectionCell) {}
}

// SWComboxViewDelegate
extension Step4VC : SWComboxViewDelegate {
    func comboxSelected(atIndex index:Int, object: Any, combox withCombox: SWComboxView) {
        appDel.selInd = index
    }
    
    func comboxOpened(isOpen: Bool, combox: SWComboxView) {}
}
