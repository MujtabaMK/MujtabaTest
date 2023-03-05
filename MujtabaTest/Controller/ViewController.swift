//
//  ViewController.swift
//  MujtabaTest
//
//  Created by Mujtaba Khan on 05/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lblTeamsName: UILabel!
    @IBOutlet var lblDateTime: UILabel!
    @IBOutlet var lblVenue: UILabel!
    @IBOutlet var btnPlayerInformation: UIButton!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        getMatchDetails()
    }
    
    //MARK: - SetUI
    func setUI(){
        btnPlayerInformation.layer.cornerRadius = 5
    }
    
    //MARK: - API Call
    
    func getMatchDetails(){
        showARSProgress()
        MatchDetailsAPI().GetMatchDetails { MatchDetails in
            print(MatchDetails?.teams as Any)
            let teamHome = MatchDetails?.matchdetail?.teamHome
            let teamaway = MatchDetails?.matchdetail?.teamAway
            let dictTeams = MatchDetails?.teams
            let homeArray = dictTeams?[teamHome ?? "0"] as? Team
            let homeFullName = homeArray?.nameFull
            let awayArray = dictTeams?[teamaway ?? "0"] as? Team
            let awayFullName = awayArray?.nameFull
            self.lblTeamsName.text = "\(homeFullName ?? "") VS \(awayFullName ?? "")"
            let MatchDate = MatchDetails?.matchdetail?.match?.date
            let MatchTime = MatchDetails?.matchdetail?.match?.time
            self.lblDateTime.text = "\(MatchDate ?? "") \(MatchTime ?? "")"
            self.lblVenue.text = MatchDetails?.matchdetail?.venue?.name
            hideARSProgress()
        }
    }

    @IBAction func btnPlayerInformationClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var playerController = storyboard.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
        playerController.teamName = lblTeamsName.text ?? ""
        self.navigationController?.pushViewController(playerController, animated: true)
    }
    
}

