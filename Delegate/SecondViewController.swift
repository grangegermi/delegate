//
//  SecondViewController.swift
//  Delegate
//
//  Created by Даша Волошина on 23.08.22.
//

import UIKit


class New:UIView {
    
    var action: ((UIButton) -> ())?
    @IBOutlet weak var button1: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .orange
        button1.backgroundColor = .gray
       
    }
    
    @IBAction func someAction(_ sender: UIButton) {
        action?(button1)
        backgroundColor = .darkGray
    }
    
}

class SecondViewController: UIViewController {
 
    @IBOutlet weak var view2: New!
   
    let buttonUp = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    let buttonDown = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    let buttonLeft =  UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    let buttonRight = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    let button = UIButton(frame: CGRect(x: 0, y: 100, width: 60, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view2.center = view.center
        view2.addSubview(buttonUp)
        view2.addSubview(buttonDown)
        view2.addSubview(buttonLeft)
        view2.addSubview(buttonRight)

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
        buttonUp.centerXAnchor.constraint(equalTo:view2.centerXAnchor).isActive =  true
        buttonUp.topAnchor.constraint(equalTo: view2.topAnchor, constant: 20).isActive = true
        buttonUp.widthAnchor.constraint(equalToConstant: 60).isActive = true
        buttonUp.layer.cornerRadius = 10

        buttonDown.translatesAutoresizingMaskIntoConstraints = false
        buttonDown.centerXAnchor.constraint(equalTo:view2.centerXAnchor).isActive =  true
        buttonDown.bottomAnchor.constraint(equalTo: view2.bottomAnchor, constant: -20).isActive = true
        buttonDown.widthAnchor.constraint(equalToConstant: 60).isActive = true
        buttonDown.layer.cornerRadius = 10

        buttonLeft.translatesAutoresizingMaskIntoConstraints = false
        buttonLeft.centerYAnchor.constraint(equalTo: view2.centerYAnchor).isActive =  true
        buttonLeft.leftAnchor.constraint(equalTo: view2.leftAnchor, constant: 20).isActive = true
        buttonLeft.widthAnchor.constraint(equalToConstant: 60).isActive = true
        buttonLeft.layer.cornerRadius = 10

        buttonRight.translatesAutoresizingMaskIntoConstraints = false
        buttonRight.centerYAnchor.constraint(equalTo:view2.centerYAnchor).isActive =  true
        buttonRight.rightAnchor.constraint(equalTo: view2.rightAnchor, constant: -20).isActive = true
        buttonRight.widthAnchor.constraint(equalToConstant: 60).isActive = true
        buttonRight.layer.cornerRadius = 10
         
        view2.action = {[weak self] button1 in
            self?.someAction(button1)
      
            }
        }

    @objc func buttonTap (_ sender:UIButton) {
     
    dismiss(animated: true)
    
    }

    func someAction(_ sender: UIButton) {
        
     print ("Action is true")
        
    }
  
 
}
    
   

