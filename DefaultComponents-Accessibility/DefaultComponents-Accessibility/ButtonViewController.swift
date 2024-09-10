//
//  ButtonViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/9/24.
//

import UIKit

final class ButtonViewController: UIViewController {
    
    lazy var textButton = UIButton()
    lazy var imageButton = UIButton()
    lazy var textWithImageButton = UIButton()
    lazy var textWithSubtitleButton = UIButton()
    
    private var imageButtonConfiguration = UIButton.Configuration.plain()
    private var isLightOn: Bool = false {
        didSet {
            imageButtonConfiguration.image = isLightOn ? imageLightOff : imageLightOn
            imageButton.configuration = imageButtonConfiguration
        }
    }
    private var imageLightOn = UIImage(named: "light_on")
    private var imageLightOff = UIImage(named: "light_off")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureView()
        configureConstraints()
    }
}

private extension ButtonViewController {
    func configureSubViews() {
        var textConfiguration = UIButton.Configuration.plain()
        textConfiguration.title = "텍스트 타입"
        textButton.configuration = textConfiguration
        
        imageButtonConfiguration.image = imageLightOff
        imageButton.configuration = imageButtonConfiguration
        imageButton.clipsToBounds = true
        imageButton.addTarget(self, action: #selector(didTouchUpInside), for: .touchUpInside)
        
        var textWithImageConfiguration = UIButton.Configuration.plain()
        textWithImageConfiguration.image = UIImage(systemName: "pencil")
        textWithImageConfiguration.title = "연필"
        textWithImageButton.configuration = textWithImageConfiguration
        
        var textWithSubtitleConfiguration = UIButton.Configuration.plain()
        textWithSubtitleConfiguration.title = "더보기"
        textWithSubtitleConfiguration.subtitle = "상세 내용이 궁금하다면 더보기를 탭하세요"
        textWithSubtitleButton.configuration = textWithSubtitleConfiguration
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    func configureConstraints() {
        [ textButton, imageButton, textWithImageButton, textWithSubtitleButton ]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }
        
        let verticalInset: CGFloat = 20
        let horizontalInset: CGFloat = 10
        
        NSLayoutConstraint.activate([
            textButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalInset),
            textButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            textButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            
            imageButton.topAnchor.constraint(equalTo: textButton.bottomAnchor, constant: verticalInset),
            imageButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            imageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            
            textWithImageButton.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: verticalInset),
            textWithImageButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            textWithImageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            
            textWithSubtitleButton.topAnchor.constraint(equalTo: textWithImageButton.bottomAnchor, constant: verticalInset),
            textWithSubtitleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            textWithSubtitleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
        ])
    }
}

extension ButtonViewController {
    @objc func didTouchUpInside(_ sender: UIButton) {
        isLightOn.toggle()
    }
}
