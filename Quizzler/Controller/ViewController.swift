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
    
    private lazy var progressView: UIProgressView = {
        let element = UIProgressView()
        element.progressTintColor = .systemPink
        element.trackTintColor = .white
        element.progress = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Private Properties
    
    private let spasing: CGFloat = 20
    var quizBrain = QuizBrain()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setupConstraints()
        updateUI()
    }
    
    // MARK: - Methods
    
    @objc private func answerButtonPressed(_ sender: UIButton) {
        
        if quizBrain.chekAnswer(sender.currentTitle!) {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc private func updateUI() {
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        ansewerOne.setTitle(quizBrain.getAnswerText(0), for: .normal)
        ansewerTwo.setTitle(quizBrain.getAnswerText(1), for: .normal)
        ansewerThree.setTitle(quizBrain.getAnswerText(2), for: .normal)
        progressView.progress = quizBrain.getProgress()
        
        ansewerOne.backgroundColor = .clear
        ansewerTwo.backgroundColor = .clear
        ansewerThree.backgroundColor = .clear
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
        
        view.addSubview(progressView)
        
        ansewerOne.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        ansewerTwo.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        ansewerThree.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
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
            buttonsStackView.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -spasing),
            
            ansewerOne.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1),
            
            progressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: spasing),
            progressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -spasing),
            progressView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -spasing),
            progressView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.01)
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
        self.layer.cornerRadius = 20
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
