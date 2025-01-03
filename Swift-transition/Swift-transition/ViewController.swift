//
//  ViewController.swift
//  Swift-transition
//
//  Created by Mac on 02/12/2024.
//

import UIKit

class ViewController: UIViewController {
    
    var isLabelLarge = false
    
    fileprivate var label = UILabel()
    
    fileprivate var button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeObjects()
    }
    
    func customizeObjects() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "convert me"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("tap me", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        setSubviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        view.addSubview(label)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    @objc func buttonTapped() {
        if isLabelLarge {
            UIView.animate(withDuration: 0.7, delay: 0 ,options: .curveEaseInOut) {
                self.label.transform = .identity
            } completion: { _ in
                UIView.transition(with: self.label, duration: 0.5, options: .transitionCrossDissolve) {
                    self.label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
                }
                self.isLabelLarge = false
            }
        } else {
            UIView.animate(withDuration: 0.7, delay: 0 ,options: .curveEaseInOut) {
                self.label.transform = CGAffineTransform(scaleX: 2, y: 2)
            } completion: { _ in
                UIView.transition(with: self.label, duration: 0.5, options: .transitionCrossDissolve) {
                    self.label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
                    //self.button.setTitle("New tap me", for: .normal)
                }
                self.isLabelLarge = true
            }
        }
    }
}

