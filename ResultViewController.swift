//
//  ResultViewController.swift
//  SampleApp
//
//  Created by 越智友香 on 2024/12/12.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setOmikujiResult()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet private weak var resultLabel: UILabel!
    private let omikujiText: [String] = [
        "大吉",
        "中吉",
        "小吉",
        "吉",
        "末吉",
        "凶",
        "大凶"
    ]
    private func setOmikujiResult() {
        let randomInt = Int.random(in: 0..<7)
        resultLabel.text = String(omikujiText[randomInt])
    }

    @IBAction private func backButtonAction() {
        dismiss(animated: true)
    }

}
