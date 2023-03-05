//
//  PlayerViewController.swift
//  MujtabaTest
//
//  Created by Mujtaba Khan on 05/03/23.
//

import UIKit

class PlayerViewController: UIViewController {
    
    var teamName: String = ""
    var arrTeamHome = [Any]()
    @IBOutlet var segment: UISegmentedControl!
    @IBOutlet var tablePlayer: UITableView!
    
    @IBOutlet var viewPlayerDetails: UIView!
    
    //Batting
    @IBOutlet var lblBattingStyle: UILabel!
    @IBOutlet var lblBattingAvarage: UILabel!
    @IBOutlet var lblBattingStrikeRate: UILabel!
    @IBOutlet var lblBattingRuns: UILabel!
    
    //Bowling
    @IBOutlet var lblBowlingStyle: UILabel!
    @IBOutlet var lblBowlingAvarage: UILabel!
    @IBOutlet var lblBowlingEconomyRate: UILabel!
    @IBOutlet var lblBowlingWickets: UILabel!
    @IBOutlet var btnClose: UIButton!
    
    var SelectedString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        self.navigationItem.title = teamName
        viewPlayerDetails.isHidden = true
        SelectedString = "1"
        getMatchDetails()
    }
    
    func setUI(){
        tablePlayer.isHidden = false
        btnClose.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        viewPlayerDetails.layer.cornerRadius = 12
        viewPlayerDetails.layer.shadowColor = UIColor.black.cgColor
        viewPlayerDetails.layer.shadowOpacity = 1
        viewPlayerDetails.layer.shadowOffset = .zero
        viewPlayerDetails.layer.shadowRadius = 10
    }
    
    func getMatchDetails(){
        showARSProgress()
        MatchDetailsAPI().GetMatchDetails { matchDetails in
            let teamHome = matchDetails?.matchdetail?.teamHome
            let teamaway = matchDetails?.matchdetail?.teamAway
            let dictTeams = matchDetails?.teams
            self.arrTeamHome = [Any]()
            if self.SelectedString == "1"{
                let homeArray = dictTeams?[teamaway ?? "0"] as? Team
                let dictPlayer = homeArray?.players
                self.arrTeamHome = [Any]()
                
                let PlayerdictHome1 = dictPlayer?["2734"] as? Player
                let PlayerHomeName1 = PlayerdictHome1?.nameFull
                let playerHomeBattigStyle1  = PlayerdictHome1?.batting?.style
                let playerHomeBattingAvg1 = PlayerdictHome1?.batting?.average
                let platerHomeBattingStrike1 = PlayerdictHome1?.batting?.strikerate
                let playerHomeBattingRuns1 = PlayerdictHome1?.batting?.runs
                let playerHomeBowlingStype1 = PlayerdictHome1?.bowling?.style
                let playerHomeBowlingAvarage1 = PlayerdictHome1?.bowling?.average
                let playerHomeBowlingEconomyrate1 = PlayerdictHome1?.bowling?.economyrate
                let playerHomeBowlingWickets1 = PlayerdictHome1?.bowling?.wickets
                let PlayerHomeIsCaption1 = PlayerdictHome1?.iscaptain
                let playerHomeIskeeper1 = PlayerdictHome1?.iskeeper

                let PlayerHomeDict1:[String: Any] = [
                    "Name": PlayerHomeName1 ?? "",
                    "IsCaption": PlayerHomeIsCaption1 ?? false,
                    "isKeeper": playerHomeIskeeper1 ?? false,
                    "Batting_Style": playerHomeBattigStyle1 ?? "",
                    "Batting_Average": playerHomeBattingAvg1 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike1 ?? "",
                    "Batting_Runs": playerHomeBattingRuns1 ?? "",
                    "Bowling_Style": playerHomeBowlingStype1 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage1 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate1 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets1 ?? "",
                ]

                let PlayerdictHome2 = dictPlayer?["3472"] as? Player
                let PlayerHomeName2 = PlayerdictHome2?.nameFull
                let playerHomeBattigStyle2  = PlayerdictHome2?.batting?.style
                let playerHomeBattingAvg2 = PlayerdictHome2?.batting?.average
                let platerHomeBattingStrike2 = PlayerdictHome2?.batting?.strikerate
                let playerHomeBattingRuns2 = PlayerdictHome2?.batting?.runs
                let playerHomeBowlingStype2 = PlayerdictHome2?.bowling?.style
                let playerHomeBowlingAvarage2 = PlayerdictHome2?.bowling?.average
                let playerHomeBowlingEconomyrate2 = PlayerdictHome2?.bowling?.economyrate
                let playerHomeBowlingWickets2 = PlayerdictHome2?.bowling?.wickets
                let PlayerHomeIsCaption2 = PlayerdictHome2?.iscaptain
                let playerHomeIskeeper2 = PlayerdictHome2?.iskeeper

                let PlayerHomeDict2:[String: Any] = [
                    "Name": PlayerHomeName2 ?? "",
                    "IsCaption": PlayerHomeIsCaption2 ?? false,
                    "isKeeper": playerHomeIskeeper2 ?? false,
                    "Batting_Style": playerHomeBattigStyle2 ?? "",
                    "Batting_Average": playerHomeBattingAvg2 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike2 ?? "",
                    "Batting_Runs": playerHomeBattingRuns2 ?? "",
                    "Bowling_Style": playerHomeBowlingStype2 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage2 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate2 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets2 ?? "",
                ]
                
                let PlayerdictHome3 = dictPlayer?["4038"] as? Player
                let PlayerHomeName3 = PlayerdictHome3?.nameFull
                let playerHomeBattigStyle3  = PlayerdictHome3?.batting?.style
                let playerHomeBattingAvg3 = PlayerdictHome3?.batting?.average
                let platerHomeBattingStrike3 = PlayerdictHome3?.batting?.strikerate
                let playerHomeBattingRuns3 = PlayerdictHome3?.batting?.runs
                let playerHomeBowlingStype3 = PlayerdictHome3?.bowling?.style
                let playerHomeBowlingAvarage3 = PlayerdictHome3?.bowling?.average
                let playerHomeBowlingEconomyrate3 = PlayerdictHome3?.bowling?.economyrate
                let playerHomeBowlingWickets3 = PlayerdictHome3?.bowling?.wickets
                let PlayerHomeIsCaption3 = PlayerdictHome3?.iscaptain
                let playerHomeIskeeper3 = PlayerdictHome3?.iskeeper

                let PlayerHomeDict3:[String: Any] = [
                    "Name": PlayerHomeName3 ?? "",
                    "IsCaption": PlayerHomeIsCaption3 ?? false,
                    "isKeeper": playerHomeIskeeper3 ?? false,
                    "Batting_Style": playerHomeBattigStyle3 ?? "",
                    "Batting_Average": playerHomeBattingAvg3 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike3 ?? "",
                    "Batting_Runs": playerHomeBattingRuns3 ?? "",
                    "Bowling_Style": playerHomeBowlingStype3 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage3 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate3 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets3 ?? "",
                ]
                
                let PlayerdictHome4 = dictPlayer?["57492"] as? Player
                let PlayerHomeName4 = PlayerdictHome4?.nameFull
                let playerHomeBattigStyle4  = PlayerdictHome4?.batting?.style
                let playerHomeBattingAvg4 = PlayerdictHome4?.batting?.average
                let platerHomeBattingStrike4 = PlayerdictHome4?.batting?.strikerate
                let playerHomeBattingRuns4 = PlayerdictHome4?.batting?.runs
                let playerHomeBowlingStype4 = PlayerdictHome4?.bowling?.style
                let playerHomeBowlingAvarage4 = PlayerdictHome4?.bowling?.average
                let playerHomeBowlingEconomyrate4 = PlayerdictHome4?.bowling?.economyrate
                let playerHomeBowlingWickets4 = PlayerdictHome4?.bowling?.wickets
                let PlayerHomeIsCaption4 = PlayerdictHome4?.iscaptain
                let playerHomeIskeeper4 = PlayerdictHome4?.iskeeper

                let PlayerHomeDict4:[String: Any] = [
                    "Name": PlayerHomeName4 ?? "",
                    "IsCaption": PlayerHomeIsCaption4 ?? false,
                    "isKeeper": playerHomeIskeeper4 ?? false,
                    "Batting_Style": playerHomeBattigStyle4 ?? "",
                    "Batting_Average": playerHomeBattingAvg4 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike4 ?? "",
                    "Batting_Runs": playerHomeBattingRuns4 ?? "",
                    "Bowling_Style": playerHomeBowlingStype4 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage4 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate4 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets4 ?? "",
                ]
                
                let PlayerdictHome5 = dictPlayer?["59429"] as? Player
                let PlayerHomeName5 = PlayerdictHome5?.nameFull
                let playerHomeBattigStyle5  = PlayerdictHome5?.batting?.style
                let playerHomeBattingAvg5 = PlayerdictHome5?.batting?.average
                let platerHomeBattingStrike5 = PlayerdictHome5?.batting?.strikerate
                let playerHomeBattingRuns5 = PlayerdictHome5?.batting?.runs
                let playerHomeBowlingStype5 = PlayerdictHome5?.bowling?.style
                let playerHomeBowlingAvarage5 = PlayerdictHome5?.bowling?.average
                let playerHomeBowlingEconomyrate5 = PlayerdictHome5?.bowling?.economyrate
                let playerHomeBowlingWickets5 = PlayerdictHome5?.bowling?.wickets
                let PlayerHomeIsCaption5 = PlayerdictHome5?.iscaptain
                let playerHomeIskeeper5 = PlayerdictHome5?.iskeeper

                let PlayerHomeDict5:[String: Any] = [
                    "Name": PlayerHomeName5 ?? "",
                    "IsCaption": PlayerHomeIsCaption5 ?? false,
                    "isKeeper": playerHomeIskeeper5 ?? false,
                    "Batting_Style": playerHomeBattigStyle5 ?? "",
                    "Batting_Average": playerHomeBattingAvg5 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike5 ?? "",
                    "Batting_Runs": playerHomeBattingRuns5 ?? "",
                    "Bowling_Style": playerHomeBowlingStype5 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage5 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate5 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets5 ?? "",
                ]
                
                let PlayerdictHome6 = dictPlayer?["63084"] as? Player
                let PlayerHomeName6 = PlayerdictHome6?.nameFull
                let playerHomeBattigStyle6  = PlayerdictHome6?.batting?.style
                let playerHomeBattingAvg6 = PlayerdictHome6?.batting?.average
                let platerHomeBattingStrike6 = PlayerdictHome6?.batting?.strikerate
                let playerHomeBattingRuns6 = PlayerdictHome6?.batting?.runs
                let playerHomeBowlingStype6 = PlayerdictHome6?.bowling?.style
                let playerHomeBowlingAvarage6 = PlayerdictHome6?.bowling?.average
                let playerHomeBowlingEconomyrate6 = PlayerdictHome6?.bowling?.economyrate
                let playerHomeBowlingWickets6 = PlayerdictHome6?.bowling?.wickets
                let PlayerHomeIsCaption6 = PlayerdictHome6?.iscaptain
                let playerHomeIskeeper6 = PlayerdictHome6?.iskeeper

                let PlayerHomeDict6:[String: Any] = [
                    "Name": PlayerHomeName6 ?? "",
                    "IsCaption": PlayerHomeIsCaption6 ?? false,
                    "isKeeper": playerHomeIskeeper6 ?? false,
                    "Batting_Style": playerHomeBattigStyle6 ?? "",
                    "Batting_Average": playerHomeBattingAvg6 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike6 ?? "",
                    "Batting_Runs": playerHomeBattingRuns6 ?? "",
                    "Bowling_Style": playerHomeBowlingStype6 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage6 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate6 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets6 ?? "",
                ]
                
                let PlayerdictHome7 = dictPlayer?["64073"] as? Player
                let PlayerHomeName7 = PlayerdictHome7?.nameFull
                let playerHomeBattigStyle7  = PlayerdictHome7?.batting?.style
                let playerHomeBattingAvg7 = PlayerdictHome7?.batting?.average
                let platerHomeBattingStrike7 = PlayerdictHome7?.batting?.strikerate
                let playerHomeBattingRuns7 = PlayerdictHome7?.batting?.runs
                let playerHomeBowlingStype7 = PlayerdictHome7?.bowling?.style
                let playerHomeBowlingAvarage7 = PlayerdictHome7?.bowling?.average
                let playerHomeBowlingEconomyrate7 = PlayerdictHome7?.bowling?.economyrate
                let playerHomeBowlingWickets7 = PlayerdictHome7?.bowling?.wickets
                let PlayerHomeIsCaption7 = PlayerdictHome7?.iscaptain
                let playerHomeIskeeper7 = PlayerdictHome7?.iskeeper

                let PlayerHomeDict7:[String: Any] = [
                    "Name": PlayerHomeName7 ?? "",
                    "IsCaption": PlayerHomeIsCaption7 ?? false,
                    "isKeeper": playerHomeIskeeper7 ?? false,
                    "Batting_Style": playerHomeBattigStyle7 ?? "",
                    "Batting_Average": playerHomeBattingAvg7 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike7 ?? "",
                    "Batting_Runs": playerHomeBattingRuns7 ?? "",
                    "Bowling_Style": playerHomeBowlingStype7 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage7 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate7 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets7 ?? "",
                ]
                
                let PlayerdictHome8 = dictPlayer?["64306"] as? Player
                let PlayerHomeName8 = PlayerdictHome8?.nameFull
                let playerHomeBattigStyle8  = PlayerdictHome8?.batting?.style
                let playerHomeBattingAvg8 = PlayerdictHome8?.batting?.average
                let platerHomeBattingStrike8 = PlayerdictHome8?.batting?.strikerate
                let playerHomeBattingRuns8 = PlayerdictHome8?.batting?.runs
                let playerHomeBowlingStype8 = PlayerdictHome8?.bowling?.style
                let playerHomeBowlingAvarage8 = PlayerdictHome8?.bowling?.average
                let playerHomeBowlingEconomyrate8 = PlayerdictHome8?.bowling?.economyrate
                let playerHomeBowlingWickets8 = PlayerdictHome8?.bowling?.wickets
                let PlayerHomeIsCaption8 = PlayerdictHome8?.iscaptain
                let playerHomeIskeeper8 = PlayerdictHome8?.iskeeper

                let PlayerHomeDict8:[String: Any] = [
                    "Name": PlayerHomeName8 ?? "",
                    "IsCaption": PlayerHomeIsCaption8 ?? false,
                    "isKeeper": playerHomeIskeeper8 ?? false,
                    "Batting_Style": playerHomeBattigStyle8 ?? "",
                    "Batting_Average": playerHomeBattingAvg8 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike8 ?? "",
                    "Batting_Runs": playerHomeBattingRuns8 ?? "",
                    "Bowling_Style": playerHomeBowlingStype8 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage8 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate8 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets8 ?? "",
                ]
                
                let PlayerdictHome9 = dictPlayer?["64321"] as? Player
                let PlayerHomeName9 = PlayerdictHome9?.nameFull
                let playerHomeBattigStyle9  = PlayerdictHome9?.batting?.style
                let playerHomeBattingAvg9 = PlayerdictHome9?.batting?.average
                let platerHomeBattingStrike9 = PlayerdictHome9?.batting?.strikerate
                let playerHomeBattingRuns9 = PlayerdictHome9?.batting?.runs
                let playerHomeBowlingStype9 = PlayerdictHome9?.bowling?.style
                let playerHomeBowlingAvarage9 = PlayerdictHome9?.bowling?.average
                let playerHomeBowlingEconomyrate9 = PlayerdictHome9?.bowling?.economyrate
                let playerHomeBowlingWickets9 = PlayerdictHome9?.bowling?.wickets
                let PlayerHomeIsCaption9 = PlayerdictHome9?.iscaptain
                let playerHomeIskeeper9 = PlayerdictHome9?.iskeeper

                let PlayerHomeDict9:[String: Any] = [
                    "Name": PlayerHomeName9 ?? "",
                    "IsCaption": PlayerHomeIsCaption9 ?? false,
                    "isKeeper": playerHomeIskeeper9 ?? false,
                    "Batting_Style": playerHomeBattigStyle9 ?? "",
                    "Batting_Average": playerHomeBattingAvg9 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike9 ?? "",
                    "Batting_Runs": playerHomeBattingRuns9 ?? "",
                    "Bowling_Style": playerHomeBowlingStype9 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage9 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate9 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets9 ?? "",
                ]
                
                let PlayerdictHome10 = dictPlayer?["65739"] as? Player
                let PlayerHomeName10 = PlayerdictHome10?.nameFull
                let playerHomeBattigStyle10  = PlayerdictHome10?.batting?.style
                let playerHomeBattingAvg10 = PlayerdictHome10?.batting?.average
                let platerHomeBattingStrike10 = PlayerdictHome10?.batting?.strikerate
                let playerHomeBattingRuns10 = PlayerdictHome10?.batting?.runs
                let playerHomeBowlingStype10 = PlayerdictHome10?.bowling?.style
                let playerHomeBowlingAvarage10 = PlayerdictHome10?.bowling?.average
                let playerHomeBowlingEconomyrate10 = PlayerdictHome10?.bowling?.economyrate
                let playerHomeBowlingWickets10 = PlayerdictHome10?.bowling?.wickets
                let PlayerHomeIsCaption10 = PlayerdictHome10?.iscaptain
                let playerHomeIskeeper10 = PlayerdictHome10?.iskeeper

                let PlayerHomeDict10:[String: Any] = [
                    "Name": PlayerHomeName10 ?? "",
                    "IsCaption": PlayerHomeIsCaption10 ?? false,
                    "isKeeper": playerHomeIskeeper10 ?? false,
                    "Batting_Style": playerHomeBattigStyle10 ?? "",
                    "Batting_Average": playerHomeBattingAvg10 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike10 ?? "",
                    "Batting_Runs": playerHomeBattingRuns10 ?? "",
                    "Bowling_Style": playerHomeBowlingStype10 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage10 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate10 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets10 ?? "",
                ]
                
                let PlayerdictHome11 = dictPlayer?["66833"] as? Player
                let PlayerHomeName11 = PlayerdictHome11?.nameFull
                let playerHomeBattigStyle11 = PlayerdictHome11?.batting?.style
                let playerHomeBattingAvg11 = PlayerdictHome11?.batting?.average
                let platerHomeBattingStrike11 = PlayerdictHome11?.batting?.strikerate
                let playerHomeBattingRuns11 = PlayerdictHome11?.batting?.runs
                let playerHomeBowlingStype11 = PlayerdictHome11?.bowling?.style
                let playerHomeBowlingAvarage11 = PlayerdictHome11?.bowling?.average
                let playerHomeBowlingEconomyrate11 = PlayerdictHome11?.bowling?.economyrate
                let playerHomeBowlingWickets11 = PlayerdictHome11?.bowling?.wickets
                let PlayerHomeIsCaption11 = PlayerdictHome11?.iscaptain
                let playerHomeIskeeper11 = PlayerdictHome11?.iskeeper

                let PlayerHomeDict11:[String: Any] = [
                    "Name": PlayerHomeName11 ?? "",
                    "IsCaption": PlayerHomeIsCaption11 ?? false,
                    "isKeeper": playerHomeIskeeper11 ?? false,
                    "Batting_Style": playerHomeBattigStyle11 ?? "",
                    "Batting_Average": playerHomeBattingAvg11 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike11 ?? "",
                    "Batting_Runs": playerHomeBattingRuns11 ?? "",
                    "Bowling_Style": playerHomeBowlingStype11 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage11 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate11 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets11 ?? "",
                ]

                self.arrTeamHome.append(PlayerHomeDict1)
                self.arrTeamHome.append(PlayerHomeDict2)
                self.arrTeamHome.append(PlayerHomeDict3)
                self.arrTeamHome.append(PlayerHomeDict4)
                self.arrTeamHome.append(PlayerHomeDict5)
                self.arrTeamHome.append(PlayerHomeDict6)
                self.arrTeamHome.append(PlayerHomeDict7)
                self.arrTeamHome.append(PlayerHomeDict8)
                self.arrTeamHome.append(PlayerHomeDict9)
                self.arrTeamHome.append(PlayerHomeDict10)
                self.arrTeamHome.append(PlayerHomeDict11)
            }else{
                let homeArray = dictTeams?[teamHome ?? "0"] as? Team
                let dictPlayer = homeArray?.players
                self.arrTeamHome = [Any]()
                
                let PlayerdictHome1 = dictPlayer?["3667"] as? Player
                let PlayerHomeName1 = PlayerdictHome1?.nameFull
                let playerHomeBattigStyle1  = PlayerdictHome1?.batting?.style
                let playerHomeBattingAvg1 = PlayerdictHome1?.batting?.average
                let platerHomeBattingStrike1 = PlayerdictHome1?.batting?.strikerate
                let playerHomeBattingRuns1 = PlayerdictHome1?.batting?.runs
                let playerHomeBowlingStype1 = PlayerdictHome1?.bowling?.style
                let playerHomeBowlingAvarage1 = PlayerdictHome1?.bowling?.average
                let playerHomeBowlingEconomyrate1 = PlayerdictHome1?.bowling?.economyrate
                let playerHomeBowlingWickets1 = PlayerdictHome1?.bowling?.wickets
                let PlayerHomeIsCaption1 = PlayerdictHome1?.iscaptain
                let playerHomeIskeeper1 = PlayerdictHome1?.iskeeper

                let PlayerHomeDict1:[String: Any] = [
                    "Name": PlayerHomeName1 ?? "",
                    "IsCaption": PlayerHomeIsCaption1 ?? false,
                    "isKeeper": playerHomeIskeeper1 ?? false,
                    "Batting_Style": playerHomeBattigStyle1 ?? "",
                    "Batting_Average": playerHomeBattingAvg1 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike1 ?? "",
                    "Batting_Runs": playerHomeBattingRuns1 ?? "",
                    "Bowling_Style": playerHomeBowlingStype1 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage1 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate1 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets1 ?? "",
                ]

                let PlayerdictHome2 = dictPlayer?["4356"] as? Player
                let PlayerHomeName2 = PlayerdictHome2?.nameFull
                let playerHomeBattigStyle2  = PlayerdictHome2?.batting?.style
                let playerHomeBattingAvg2 = PlayerdictHome2?.batting?.average
                let platerHomeBattingStrike2 = PlayerdictHome2?.batting?.strikerate
                let playerHomeBattingRuns2 = PlayerdictHome2?.batting?.runs
                let playerHomeBowlingStype2 = PlayerdictHome2?.bowling?.style
                let playerHomeBowlingAvarage2 = PlayerdictHome2?.bowling?.average
                let playerHomeBowlingEconomyrate2 = PlayerdictHome2?.bowling?.economyrate
                let playerHomeBowlingWickets2 = PlayerdictHome2?.bowling?.wickets
                let PlayerHomeIsCaption2 = PlayerdictHome2?.iscaptain
                let playerHomeIskeeper2 = PlayerdictHome2?.iskeeper

                let PlayerHomeDict2:[String: Any] = [
                    "Name": PlayerHomeName2 ?? "",
                    "IsCaption": PlayerHomeIsCaption2 ?? false,
                    "isKeeper": playerHomeIskeeper2 ?? false,
                    "Batting_Style": playerHomeBattigStyle2 ?? "",
                    "Batting_Average": playerHomeBattingAvg2 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike2 ?? "",
                    "Batting_Runs": playerHomeBattingRuns2 ?? "",
                    "Bowling_Style": playerHomeBowlingStype2 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage2 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate2 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets2 ?? "",
                ]
                
                let PlayerdictHome3 = dictPlayer?["5313"] as? Player
                let PlayerHomeName3 = PlayerdictHome3?.nameFull
                let playerHomeBattigStyle3  = PlayerdictHome3?.batting?.style
                let playerHomeBattingAvg3 = PlayerdictHome3?.batting?.average
                let platerHomeBattingStrike3 = PlayerdictHome3?.batting?.strikerate
                let playerHomeBattingRuns3 = PlayerdictHome3?.batting?.runs
                let playerHomeBowlingStype3 = PlayerdictHome3?.bowling?.style
                let playerHomeBowlingAvarage3 = PlayerdictHome3?.bowling?.average
                let playerHomeBowlingEconomyrate3 = PlayerdictHome3?.bowling?.economyrate
                let playerHomeBowlingWickets3 = PlayerdictHome3?.bowling?.wickets
                let PlayerHomeIsCaption3 = PlayerdictHome3?.iscaptain
                let playerHomeIskeeper3 = PlayerdictHome3?.iskeeper

                let PlayerHomeDict3:[String: Any] = [
                    "Name": PlayerHomeName3 ?? "",
                    "IsCaption": PlayerHomeIsCaption3 ?? false,
                    "isKeeper": playerHomeIskeeper3 ?? false,
                    "Batting_Style": playerHomeBattigStyle3 ?? "",
                    "Batting_Average": playerHomeBattingAvg3 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike3 ?? "",
                    "Batting_Runs": playerHomeBattingRuns3 ?? "",
                    "Bowling_Style": playerHomeBowlingStype3 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage3 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate3 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets3 ?? "",
                ]
                
                let PlayerdictHome4 = dictPlayer?["12518"] as? Player
                let PlayerHomeName4 = PlayerdictHome4?.nameFull
                let playerHomeBattigStyle4  = PlayerdictHome4?.batting?.style
                let playerHomeBattingAvg4 = PlayerdictHome4?.batting?.average
                let platerHomeBattingStrike4 = PlayerdictHome4?.batting?.strikerate
                let playerHomeBattingRuns4 = PlayerdictHome4?.batting?.runs
                let playerHomeBowlingStype4 = PlayerdictHome4?.bowling?.style
                let playerHomeBowlingAvarage4 = PlayerdictHome4?.bowling?.average
                let playerHomeBowlingEconomyrate4 = PlayerdictHome4?.bowling?.economyrate
                let playerHomeBowlingWickets4 = PlayerdictHome4?.bowling?.wickets
                let PlayerHomeIsCaption4 = PlayerdictHome4?.iscaptain
                let playerHomeIskeeper4 = PlayerdictHome4?.iskeeper

                let PlayerHomeDict4:[String: Any] = [
                    "Name": PlayerHomeName4 ?? "",
                    "IsCaption": PlayerHomeIsCaption4 ?? false,
                    "isKeeper": playerHomeIskeeper4 ?? false,
                    "Batting_Style": playerHomeBattigStyle4 ?? "",
                    "Batting_Average": playerHomeBattingAvg4 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike4 ?? "",
                    "Batting_Runs": playerHomeBattingRuns4 ?? "",
                    "Bowling_Style": playerHomeBowlingStype4 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage4 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate4 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets4 ?? "",
                ]
                
                let PlayerdictHome5 = dictPlayer?["24669"] as? Player
                let PlayerHomeName5 = PlayerdictHome5?.nameFull
                let playerHomeBattigStyle5  = PlayerdictHome5?.batting?.style
                let playerHomeBattingAvg5 = PlayerdictHome5?.batting?.average
                let platerHomeBattingStrike5 = PlayerdictHome5?.batting?.strikerate
                let playerHomeBattingRuns5 = PlayerdictHome5?.batting?.runs
                let playerHomeBowlingStype5 = PlayerdictHome5?.bowling?.style
                let playerHomeBowlingAvarage5 = PlayerdictHome5?.bowling?.average
                let playerHomeBowlingEconomyrate5 = PlayerdictHome5?.bowling?.economyrate
                let playerHomeBowlingWickets5 = PlayerdictHome5?.bowling?.wickets
                let PlayerHomeIsCaption5 = PlayerdictHome5?.iscaptain
                let playerHomeIskeeper5 = PlayerdictHome5?.iskeeper

                let PlayerHomeDict5:[String: Any] = [
                    "Name": PlayerHomeName5 ?? "",
                    "IsCaption": PlayerHomeIsCaption5 ?? false,
                    "isKeeper": playerHomeIskeeper5 ?? false,
                    "Batting_Style": playerHomeBattigStyle5 ?? "",
                    "Batting_Average": playerHomeBattingAvg5 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike5 ?? "",
                    "Batting_Runs": playerHomeBattingRuns5 ?? "",
                    "Bowling_Style": playerHomeBowlingStype5 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage5 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate5 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets5 ?? "",
                ]
                
                let PlayerdictHome6 = dictPlayer?["28891"] as? Player
                let PlayerHomeName6 = PlayerdictHome6?.nameFull
                let playerHomeBattigStyle6  = PlayerdictHome6?.batting?.style
                let playerHomeBattingAvg6 = PlayerdictHome6?.batting?.average
                let platerHomeBattingStrike6 = PlayerdictHome6?.batting?.strikerate
                let playerHomeBattingRuns6 = PlayerdictHome6?.batting?.runs
                let playerHomeBowlingStype6 = PlayerdictHome6?.bowling?.style
                let playerHomeBowlingAvarage6 = PlayerdictHome6?.bowling?.average
                let playerHomeBowlingEconomyrate6 = PlayerdictHome6?.bowling?.economyrate
                let playerHomeBowlingWickets6 = PlayerdictHome6?.bowling?.wickets
                let PlayerHomeIsCaption6 = PlayerdictHome6?.iscaptain
                let playerHomeIskeeper6 = PlayerdictHome6?.iskeeper

                let PlayerHomeDict6:[String: Any] = [
                    "Name": PlayerHomeName6 ?? "",
                    "IsCaption": PlayerHomeIsCaption6 ?? false,
                    "isKeeper": playerHomeIskeeper6 ?? false,
                    "Batting_Style": playerHomeBattigStyle6 ?? "",
                    "Batting_Average": playerHomeBattingAvg6 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike6 ?? "",
                    "Batting_Runs": playerHomeBattingRuns6 ?? "",
                    "Bowling_Style": playerHomeBowlingStype6 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage6 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate6 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets6 ?? "",
                ]
                
                let PlayerdictHome7 = dictPlayer?["48191"] as? Player
                let PlayerHomeName7 = PlayerdictHome7?.nameFull
                let playerHomeBattigStyle7  = PlayerdictHome7?.batting?.style
                let playerHomeBattingAvg7 = PlayerdictHome7?.batting?.average
                let platerHomeBattingStrike7 = PlayerdictHome7?.batting?.strikerate
                let playerHomeBattingRuns7 = PlayerdictHome7?.batting?.runs
                let playerHomeBowlingStype7 = PlayerdictHome7?.bowling?.style
                let playerHomeBowlingAvarage7 = PlayerdictHome7?.bowling?.average
                let playerHomeBowlingEconomyrate7 = PlayerdictHome7?.bowling?.economyrate
                let playerHomeBowlingWickets7 = PlayerdictHome7?.bowling?.wickets
                let PlayerHomeIsCaption7 = PlayerdictHome7?.iscaptain
                let playerHomeIskeeper7 = PlayerdictHome7?.iskeeper

                let PlayerHomeDict7:[String: Any] = [
                    "Name": PlayerHomeName7 ?? "",
                    "IsCaption": PlayerHomeIsCaption7 ?? false,
                    "isKeeper": playerHomeIskeeper7 ?? false,
                    "Batting_Style": playerHomeBattigStyle7 ?? "",
                    "Batting_Average": playerHomeBattingAvg7 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike7 ?? "",
                    "Batting_Runs": playerHomeBattingRuns7 ?? "",
                    "Bowling_Style": playerHomeBowlingStype7 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage7 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate7 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets7 ?? "",
                ]
                
                let PlayerdictHome8 = dictPlayer?["57458"] as? Player
                let PlayerHomeName8 = PlayerdictHome8?.nameFull
                let playerHomeBattigStyle8  = PlayerdictHome8?.batting?.style
                let playerHomeBattingAvg8 = PlayerdictHome8?.batting?.average
                let platerHomeBattingStrike8 = PlayerdictHome8?.batting?.strikerate
                let playerHomeBattingRuns8 = PlayerdictHome8?.batting?.runs
                let playerHomeBowlingStype8 = PlayerdictHome8?.bowling?.style
                let playerHomeBowlingAvarage8 = PlayerdictHome8?.bowling?.average
                let playerHomeBowlingEconomyrate8 = PlayerdictHome8?.bowling?.economyrate
                let playerHomeBowlingWickets8 = PlayerdictHome8?.bowling?.wickets
                let PlayerHomeIsCaption8 = PlayerdictHome8?.iscaptain
                let playerHomeIskeeper8 = PlayerdictHome8?.iskeeper

                let PlayerHomeDict8:[String: Any] = [
                    "Name": PlayerHomeName8 ?? "",
                    "IsCaption": PlayerHomeIsCaption8 ?? false,
                    "isKeeper": playerHomeIskeeper8 ?? false,
                    "Batting_Style": playerHomeBattigStyle8 ?? "",
                    "Batting_Average": playerHomeBattingAvg8 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike8 ?? "",
                    "Batting_Runs": playerHomeBattingRuns8 ?? "",
                    "Bowling_Style": playerHomeBowlingStype8 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage8 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate8 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets8 ?? "",
                ]
                
                let PlayerdictHome9 = dictPlayer?["59736"] as? Player
                let PlayerHomeName9 = PlayerdictHome9?.nameFull
                let playerHomeBattigStyle9  = PlayerdictHome9?.batting?.style
                let playerHomeBattingAvg9 = PlayerdictHome9?.batting?.average
                let platerHomeBattingStrike9 = PlayerdictHome9?.batting?.strikerate
                let playerHomeBattingRuns9 = PlayerdictHome9?.batting?.runs
                let playerHomeBowlingStype9 = PlayerdictHome9?.bowling?.style
                let playerHomeBowlingAvarage9 = PlayerdictHome9?.bowling?.average
                let playerHomeBowlingEconomyrate9 = PlayerdictHome9?.bowling?.economyrate
                let playerHomeBowlingWickets9 = PlayerdictHome9?.bowling?.wickets
                let PlayerHomeIsCaption9 = PlayerdictHome9?.iscaptain
                let playerHomeIskeeper9 = PlayerdictHome9?.iskeeper

                let PlayerHomeDict9:[String: Any] = [
                    "Name": PlayerHomeName9 ?? "",
                    "IsCaption": PlayerHomeIsCaption9 ?? false,
                    "isKeeper": playerHomeIskeeper9 ?? false,
                    "Batting_Style": playerHomeBattigStyle9 ?? "",
                    "Batting_Average": playerHomeBattingAvg9 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike9 ?? "",
                    "Batting_Runs": playerHomeBattingRuns9 ?? "",
                    "Bowling_Style": playerHomeBowlingStype9 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage9 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate9 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets9 ?? "",
                ]
                
                let PlayerdictHome10 = dictPlayer?["63611"] as? Player
                let PlayerHomeName10 = PlayerdictHome10?.nameFull
                let playerHomeBattigStyle10  = PlayerdictHome10?.batting?.style
                let playerHomeBattingAvg10 = PlayerdictHome10?.batting?.average
                let platerHomeBattingStrike10 = PlayerdictHome10?.batting?.strikerate
                let playerHomeBattingRuns10 = PlayerdictHome10?.batting?.runs
                let playerHomeBowlingStype10 = PlayerdictHome10?.bowling?.style
                let playerHomeBowlingAvarage10 = PlayerdictHome10?.bowling?.average
                let playerHomeBowlingEconomyrate10 = PlayerdictHome10?.bowling?.economyrate
                let playerHomeBowlingWickets10 = PlayerdictHome10?.bowling?.wickets
                let PlayerHomeIsCaption10 = PlayerdictHome10?.iscaptain
                let playerHomeIskeeper10 = PlayerdictHome10?.iskeeper

                let PlayerHomeDict10:[String: Any] = [
                    "Name": PlayerHomeName10 ?? "",
                    "IsCaption": PlayerHomeIsCaption10 ?? false,
                    "isKeeper": playerHomeIskeeper10 ?? false,
                    "Batting_Style": playerHomeBattigStyle10 ?? "",
                    "Batting_Average": playerHomeBattingAvg10 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike10 ?? "",
                    "Batting_Runs": playerHomeBattingRuns10 ?? "",
                    "Bowling_Style": playerHomeBowlingStype10 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage10 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate10 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets10 ?? "",
                ]
                
                let PlayerdictHome11 = dictPlayer?["64221"] as? Player
                let PlayerHomeName11 = PlayerdictHome11?.nameFull
                let playerHomeBattigStyle11 = PlayerdictHome11?.batting?.style
                let playerHomeBattingAvg11 = PlayerdictHome11?.batting?.average
                let platerHomeBattingStrike11 = PlayerdictHome11?.batting?.strikerate
                let playerHomeBattingRuns11 = PlayerdictHome11?.batting?.runs
                let playerHomeBowlingStype11 = PlayerdictHome11?.bowling?.style
                let playerHomeBowlingAvarage11 = PlayerdictHome11?.bowling?.average
                let playerHomeBowlingEconomyrate11 = PlayerdictHome11?.bowling?.economyrate
                let playerHomeBowlingWickets11 = PlayerdictHome11?.bowling?.wickets
                let PlayerHomeIsCaption11 = PlayerdictHome11?.iscaptain
                let playerHomeIskeeper11 = PlayerdictHome11?.iskeeper

                let PlayerHomeDict11:[String: Any] = [
                    "Name": PlayerHomeName11 ?? "",
                    "IsCaption": PlayerHomeIsCaption11 ?? false,
                    "isKeeper": playerHomeIskeeper11 ?? false,
                    "Batting_Style": playerHomeBattigStyle11 ?? "",
                    "Batting_Average": playerHomeBattingAvg11 ?? "",
                    "Batting_Strikerate": platerHomeBattingStrike11 ?? "",
                    "Batting_Runs": playerHomeBattingRuns11 ?? "",
                    "Bowling_Style": playerHomeBowlingStype11 ?? "",
                    "Bowling_Average": playerHomeBowlingAvarage11 ?? "",
                    "Bowling_Economyrate": playerHomeBowlingEconomyrate11 ?? "",
                    "Bowling_wickets": playerHomeBowlingWickets11 ?? "",
                ]

                self.arrTeamHome.append(PlayerHomeDict1)
                self.arrTeamHome.append(PlayerHomeDict2)
                self.arrTeamHome.append(PlayerHomeDict3)
                self.arrTeamHome.append(PlayerHomeDict4)
                self.arrTeamHome.append(PlayerHomeDict5)
                self.arrTeamHome.append(PlayerHomeDict6)
                self.arrTeamHome.append(PlayerHomeDict7)
                self.arrTeamHome.append(PlayerHomeDict8)
                self.arrTeamHome.append(PlayerHomeDict9)
                self.arrTeamHome.append(PlayerHomeDict10)
                self.arrTeamHome.append(PlayerHomeDict11)
            }
            self.tablePlayer.reloadData()
            
        }
    }

    //MARK: - Segment Method
    @IBAction func segmentClick(_ sender: Any) {
        switch segment.selectedSegmentIndex{
        case 0:
            SelectedString = "1"
            getMatchDetails()
            break
            
        case 1:
            SelectedString = "2"
            getMatchDetails()
            break
            
        default:
            break
        }
    }
    
    //MARK: - Button Method
    @IBAction func btnCloseClick(_ sender: Any) {
        viewPlayerDetails.isHidden = true
        tablePlayer.isHidden = false
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class PlayerCell: UITableViewCell{
    @IBOutlet var lblPlayerName: UILabel!
}

extension PlayerViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTeamHome.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        let dictFeeStats = arrTeamHome[indexPath.row] as? [String:Any]
        let isCaption = dictFeeStats?["IsCaption"] as? Bool ?? false
        let isKeeper = dictFeeStats?["isKeeper"] as? Bool ?? false
        if isCaption && isKeeper{
            cell.lblPlayerName.text = "\(dictFeeStats?["Name"] as? String ?? "") C WC"
        }else if isCaption{
            cell.lblPlayerName.text = "\(dictFeeStats?["Name"] as? String ?? "") C"
        }else if isKeeper{
            cell.lblPlayerName.text = "\(dictFeeStats?["Name"] as? String ?? "") WC"
        }else{
            cell.lblPlayerName.text = "\(dictFeeStats?["Name"] as? String ?? "")"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _ = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        let dictFeeStats = arrTeamHome[indexPath.row] as? [String:Any]
        lblBattingStyle.text = dictFeeStats?["Batting_Style"] as? String
        lblBattingAvarage.text = dictFeeStats?["Batting_Average"] as? String
        lblBattingStrikeRate.text = dictFeeStats?["Batting_Strikerate"] as? String
        lblBattingRuns.text = dictFeeStats?["Batting_Runs"] as? String
        lblBowlingStyle.text = dictFeeStats?["Bowling_Style"] as? String
        lblBowlingAvarage.text = dictFeeStats?["Bowling_Average"] as? String
        lblBowlingEconomyRate.text = dictFeeStats?["Bowling_Economyrate"] as? String
        lblBowlingWickets.text = dictFeeStats?["Bowling_wickets"] as? String
        viewPlayerDetails.isHidden = false
        tablePlayer.isHidden = true
    }
}
