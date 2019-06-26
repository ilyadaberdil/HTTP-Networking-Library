//
//  ViewController.swift
//  SampleApp
//
//  Created by Berdil İlyada Karacam on 20.06.2019.
//  Copyright © 2019 Berdil İlyada Karacam. All rights reserved.
//

import UIKit
import ServiceRepository

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //POST Call
        let postServiceExecutor: SamplePostRepositoryProtocol = SamplePostRepository()
        
        showSpinner(onView: view)
        let parameter: SampleParameter = SampleParameter.init(email: "eve.holt@reqres.in", password: "cityslicka")
        postServiceExecutor.postSampleModel(param: parameter) { [weak self] (response) in
            guard let strongSelf = self else { return }
            switch response {
            case .success(let result):
                print("LOGIN SUCCESS - TOKEN: \(result?.token ?? "NIL TITLE")")
                strongSelf.getServiceCall()
            case .failure(let error):
                print("LOGIN FAILED - ERROR: \(error.debugDescription)")
            }
        }
    }
    
    func getServiceCall() {
        //GET Call
        let getServiceExecutor: SampleGetRepositoryProtocol = SampleGetRepository()
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        getServiceExecutor.getSampleModel(url: url) { [weak self] (response) in
            guard let strongSelf = self else { return }
            strongSelf.removeSpinner()
            switch response {
            case .success(let result):
                print("GET METHOD SUCCESS - NAME: \(result?.title ?? "NIL TITLE")")
            case .failure(let error):
                print("GET METHOD FAILED - ERROR: \(error.debugDescription)")
            }
        }
    }
}


var vSpinner : UIView?

extension UIViewController {
    
    func showSpinner(onView : UIView) {
        //let spinnerView = UIView.init(frame: onView.bounds)
        // spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = onView.center
        ai.color = .orange
        DispatchQueue.main.async {
            onView.addSubview(ai)
            //onView.addSubview(spinnerView)
        }
        
        vSpinner = ai
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
