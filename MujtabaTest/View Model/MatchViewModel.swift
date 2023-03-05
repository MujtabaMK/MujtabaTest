//
//  MatchViewModel.swift
//  MujtabaTest
//
//  Created by Mujtaba Khan on 05/03/23.
//

import Foundation
import Alamofire

class MatchDetailsAPI {
    
    func GetMatchDetails(Complition: @escaping MatchCompletion){
        guard let newurl = URL(string: "https://demo.sportz.io/sapk01222019186652.json") else {
            return
        }
        showARSProgress()
                
        AF.request(newurl,method: .get,headers: nil).responseJSON { response in
            switch response.result {
                
            case .success(let value):
                print("Response = ", value)
                
                guard let data = response.data else {
                    hideARSProgress()
                    return Complition(nil)
                }
                let jsonDecoder = JSONDecoder()
                do{
                    let MatchDetails = try jsonDecoder.decode(MatchModel.self, from: data)
                    hideARSProgress()
                    Complition(MatchDetails)
                }catch {
                    debugPrint(error.localizedDescription)
                    hideARSProgress()
                    Complition(nil)
                }
                
                break
                
            case .failure(let error):
                print("Debug: \(error.localizedDescription)")
                hideARSProgress()
                break
                
            }
        }
    }
}
typealias MatchCompletion = (MatchModel?) -> Void
