//
//  CheckoutViewController.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 13/1/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    var preference : CheckoutPreference?
    
    init(preference : CheckoutPreference){
        super.init(nibName: "CheckoutViewController", bundle: nil)
        self.preference = preference
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MPFlowBuilder.startVaultViewController(preference!.getAmount(), supportedPaymentTypes: ["credit_card"]) { (paymentMethod, tokenId, issuerId, installments) -> Void in
            //TODO : post payment
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
