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
        label.text = "change me"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: LabelFontSize.small, weight: LabelFontWeight.regular)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("tap me", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 8
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
            
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func buttonTapped() {
        if isLabelLarge {
            UIView.animate(withDuration: 0.7, delay: 0 ,options: .curveEaseInOut) {
                self.label.transform = .identity
            } completion: { _ in
                UIView.transition(with: self.label, duration: 0.5, options: .transitionCrossDissolve) {
                    self.label.font = UIFont.systemFont(ofSize: LabelFontSize.small, weight: LabelFontWeight.regular)
                }
                self.isLabelLarge = false
            }
        } else {
            UIView.animate(withDuration: 0.7, delay: 0 ,options: .curveEaseInOut) {
                self.label.transform = CGAffineTransform(rotationAngle: .pi)
            } completion: { _ in
                UIView.transition(with: self.label, duration: 0.5, options: .transitionCrossDissolve) {
                    self.label.font = UIFont.systemFont(ofSize: LabelFontSize.large, weight: LabelFontWeight.bold)
                }
                self.isLabelLarge = true
            }
        }
    }
}

