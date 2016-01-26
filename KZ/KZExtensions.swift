//
//  KZExtensions.swift
//  KZ
//
//  Created by Kesi Maduka on 1/25/16.
//  Copyright © 2016 Storm Edge Apps LLC. All rights reserved.
//

import Foundation

extension UIButton {
    public override func intrinsicContentSize() -> CGSize {
        let intrinsicContentSize = super.intrinsicContentSize()
        let adjustedWidth = intrinsicContentSize.width + titleEdgeInsets.left + titleEdgeInsets.right
        let adjustedHeight = intrinsicContentSize.height + titleEdgeInsets.top + titleEdgeInsets.bottom
        return CGSize(width: adjustedWidth, height: adjustedHeight)
    }
}

extension String {
    func firstCharacterUpperCase() -> String {
        let lowercaseString = self.lowercaseString
        
        return lowercaseString.stringByReplacingCharactersInRange(lowercaseString.startIndex...lowercaseString.startIndex, withString: String(lowercaseString[lowercaseString.startIndex]).uppercaseString)
    }
}

extension UIViewController {
    func showError(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showSuccess(success: String) {
        let alert = UIAlertController(title: "Success", message: success, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func handleResponse(response: AnyObject?, error: NSError?, successCompletion: AnyObject -> Void) {
        handleResponse(response, error: error, successCompletion: successCompletion)
    }
    
    func handleResponse(response: AnyObject?, error: NSError?, successCompletion: (AnyObject -> Void)? = nil, errorCompletion: (() -> Void)? = nil) {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            if let error = error {
                self.showError(error.localizedDescription)
                if let errorCompletion = errorCompletion {
                    errorCompletion()
                }
            } else if let response = response {
                if let success = response["success"] as? Bool  {
                    if success {
                        if let result = response["result"] {
                            if let result = result {
                                if let successCompletion = successCompletion {
                                    successCompletion(result)
                                }
                            }
                        }
                    } else if let error = response["error"] as? String {
                        self.showError(error)
                        if let errorCompletion = errorCompletion {
                            errorCompletion()
                        }
                    }
                }
            }
        })
    }
    
    func goBack() {
        if let nav = self.navigationController {
            nav.popViewControllerAnimated(true)
        } else if let vc = self.presentingViewController {
            vc.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}