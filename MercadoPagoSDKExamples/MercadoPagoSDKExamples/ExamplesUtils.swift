//
//  ExamplesUtils.swift
//  MercadoPagoSDK
//
//  Created by Matias Gualino on 29/1/15.
//  Copyright (c) 2015 com.mercadopago. All rights reserved.
//

import UIKit
import MercadoPagoSDK

class ExamplesUtils {
    class var MERCHANT_PUBLIC_KEY : String {
		return "444a9ef5-8a6b-429f-abdf-587639155d88"
		// "444a9ef5-8a6b-429f-abdf-587639155d88" // AR
		// "APP_USR-f163b2d7-7462-4e7b-9bd5-9eae4a7f99c3" // BR
		// "6c0d81bc-99c1-4de8-9976-c8d1d62cd4f2" // MX
		// "2b66598b-8b0f-4588-bd2f-c80ca21c6d18" // VZ
		// "aa371283-ad00-4d5d-af5d-ed9f58e139f1" // CO
    }
    class var MERCHANT_MOCK_BASE_URL : String {
        return "https://www.mercadopago.com"
    }
    class var MERCHANT_MOCK_GET_CUSTOMER_URI : String {
        return "/checkout/examples/getCustomer"
    }
    
    class var MERCHANT_MOCK_CREATE_PAYMENT_URI : String {
        return  "/checkout/examples/doPayment"
    }
    class var MERCHANT_MOCK_GET_DISCOUNT_URI : String {
        return  "/checkout/examples/getDiscounts"
    }

    class var MERCHANT_ACCESS_TOKEN : String {
        return "mla-cards-data"
		// "mla-cards-data" // AR
		// "mlb-cards-data" // BR
		// "mlm-cards-data" // MX
		// "mlv-cards-data" // VZ
		// "mco-cards-data" // CO
		// "mla-cards-data-tarshop" // NO CVV
        // return "mla-cards-data-tarshop" // No CVV
    }
    class var AMOUNT : Double {
        return 999.99
    }
    
    class var ITEM_ID : String {
        return "id1"
    }
    
    class var ITEM_QUANTITY : Int {
        return 1
    }
    
    class var ITEM_UNIT_PRICE : Double {
        return 100.00
    }
    
    class var PREF_ID_MOCK : String {
        return "167834996-099394f5-1e5a-4a43-b4aa-26e4bd60e0f2"
    }
 
    class func startCardActivity(merchantPublicKey: String, paymentMethod: PaymentMethod, callback: (token: Token?) -> Void) -> CardViewController {
        return CardViewController(merchantPublicKey: merchantPublicKey, paymentMethod: paymentMethod, callback: callback)
    }
    
    class func startSimpleVaultActivity(merchantPublicKey: String, merchantBaseUrl: String, merchantGetCustomerUri: String, merchantAccessToken: String, supportedPaymentTypes: [String], callback: (paymentMethod: PaymentMethod, token: Token?) -> Void) -> SimpleVaultViewController {
        return SimpleVaultViewController(merchantPublicKey: merchantPublicKey, merchantBaseUrl: merchantBaseUrl, merchantGetCustomerUri: merchantGetCustomerUri, merchantAccessToken: merchantAccessToken, supportedPaymentTypes: supportedPaymentTypes, callback: callback)
    }
    
    class func startAdvancedVaultActivity(merchantPublicKey: String, merchantBaseUrl: String, merchantGetCustomerUri: String, merchantAccessToken: String, amount: Double, supportedPaymentTypes: [String], callback: (paymentMethod: PaymentMethod, token: String?, issuerId: NSNumber?, installments: Int) -> Void) -> AdvancedVaultViewController {
        return AdvancedVaultViewController(merchantPublicKey: merchantPublicKey, merchantBaseUrl: merchantBaseUrl, merchantGetCustomerUri: merchantGetCustomerUri, merchantAccessToken: merchantAccessToken, amount: amount, supportedPaymentTypes: supportedPaymentTypes, callback: callback)
    }
    
    class func startFinalVaultActivity(merchantPublicKey: String, merchantBaseUrl: String, merchantGetCustomerUri: String, merchantAccessToken: String, amount: Double, supportedPaymentTypes: [String], callback: (paymentMethod: PaymentMethod, token: String?, issuerId: NSNumber?, installments: Int) -> Void) -> FinalVaultViewController {
        return FinalVaultViewController(merchantPublicKey: merchantPublicKey, merchantBaseUrl: merchantBaseUrl, merchantGetCustomerUri: merchantGetCustomerUri, merchantAccessToken: merchantAccessToken, amount: amount, supportedPaymentTypes: supportedPaymentTypes, callback: callback)
    }
    
    class func createPayment(token: String, installments: Int, cardIssuerId: NSNumber?, paymentMethod: PaymentMethod, callback: (payment: Payment) -> Void) {
        // Set item
        let item : Item = Item(_id: ExamplesUtils.ITEM_ID, quantity: ExamplesUtils.ITEM_QUANTITY,
            unitPrice: ExamplesUtils.ITEM_UNIT_PRICE)

		let issuerId : NSNumber = cardIssuerId == nil ? 0 : cardIssuerId!
		
        // Set merchant payment
        let payment : MerchantPayment = MerchantPayment(items: [item], installments: installments, cardIssuerId: issuerId, token: token, paymentMethodId: paymentMethod._id, campaignId: 0, merchantAccessToken: ExamplesUtils.MERCHANT_ACCESS_TOKEN)
        
        // Create payment
        MerchantServer.createPayment(ExamplesUtils.MERCHANT_MOCK_BASE_URL, merchantPaymentUri: ExamplesUtils.MERCHANT_MOCK_CREATE_PAYMENT_URI, payment: payment, success: callback, failure: nil)
    }
    
    class func createCheckoutPreference() -> CheckoutPreference {
        
        // Create items
        let item_1 : Item = Item(_id: ExamplesUtils.ITEM_ID, quantity: ExamplesUtils.ITEM_QUANTITY,
            unitPrice: ExamplesUtils.ITEM_UNIT_PRICE)
        var items = [Item]()
        items.append(item_1)
        
        //Create Payer
        let payer = Payer()
        payer._id = 2
        payer.email = "thisis@nemail.com"
        
        //Create CheckoutPreference
        let preference = CheckoutPreference()
        preference.id = ExamplesUtils.PREF_ID_MOCK
        preference.items = items
        preference.payer = payer
        
        return preference
    }
}
