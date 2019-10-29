//
//  Step1VC.swift
//  Multiviasta
//
//  Created by Eric on 2019/10/8.
//  Copyright © 2019 Javier. All rights reserved.
//

import UIKit

class Step1VC: UIViewController {

    
    @IBOutlet weak var sizeCombox: SWComboxView!
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sizeCombox.defaultSelectedIndex = appDel.selSize
        sizeCombox.dataSource = self
        sizeCombox.delegate = self
        sizeCombox.showMaxCount = 4
    }
    
    @IBAction func nextStep2(_ sender: UIButton) {
        performSegue(withIdentifier: "nextStep2Segue", sender: self)
    }
}

// SWComboxViewDataSourcce
extension Step1VC: SWComboxViewDataSourcce {
    func comboBoxSeletionItems(combox: SWComboxView) -> [Any] {
        return appDel.sizes
    }
    
    func comboxSeletionView(combox: SWComboxView) -> SWComboxSelectionView {
        return SWComboxTextSelection()
    }
    
    func configureComboxCell(combox: SWComboxView, cell: inout SWComboxSelectionCell) {}
}

// SWComboxViewDelegate
extension Step1VC : SWComboxViewDelegate {
    func comboxSelected(atIndex index:Int, object: Any, combox withCombox: SWComboxView) {
        appDel.selSize = index
    }
    
    func comboxOpened(isOpen: Bool, combox: SWComboxView) {}
}
