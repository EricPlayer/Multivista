//
//  Step3VC.swift
//  Multiviasta
//
//  Created by Eric on 2019/10/8.
//  Copyright © 2019 Javier. All rights reserved.
//

import UIKit

class Step3VC: UIViewController {

    @IBOutlet weak var cheeseCombox: SWComboxView!
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cheeseCombox.defaultSelectedIndex = appDel.selCheese
        cheeseCombox.dataSource = self
        cheeseCombox.delegate = self
        cheeseCombox.showMaxCount = 4
    }
    
    @IBAction func prevStep2(_ sender: UIButton) {
        performSegue(withIdentifier: "prevStep2Segue", sender: self)
    }
    
    @IBAction func nextStep3(_ sender: UIButton) {
        performSegue(withIdentifier: "nextStep4Segue", sender: self)
    }
}

// SWComboxViewDataSourcce
extension Step3VC: SWComboxViewDataSourcce {
    func comboBoxSeletionItems(combox: SWComboxView) -> [Any] {
        return appDel.cheeses
    }
    
    
    func comboxSeletionView(combox: SWComboxView) -> SWComboxSelectionView {
        return SWComboxTextSelection()
    }
    
    func configureComboxCell(combox: SWComboxView, cell: inout SWComboxSelectionCell) {}
}

// SWComboxViewDelegate
extension Step3VC : SWComboxViewDelegate {
    func comboxSelected(atIndex index:Int, object: Any, combox withCombox: SWComboxView) {
        appDel.selCheese = index
    }
    
    func comboxOpened(isOpen: Bool, combox: SWComboxView) {}
}

