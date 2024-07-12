//
//  ApiHandler.swift
//  Ice&Fire
//
//  Created by Salman Mhaskar on 12/07/24.
//

import Foundation

//{"id":0,"firstName":"Daenerys","lastName":"Targaryen","fullName":"Daenerys Targaryen","title":"Mother of Dragons","family":"House Targaryen","image":"daenerys.jpg","imageUrl":"https://thronesapi.com/assets/images/daenerys.jpg"}

class ApiHandler:ObservableObject{
    
    
    @Published var characters: [CharacterDataModel] = []
    
    init(){
        fetchApi()
    }

    struct CharacterDataModel: Codable, Identifiable{
        let id: Int
        let firstName: String
        let lastName: String
        let fullName: String
        let title: String
        let family: String
        let imageUrl: String
        
    }

    func fetchApi(){
        let url = URL(string: "https://thronesapi.com/api/v2/Characters")
        let task = URLSession.shared.dataTask(with: url!){ data, response, error in
            if let error = error{
                print("Error: \(error.localizedDescription)")
            }
            else{
                guard let data = data else{
                    return
                }
                do{
                    let decodedData = try JSONDecoder().decode([CharacterDataModel].self, from: data)
                    self.characters = decodedData
                }catch let jsonError {
                    print("Failed to decode json", jsonError)
                }
                    }
        }
        task.resume()
    }

}
