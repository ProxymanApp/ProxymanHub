//
//  ContentViewController.swift
//  ProxymanHub
//
//  Created by Nghia Tran on 6/15/19.
//  Copyright © 2019 Nghia Tran. All rights reserved.
//

import Cocoa

class ContentViewController: NSViewController {

    @IBOutlet var textView: NSTextView!

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
        guard let source = noti.object as? Source else { return }
        
    }
}
