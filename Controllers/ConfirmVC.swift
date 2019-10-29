//
//  ConfirmVC.swift
//  Multiviasta
//
//  Created by Eric on 2019/10/8.
//  Copyright © 2019 Javier. All rights reserved.
//

import UIKit

class ConfirmVC: UIViewController {
    
    @IBOutlet weak var conSizeCombox: SWComboxView!
    @IBOutlet weak var conDoughCombox: SWComboxView!
    @IBOutlet weak var conCheeseCombox: SWComboxView!
    @IBOutlet weak var conIngredientCombox: SWComboxView!
    
    let appDel = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        conSizeCombox.defaultSelectedIndex = appDel.selSize
        conSizeCombox.dataSource = self
        conSizeCombox.delegate = self
        conSizeCombox.showMaxCount = 4
        
        conDoughCombox.defaultSelectedIndex = appDel.selDough
        conDoughCombox.dataSource = self
        conDoughCombox.delegate = self
        conDoughCombox.showMaxCount = 4
        
        conCheeseCombox.defaultSelectedIndex = appDel.selCheese
        conCheeseCombox.dataSource = self
        conCheeseCombox.delegate = self
        conCheeseCombox.showMaxCount = 4
        
        conIngredientCombox.defaultSelectedIndex = appDel.selInd
        conIngredientCombox.dataSource = self
        conIngredientCombox.delegate = self
        conIngredientCombox.showMaxCount = 4
    }
    
    @IBAction func onConfirm(_ sender: UIButton) {
        performSegue(withIdentifier: "onOrderSegue", sender: self)
    }
}

// SWComboxViewDataSourcce
extension ConfirmVC: SWComboxViewDataSourcce {
    func comboBoxSeletionItems(combox: SWComboxView) -> [Any] {
        if combox == conSizeCombox {
            return appDel.sizes
        } else if combox == conDoughCombox {
            return appDel.doughs
        } else if combox == conCheeseCombox {
            return appDel.cheeses
        }
        return appDel.ingredients
    }
    
    
    func comboxSeletionView(combox: SWComboxView) -> SWComboxSelectionView {
        return SWComboxTextSelection()
    }
    
    func configureComboxCell(combox: SWComboxView, cell: inout SWComboxSelectionCell) {}
}

// SWComboxViewDelegate
extension ConfirmVC : SWComboxViewDelegate {
    func comboxSelected(atIndex index: Int, object: Any, combox withCombox: SWComboxView) {
        if withCombox == conSizeCombox {
            appDel.selSize = index
        } else if withCombox == conDoughCombox {
            appDel.selDough = index
        } else if withCombox == conCheeseCombox {
            appDel.selCheese = index
        } else {
            appDel.selInd = index
        }
    }
    
    func comboxOpened(isOpen: Bool, combox: SWComboxView) {}
}
