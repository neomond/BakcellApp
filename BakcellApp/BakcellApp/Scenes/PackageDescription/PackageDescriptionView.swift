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
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    
    private lazy var backView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
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
        let view = UIView()
        view.backgroundColor = adaptiveColor(.whitePrimary).withAlphaComponent(0.8)
        return view
    }()
    
    private lazy var fixedActivateButtonView: FixedActivateButtonView = {
        let view = FixedActivateButtonView()
        return view
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
        self.addSubview(self.paddingView)
        self.addSubview(self.fixedActivateButtonView)
        self.contentStackView.addArrangedSubview(self.pckgsView)
        self.contentStackView.addArrangedSubview(self.checkCountryButton)
        self.contentStackView.addArrangedSubview(self.aboutView)
        self.contentStackView.addArrangedSubview(self.notesView)
        
    }
    
    
    private func setupUI() {
        self.backgroundColor = .white
    }
    
    
    private func setupConstraints() {
        self.scrollView.snp.updateConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(fixedActivateButtonView.snp.top)
        }
        self.backView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView)
        }
        self.contentStackView.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        self.fixedActivateButtonView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
        }
        self.paddingView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(fixedActivateButtonView.snp.top)
            make.height.equalTo(24)
        }
        self.checkCountryButton.snp.updateConstraints { make in
            make.height.equalTo(56)
        }
    }
    
}
