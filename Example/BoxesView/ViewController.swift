//
//  ViewController.swift
//  BoxesView
//
//  Created by Lammert Westerhoff on 02/14/2016.
//  Copyright (c) 2016 Lammert Westerhoff. All rights reserved.
//

import UIKit
import BoxesView
import SnapKit

class ViewController: UIViewController {

    @IBOutlet weak var boxesView: BoxesView!
    @IBOutlet weak var photosBoxesView: BoxesView!

    @IBOutlet weak var fixedHeightSwitch: UISwitch!
    @IBOutlet weak var boxHeightSwitch: UISwitch!
    @IBOutlet weak var acpectRatio: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        recreateBoxes()
    }

    @IBAction private func recreateBoxes() {
        boxesView.rowHeight = fixedHeightSwitch.on ? 40 : -1
        photosBoxesView.rowHeight = fixedHeightSwitch.on ? 60 : -1

        boxesView.boxes = [
            colorView(.greenColor(), height: 20),
            colorView(.purpleColor(), height: 15),
            colorView(.yellowColor(), height: 25),
            colorView(.grayColor(), height: 60),
            colorView(.magentaColor(), height: 35),
        ]

        photosBoxesView.boxes = [
            photoView(1),
            photoView(2),
            photoView(3),
            photoView(4),
        ]
    }

    private func colorView(color: UIColor, height: Float? = nil) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        if let height = height where boxHeightSwitch.on {
            view.snp_makeConstraints { make in
                make.height.equalTo(height)
            }
        }
        return view
    }

    private func photoView(index: Int) -> UIView {
        let imageView =
        UIImageView(image: UIImage(named: "photo\(index)")!)
        imageView.contentMode = acpectRatio.on ? .ScaleAspectFit : .ScaleToFill
        return imageView
    }
    
    
}
