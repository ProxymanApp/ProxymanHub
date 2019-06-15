//
//  ContentViewController.swift
//  ProxymanHub
//
//  Created by Nghia Tran on 6/15/19.
//  Copyright © 2019 Nghia Tran. All rights reserved.
//

import Cocoa
import Alamofire

class ContentViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var loaderView: NSProgressIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.selectSourceOnChange(_:)),
                                               name: NSNotification.Name("SourceDidSelectNotification"),
                                               object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func selectSourceOnChange(_ noti: Notification) {
        guard let source = noti.object as? SourceType else { return }

        if let request = source.request() as? DataRequest {

            loaderView.startAnimation(self)
            loaderView.isHidden = false

            // Execute
            request.responseJSON {[weak self] (response) in
                guard let strongSelf = self else { return }

                strongSelf.loaderView.stopAnimation(nil)
                strongSelf.loaderView.isHidden = true

                switch response.result {
                case .failure(let error):
                    strongSelf.handle(error)
                case .success:
                    strongSelf.handle(response.response, data: response.data)
                }
            }
        }
    }

    private func handle(_ error: Error) {
        let content = "[ERROR]: \(error.localizedDescription)"
        textView.string = content
    }

    private func handle(_ response: HTTPURLResponse?, data: Data?) {
        guard let response = response else {
            textView.string = "Nil response"
            return
        }

        var content = "Code \(response.statusCode)\n"
        if let data = data {
            content += String(data: data, encoding: .utf8) ?? ""
        }
        textView.string = content
    }
}
