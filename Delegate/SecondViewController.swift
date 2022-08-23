//
//  SecondViewController.swift
//  Delegate
//
//  Created by Даша Волошина on 23.08.22.
//

import UIKit


class Delegat:UIButton {
  

    }



class SecondViewController: UIViewController {
 
    var changeColor: (() -> ())?
    
    var view1 = UIView(frame: CGRect(x:0, y: 0, width: 400, height: 400))
    let buttonUp = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    let buttonDown = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    let buttonLeft =  UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    let buttonRight = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    let button = UIButton(frame: CGRect(x: 0, y: 100, width: 60, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(view1)
        view1.backgroundColor = .orange
        view1.center = view.center
        view1.addSubview(buttonUp)
        view1.addSubview(buttonDown)
        view1.addSubview(buttonLeft)
        view1.addSubview(buttonRight)

        view.addSubview(button)
        button.backgroundColor = .systemIndigo
        button.center.x = view.center.x
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        button.layer.cornerRadius = 10

        buttonUp.backgroundColor = .purple
        buttonDown.backgroundColor = .purple
        buttonLeft.backgroundColor = .purple
        buttonRight.backgroundColor = .purple

        
        buttonUp.translatesAutoresizingMaskIntoConstraints = false
        buttonUp.centerXAnchor.constraint(equalTo:view1.centerXAnchor).isActive =  true
        buttonUp.topAnchor.constraint(equalTo: view1.topAnchor, constant: 20).isActive = true
        buttonUp.widthAnchor.constraint(equalToConstant: 60).isActive = true
        buttonUp.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        buttonDown.translatesAutoresizingMaskIntoConstraints = false
        buttonDown.centerXAnchor.constraint(equalTo:view1.centerXAnchor).isActive =  true
        buttonDown.bottomAnchor.constraint(equalTo: view1.bottomAnchor, constant: -20).isActive = true
        buttonDown.widthAnchor.constraint(equalToConstant: 60).isActive = true
//        buttonUp.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        buttonLeft.translatesAutoresizingMaskIntoConstraints = false
        buttonLeft.centerYAnchor.constraint(equalTo: view1.centerYAnchor).isActive =  true
        buttonLeft.leftAnchor.constraint(equalTo: view1.leftAnchor, constant: 20).isActive = true
        buttonLeft.widthAnchor.constraint(equalToConstant: 60).isActive = true
//       buttonUp.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        buttonRight.translatesAutoresizingMaskIntoConstraints = false
        buttonRight.centerYAnchor.constraint(equalTo:view1.centerYAnchor).isActive =  true
        buttonRight.rightAnchor.constraint(equalTo: view1.rightAnchor, constant: -20).isActive = true
        buttonRight.widthAnchor.constraint(equalToConstant: 60).isActive = true
//        buttonUp.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        
        
        }

@objc func buttonTap (_ sender:UIButton){
     
    dismiss(animated: true)
    
    }

    @objc func buttonAction (_ sender:UIButton){
         
        changeColor?()
        
        }
 
}
    
   

