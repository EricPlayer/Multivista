//
//  Step2VC.swift
//  Multiviasta
//
//  Created by Eric on 2019/10/8.
//  Copyright © 2019 Javier. All rights reserved.
//

import UIKit

class Step2VC: UIViewController {

    @IBOutlet weak var doughCombox: SWComboxView!
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doughCombox.defaultSelectedIndex = appDel.selDough
        doughCombox.dataSource = self
        doughCombox.delegate = self
        doughCombox.showMaxCount = 4
    }
    
    @IBAction func nextStep3(_ sender: UIButton) {
        performSegue(withIdentifier: "nextStep3Segue", sender: self)
    }
    
    @IBAction func prevStep1(_ sender: UIButton) {
        performSegue(withIdentifier: "prevStep1Segue", sender: self)
    }
}

// SWComboxViewDataSourcce
extension Step2VC: SWComboxViewDataSourcce {
    func comboBoxSeletionItems(combox: SWComboxView) -> [Any] {
        return appDel.doughs
    }
    
    
    func comboxSeletionView(combox: SWComboxView) -> SWComboxSelectionView {
        return SWComboxTextSelection()
    }
    
    func configureComboxCell(combox: SWComboxView, cell: inout SWComboxSelectionCell) {}
}

// SWComboxViewDelegate
extension Step2VC : SWComboxViewDelegate {
    func comboxSelected(atIndex index:Int, object: Any, combox withCombox: SWComboxView) {
        appDel.selDough = index
    }
    
    func comboxOpened(isOpen: Bool, combox: SWComboxView) {}
}
