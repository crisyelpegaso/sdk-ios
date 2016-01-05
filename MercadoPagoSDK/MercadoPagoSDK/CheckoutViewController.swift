//
//  CheckoutViewController.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 28/12/15.
//  Copyright © 2015 MercadoPago. All rights reserved.
//

import UIKit

public class CheckoutViewController: VaultViewController {

    public var preference : CheckoutPreference!
    public var merchantPreferenceUri : String!
    
    public init(preference : CheckoutPreference, publicKey : String!, merchantAccessToken: String!, merchantBaseUrl : String?, getCustomerUri : String?, supportedPaymentTypes : [String]! , callback: (paymentMethod: PaymentMethod, tokenId: String?, issuerId: NSNumber?, installments: Int) -> Void) {
        super.init()
        self.preference = preference
        self.callback = callback
        self.supportedPaymentTypes = supportedPaymentTypes
        self.publicKey = publicKey
        self.acceptAccoutMoney = true
        self.merchantBaseUrl = merchantBaseUrl
        self.merchantAccessToken = merchantAccessToken
        self.getCustomerUri = getCustomerUri
        
        NSNotificationCenter.defaultCenter().addObserverForName("payWithAccountMoney", object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: {(NSNotification) -> Void in
            self.openMPApp()
        })

    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
       

    }
    
    func openMPApp() {
        let appUrl = NSURL(string : "mpago://checkout?pref_id=" + self.preference.id)!
        if UIApplication.sharedApplication().canOpenURL(appUrl) {
            UIApplication.sharedApplication().openURL(appUrl)
        } else {
            let alert = UIAlertView()
            alert.delegate = self
            alert.title = "MPAPP NEEDED"
            alert.message = "You need to install mercado pago"
            alert.addButtonWithTitle("Download App")
            alert.addButtonWithTitle("Cancel")
            alert.show()
        }
        
    }
    
    func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){
        switch buttonIndex{
        case 0:
            let downloadMPFromAppStoreUrl = NSURL(string : "itms://itunes.apple.com/us/app/apple-store/925436649")!
            if UIApplication.sharedApplication().canOpenURL(downloadMPFromAppStoreUrl) {
                UIApplication.sharedApplication().openURL(downloadMPFromAppStoreUrl)
            } else {
                let downloadMPUrl = NSURL(string : "https://itunes.apple.com/us/app/mercadopago/id925436649")!

                UIApplication.sharedApplication().openURL(downloadMPUrl)
            }
            break
        case 1:
            break
        default:
            break
        }
    }

}
