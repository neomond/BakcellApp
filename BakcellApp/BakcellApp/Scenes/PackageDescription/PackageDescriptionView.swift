//
//  PackageDescriptionView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 28.02.24.
//

import UIKit
import BakcellUIKit

protocol PackageDescriptionViewDelegate: AnyObject { }

final class PackageDescriptionView: UIView, ThemeableView {
    
    weak var delegate: PackageDescriptionViewDelegate?
    
    var theme: ThemeProvider = App.theme
    
    private lazy var scrollView: UIScrollView = {
        let scrollView          = UIScrollView()
        return scrollView
    }()
    
    
    private lazy var backView: UIView = {
        let view           = UIView()
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView           = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    
  
    private lazy var pckgsView: PackagesView = {
        let view = PackagesView()
        return view
        }()
  
    
    private lazy var checkCountryButton: CheckCountryButton = {
           let button = CheckCountryButton()
           return button
       }()
    

    private lazy var paddingView: UIView = {
        let view                = UIView()
        view.backgroundColor    = adaptiveColor(.whitePrimary).withAlphaComponent(0.5)
        return view
    }()
    
    
    private lazy var activateButton: UIButton = {
        let button              = UIButton(type: .system)
        button.setTitle("Aktivləşdir", for: .normal)
        button.backgroundColor  = adaptiveColor(.main)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return button
    }()
    
    
    private lazy var notesView: NotesView = {
            let view = NotesView()
            view.noteTexts = [
                "İnternetin tarifkasiyası – 100 KB.",
                "Paket hər gecə saat 00:00-da avtomatik olaraq yenilənir.",
                "Təqdim edilən paket bitdikdən sonra paketsiz rouming qiymətləri tətbiq edilir və balansınızda olan vəsaitdən çıxılacaq."
            ]
            return view
        }()
    
    
    private lazy var aboutView: AboutView = {
            let view = AboutView()
            view.detailTexts = [
                "Pulsuz WhatsApp zəng və mesajlar üçündür.",
                "Digər WhatsApp funksiyalarından istifadə edildikdə, xidmət haqqı paketsiz rouming qiymətləri ilə hesablanacaq."
            ]
            return view
        }()
    
    
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
//        self.setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        setupConstraints()
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
       
        
        self.addSubview(scrollView)
        self.scrollView.addSubview(self.backView)
        self.backView.addSubview(self.contentStackView)
        
        self.addSubview(paddingView)
        self.addSubview(activateButton)
        
        self.contentStackView.addArrangedSubview(pckgsView)
        self.contentStackView.addArrangedSubview(checkCountryButton)

        

        self.contentStackView.addArrangedSubview(aboutView)
     
        self.contentStackView.addArrangedSubview(notesView)
        
    }
    
    
    private func setupUI() {
        self.backgroundColor = .white
    }
    
    
    
    private func setupConstraints() {
        self.scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView)
        }
        self.contentStackView.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        ///------------------------------------------
 
   
        //        backImgView.snp.makeConstraints { make in
        //            make.width.height.equalTo(40)
        //        }
        //        itemImageView.snp.makeConstraints { make in
        //            make.width.height.equalTo(20)
        //            make.center.equalTo(backImgView.snp.center)
        //        }
        
        checkCountryButton.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        
        ///------------------------------------------
        ///
        ///
        //        ///
        //        paddingView.snp.makeConstraints { make in
        //            make.top.equalTo(backView.snp.bottom)
        //            make.leading.trailing.equalToSuperview()
        //            make.bottom.equalTo(activateButton.snp.top)
        //            make.height.equalTo(24)
        //           }
        //
        //        activateButton.snp.makeConstraints { make in
        //            make.leading.equalToSuperview().offset(16)
        //            make.trailing.equalToSuperview().offset(-16)
        //            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-16)
        //            make.height.equalTo(56)
        //        }
    }
    
}
