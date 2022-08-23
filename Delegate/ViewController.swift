//
//  ViewController.swift
//  Delegate
//
//  Created by Даша Волошина on 23.08.22.
//

//ДЗ: Из предыдущего ДЗ или СР берем джойстик. нажатие кнопок и другие настройки(на ваш выбор 2)(Например установка цвета бэкграунда или настройка кнопок) делаем в ViewController для джойстика через делегат (1 проект) и кложеры (2 проект
import UIKit


protocol Backround : AnyObject {
    var backgroundColorView: UIColor { get set }
}


class View:UIView {
    
 weak var delegate: Backround?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        backgroundColor = delegate?.backgroundColorView
    }
}

class ViewController: UIViewController, Backround {
   
    var button = UIButton(frame: CGRect(x: 0, y: 100, width: 60, height: 30))
    @IBOutlet weak var view1: View!
    
    var backgroundColorView: UIColor = .systemMint
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.delegate = self
        
        view.addSubview(button)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 10
        button.center.x = view1.center.x
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
    }

    @objc func buttonTap(_ sender:UIButton){
        var second = UIStoryboard(name: "Main", bundle: nil)
        guard let secondView = storyboard!.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {return}
        
        secondView.changeColor = { [weak self] in
            self?.button.backgroundColor = .yellow
            self?.button.setTitleColor(.black, for: .normal)
        }
//       
        
        secondView.modalPresentationStyle = .fullScreen
        present(secondView, animated: true)
        
    }
}

