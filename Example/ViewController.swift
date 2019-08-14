//
//  ViewController.swift
//  Example
//
//  Created by Ian Grossberg on 8/14/19.
//

import UIKit
import AEConsole

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        AppDelegate.logger.info("ViewController viewDidLoad")
    }

    @IBAction func log() {
        AppDelegate.logger.info("Logged from ViewController")
    }

    @IBAction func toggleConsole() {
        Console.shared.toggle()
    }
}

