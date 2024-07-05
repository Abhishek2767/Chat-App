//
//  HomeViewController.swift
//  Chat App
//
//  Created by SST PC on 04/07/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Variables
    private let viewModel: HomeProtocol
    
    
    //MARK: - Outlets
    @IBOutlet weak var chatUnderLineView: UIView!
    @IBOutlet weak var statusUnderLineView: UIView!
    @IBOutlet weak var callsUnderLineView: UIView!
    @IBOutlet weak var btnStartChatting: UIButton!
    @IBOutlet weak var noChatView: UIView!
    @IBOutlet weak var chatsTableView: UITableView!
    
    
    @IBOutlet weak var lblNotHaveChat: UILabel!
    
    //MARK: - init
    init(viewModel: HomeProtocol) {
        self.viewModel = viewModel
        super.init(nibName: HomeViewController.className, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillLayoutSubviews() {
        lblNotHaveChat.font = Fonts.robotoMedium.font(size: 32)
        btnStartChatting.titleLabel?.font = Fonts.robotoMedium.font(size: 20)
        btnStartChatting.layer.cornerRadius = btnStartChatting.frame.height / 2
    }
    
    
    
    //MARK: - Button Actions
    
    @IBAction func optionsButtonAction(_ sender: UIButton) {
        switch sender.tag {

        case 1:
            chatUnderLineView.isHidden = true
            statusUnderLineView.isHidden = false
            callsUnderLineView.isHidden = true

        case 2:
            chatUnderLineView.isHidden = true
            statusUnderLineView.isHidden = true
            callsUnderLineView.isHidden = false

        default:
            chatUnderLineView.isHidden = true
            statusUnderLineView.isHidden = true
            callsUnderLineView.isHidden = true
        }
    }
    
    
    //MARK: - Functions

    private func configure() {
        chatsTableView.delegate = self
        chatsTableView.dataSource = self
        chatsTableView.register(UINib(nibName: ChatsTableViewCell.className, bundle: nil), forCellReuseIdentifier: ChatsTableViewCell.className)
        chatsTableView.contentInset = UIEdgeInsets(top: 11, left: 0, bottom: 11, right: 0)

    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatsTableViewCell.className, for: indexPath) as? ChatsTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        
        return cell
    }
}
