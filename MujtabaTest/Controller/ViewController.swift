//
//  ViewController.swift
//  MujtabaTest
//
//  Created by Mujtaba Khan on 05/03/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var lblCountry1: UILabel!
    @IBOutlet weak var lblCountry2: UILabel!
    @IBOutlet weak var lblCountryTime1: UILabel!
    @IBOutlet weak var lblCountryVenue1: UILabel!
    
    @IBOutlet weak var lblCountry3: UILabel!
    @IBOutlet weak var lblCountry4: UILabel!
    @IBOutlet weak var lblCountryTime2: UILabel!
    @IBOutlet weak var lblCountryVenue2: UILabel!
    
    var playerList = [Players]()
    var MatchVenue: String?
    var MatchTime: String?
    var MatchDate: String?
    var teamHome1: String?
    var teamAway1: String?
    var teamHome2: String?
    var teamAway2: String?
    var playerData1: Players?
    var playerData2: Players?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.getMatchDetailsApi1()
    }
    func getMatchDetailsApi1()  {
        showARSProgress()
        guard let url = URL(string: "https://demo.sportz.io/nzin01312019187360.json") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if error == nil{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!) as? [String: Any]
                    let playerData = try JSONDecoder().decode(Players.self, from: data!)
                    print(playerData, "playerData")
                    DispatchQueue.main.async {
                        self.playerData1 = playerData
                        self.lblCountryVenue1.text = playerData.matchdetail?.venue?.name
                        self.lblCountryTime1.text = "\(playerData.matchdetail?.match?.date ?? "") " + "\(playerData.matchdetail?.match?.time ?? "")"
                        self.teamHome1 = playerData.matchdetail?.teamHome
                        self.teamAway1 = playerData.matchdetail?.teamAway
                        self.lblCountry1.text = playerData.teams?[self.teamHome1 ?? ""]?.nameFull
                        self.lblCountry2.text = playerData.teams?[self.teamAway1 ?? ""]?.nameFull
                    }
                    self.getMatchDetailsApi2()
                }catch{
                    print(error)
                }
            }
        }.resume()
    }
    func getMatchDetailsApi2()  {
        guard let url = URL(string: "https://demo.sportz.io/sapk01222019186652.json") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if error == nil{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!) as? [String: Any]
                    let playerData = try JSONDecoder().decode(Players.self, from: data!)
                    print(playerData, "playerData")
                    DispatchQueue.main.async {
                        hideARSProgress()
                        self.playerData2 = playerData
                        self.lblCountryVenue2.text = playerData.matchdetail?.venue?.name
                        self.lblCountryTime2.text = "\(playerData.matchdetail?.match?.date ?? "") " + "\(playerData.matchdetail?.match?.time ?? "")"
                        self.teamHome2 = playerData.matchdetail?.teamHome
                        self.teamAway2 = playerData.matchdetail?.teamAway
                        self.lblCountry3.text = playerData.teams?[self.teamHome2 ?? ""]?.nameFull
                        self.lblCountry4.text = playerData.teams?[self.teamAway2 ?? ""]?.nameFull
                    }
                }catch{
                    print(error)
                }
            }
        }.resume()
    }
    @IBAction func matchOneButtonDetail(_ sender: Any) {
        if let data = playerData1{
            nextVc(playerData: data)
        }
    }
    @IBAction func matchTwoButtonDetail(_ sender: Any) {
        if let data = playerData2{
            nextVc(playerData: data)
        }
    }
    func nextVc( playerData: Players)  {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        vc.playerData = playerData
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

