//
//  CheckoutViewController.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 13/1/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

public class CheckoutViewController: UIViewController {
    
    var preference : CheckoutPreference?
    var publicKey : String!
    var accessToken : String!
    var bundle : NSBundle? = MercadoPago.getBundle()
    
    init(publicKey : String, accessToken : String, preference : CheckoutPreference){
        super.init(nibName: "CheckoutViewController", bundle: bundle)
        self.preference = preference
        self.publicKey = publicKey
        self.accessToken = accessToken
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        let vaultVC = MercadoPago.startVaultViewController(publicKey, merchantBaseUrl: MercadoPago.MP_API_BASE_URL, merchantGetCustomerUri: MercadoPago.MP_CUSTOMER_URI, merchantAccessToken: accessToken, amount: (preference?.getAmount())!, supportedPaymentTypes: ["credit_card"]) { (paymentMethod, tokenId, issuerId, installments) -> Void in
            
            //TODO: que es el campaginId???
            let payment = MerchantPayment(items: self.preference!.items!, installments: self.preference!.getInstallments(), cardIssuerId: issuerId!, token: tokenId!, paymentMethodId: paymentMethod._id, campaignId: 0, merchantAccessToken: self.accessToken)
            MercadoPago.createMPPayment(payment, success: { (payment) -> Void in
                
                let congratsVC = MercadoPago.startCongratsViewController(payment, paymentMethod: paymentMethod)
                self.navigationController?.pushViewController(congratsVC, animated: true)
                }, failure: { (error) -> Void in
                   MercadoPago.showAlertViewWithError(error, nav: self.navigationController) 
            })
        }
        self.navigationController?.pushViewController(vaultVC, animated: true)
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
