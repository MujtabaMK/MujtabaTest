//
//  SecondVC.swift
//  MujtabaTest
//
//  Created by Mujtaba Khan on 05/03/23.
//

import UIKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var fliterView: UIView!
    @IBOutlet var btnAllPlayer: CustomButton!
    @IBOutlet var btnTeamA: CustomButton!
    @IBOutlet var btnTeamB: CustomButton!
    
    var showFilterMenu = false
    var playerData: Players?
    var teamPlayer: [String: Player]?
    var teamPlayerIds: [String]?
    var playeID = [String]()
    var PlayersData = [Player]()
    var checking: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUI()
        self.showFilterMenu = true
        self.fliterView.isHidden = true
        self.custamization()
    }
    func SetUI(){
        btnAllPlayer.setTitle("All", for: .normal)
        btnTeamA.setTitle("Team A", for: .normal)
        btnTeamB.setTitle("Team B", for: .normal)
    }
    
    func custamization()  {
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.tableView.rowHeight = 100
        self.navigationController?.navigationBar.tintColor = UIColor.white
        tableView.layer.cornerRadius = 25
        tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.addSubview(tableView)
        self.view.bringSubviewToFront(btnFilter)
        self.setUpData(type: 1)
    }
    @IBAction func filterButtonTapped(_ sender: Any) {
        let tag = btnFilter.tag
        showAndHideFilterMenu(category: tag)
    }
    func showAndHideFilterMenu(category : Int) {
        if showFilterMenu == false {
            self.fliterView.alpha = 0.0
            self.fliterView.isHidden = false
            self.showFilterMenu = true
            UIView.animate(withDuration: 0.4,animations: { [weak self] in
                self?.fliterView.alpha = 1.0
            })
        } else {
            UIView.animate(withDuration: 0.4,animations: { [weak self] in
                self?.fliterView.alpha = 0.0
            }) { [weak self] _ in
                self?.fliterView.isHidden = true
                self?.showFilterMenu = false
            }
        }
    }
    @IBAction func filterAllPlayerButtonTapped(_ sender: Any) {
        setUpData(type: 1)
        showAndHideFilterMenu(category: 1)
    }
    @IBAction func filterTeamAPlayerTapped(_ sender: Any) {
        setUpData(type: 2)
        showAndHideFilterMenu(category: 2)
    }
    @IBAction func filterTeamBTapped(_ sender: Any) {
        setUpData(type: 3)
        showAndHideFilterMenu(category: 3)
    }
    func setUpData(type: Int){
        self.playeID.removeAll()
        self.PlayersData.removeAll()
        let homeTeamId = playerData?.matchdetail?.teamHome
        let awayTeamId = playerData?.matchdetail?.teamAway
        switch type {
        case 1:
            //display all
            for (key, value) in playerData?.teams?[homeTeamId ?? ""]?.players ?? [:]{
                print("(\(key),\(value))")
                self.playeID.append(key)
                self.PlayersData.append(value)
            }
            for (key, value) in playerData?.teams?[awayTeamId ?? ""]?.players ?? [:]{
                print("(\(key),\(value))")
                self.playeID.append(key)
                self.PlayersData.append(value)
            }
            break
        case 2:
            //display home
            for (key, value) in playerData?.teams?[homeTeamId ?? ""]?.players ?? [:]{
                print("(\(key),\(value))")
                self.playeID.append(key)
                self.PlayersData.append(value)
            }
            break
        case 3:
            //display away
            for (key, value) in playerData?.teams?[awayTeamId ?? ""]?.players ?? [:]{
                print("(\(key),\(value))")
                self.playeID.append(key)
                self.PlayersData.append(value)
            }
            break
        default:
            break
        }
        self.tableView.reloadData()
        
    }
}
extension SecondVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playeID.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        let dataPlayers  = self.PlayersData[indexPath.row]
        let keeper = dataPlayers.iskeeper ?? false
        let captain = dataPlayers.iscaptain ?? false
        if keeper == true &&  captain == true{
            self.checking = "Captain & Wicket keeper"
        }else if keeper == true && captain == false{
            self.checking = "Wicket keeper"
        }else if captain == true && keeper == false{
            self.checking = "Captain"
        }else{
            self.checking = "-"
        }
        cell?.playerName.text = dataPlayers.nameFull
        cell?.playerStyle.text = checking
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  let vc = self.storyboard?.instantiateViewController(withIdentifier: "CustomPopupVC") as? CustomPopupVC {
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .crossDissolve
            vc.PlayersData = self.PlayersData[indexPath.row]
            present(vc, animated: true, completion: nil)
        }
    }
}
