//
//  OrderVC.swift
//  Multiviasta
//
//  Created by Eric on 2019/10/8.
//  Copyright © 2019 Javier. All rights reserved.
//

import UIKit

class OrderVC: UIViewController {

    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var doughLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var ingredientLabel: UILabel!
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sizeLabel.text = appDel.sizes[appDel.selSize]
        doughLabel.text = appDel.doughs[appDel.selDough]
        typeLabel.text = appDel.cheeses[appDel.selCheese]
        ingredientLabel.text = appDel.ingredients[appDel.selInd]
    }
}
