//
//  ViewController.swift
//  Quizzler
//
//  Created by Игорь Клевжиц on 26.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var backgoundImageView: UIImageView = {
        let element = UIImageView(image: UIImage(named: "Background"))
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var scoreLabel: UILabel = {
        let element = UILabel()
        element.text = "Score: 0"
        element.textAlignment = .center
        element.textColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var questionLabel: UILabel = {
        let element = UILabel()
        element.text = "Question"
        element.textColor = .white
        element.numberOfLines = 0
        element.font = .systemFont(ofSize: 30, weight: .bold)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let element = UIStackView()
        element.distribution = .fillEqually
        element.axis = .vertical
        element.spacing = 10
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var ansewerOne = UIButton(name: "Heart")
    private var ansewerTwo = UIButton(name: "Skin")
    private var ansewerThree = UIButton(name: "Learge Intestine")
    
    private lazy var timerView: UIView = {
        let element = UIView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var progressView: UIProgressView = {
        let element = UIProgressView()
        element.progressTintColor = .systemPink
        element.trackTintColor = .white
        element.progress = 0.5
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Private Properties
    
    private let spasing: CGFloat = 10
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setupConstraints()
    }

}

extension ViewController {
    
    // MARK: - Set Views
    
    private func setViews() {
        
        view.backgroundColor = #colorLiteral(red: 0.1923559308, green: 0.2327082157, blue: 0.3624993563, alpha: 1)

        view.addSubview(backgoundImageView)
        
        view.addSubview(scoreLabel)
        view.addSubview(questionLabel)
        
        view.addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(ansewerOne)
        buttonsStackView.addArrangedSubview(ansewerTwo)
        buttonsStackView.addArrangedSubview(ansewerThree)
        
        view.addSubview(timerView)
        timerView.addSubview(progressView)
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            backgoundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgoundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgoundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: spasing),
            scoreLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -spasing),
            scoreLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),
            
            questionLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: spasing),
            questionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: spasing),
            questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -spasing),
            questionLabel.bottomAnchor.constraint(equalTo: buttonsStackView.topAnchor),
            
            buttonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: spasing),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -spasing),
            buttonsStackView.bottomAnchor.constraint(equalTo: timerView.topAnchor),
            
            ansewerOne.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1),
            
            timerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: spasing),
            timerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -spasing),
            timerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            timerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),
            
            progressView.centerYAnchor.constraint(equalTo: timerView.centerYAnchor),
            progressView.leadingAnchor.constraint(equalTo: timerView.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: timerView.trailingAnchor)
        ])
    }
}

// MARK: - Extentions

extension UIButton {
    convenience init(name: String) {
        self.init(type: .system)
        self.setTitle(name, for: .normal)
        self.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 25, weight: .medium)
        self.tintColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
