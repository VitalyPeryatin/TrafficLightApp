//
//  ViewController.swift
//  TrafficLightApp
//
//  Created by Виталий on 03.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var toggleLightButton: UIButton!
    
    private var activeLightView: UIView?
    
    private var lightIsOn: CGFloat = 1
    private var lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toggleLightButton.layer.cornerRadius = 12
        toggleLightButton.setTitle("START", for: .normal)
        
        redLightView.alpha = lightIsOff
        yellowLightView.alpha = lightIsOff
        greenLightView.alpha = lightIsOff
    }
    
    override func viewWillLayoutSubviews() {
        roundCornersFor(view: redLightView)
        roundCornersFor(view: yellowLightView)
        roundCornersFor(view: greenLightView)
    }

    @IBAction func toggleLightButtonPressed() {
        if (activeLightView == nil) {
            toggleLightButton.setTitle("NEXT", for: .normal)
        }
        
        activeLightView?.alpha = lightIsOff
        
        switch activeLightView {
        case nil, greenLightView:
            activeLightView = redLightView
        case redLightView:
            activeLightView = yellowLightView
        case yellowLightView:
            activeLightView = greenLightView
        default:
            break
        }
        activeLightView?.alpha = lightIsOn
    }
    
    private func roundCornersFor(view: UIView) {
        view.layer.cornerRadius = view.frame.width / 2
    }
    
}

