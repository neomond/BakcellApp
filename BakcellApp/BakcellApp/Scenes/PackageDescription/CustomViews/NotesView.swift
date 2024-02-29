//
//  NotesView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 29.02.24.
//

import UIKit
import SnapKit
import BakcellUIKit

class NotesView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    var noteTexts: [String] = [] {
        didSet {
            setupNotes()
        }
    }
    
    private lazy var noteTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Qeyd"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = adaptiveColor(.grayText)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(noteTitleLabel)
    }
    
    private func setupConstraints() {
        stackView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupNotes() {
        for text in noteTexts {
            let noteLabel = UILabel()
            noteLabel.setBulletText([text], font: UIFont.systemFont(ofSize: 15), bulletColor: adaptiveColor(.black), textColor: adaptiveColor(.grayText))
            stackView.addArrangedSubview(noteLabel)
        }
    }
}
