//
//  MPFlowBuilder.swift
//  MercadoPagoSDK
//
//  Created by Demian Tejo on 1/7/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import Foundation

public class MPFlowBuilder : NSObject {
    
    
    
    public class func startVaultViewController(amount: Double, supportedPaymentTypes: [String], callback: (paymentMethod: PaymentMethod, tokenId: String?, issuerId: NSNumber?, installments: Int) -> Void) -> VaultViewController {
        
        return VaultViewController(merchantPublicKey: MercadoPagoContext.publicKey(), merchantBaseUrl: MercadoPagoContext.baseURL(), merchantGetCustomerUri: MercadoPagoContext.customerURI(), merchantAccessToken: MercadoPagoContext.merchantAccessToken(), amount: amount, supportedPaymentTypes: supportedPaymentTypes, callback: callback)
        
        
    }
}
