//
//  PokemonAPI.swift
//  Pokedax
//
//  Created by Meitar Basson on 25/04/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class PokemonAPI {
    
    // Web request with URL session
    func getRandomPokemonUrlSession(id: Int, completion: @escaping (Pokemon?) -> Void) {
         
         guard let url = URL(string: "\(BASE_URL)\(id)") else { return }
         let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
             
             guard error == nil else {
                 debugPrint(error.debugDescription)
                 completion(nil)
                 return
             }
             
             guard let data = data else { return }
             
             do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                 guard let json = jsonAny as? [String : Any] else { return }
                 let pokemon = self.parsePokemonManual(json: json)
                 DispatchQueue.main.async {
                     completion(pokemon)
                 }
             } catch {
                 debugPrint(error.localizedDescription)
                 return
             }
         }
         task.resume()
     }
    
    func getPokemonImage(id: Int, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: "\(POKEMON_IMAGE_URL)\(id).png") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                debugPrint(error.debugDescription)
                completion(nil)
                return
            }
            guard let data = data else { return }
            if let image = UIImage(data: data) {
                completion(image)
            }
        }
        task.resume()
    }
    
    func parsePokemonManual(json : [String : Any]) -> Pokemon {
        let name = json["name"] as? String ?? ""
        let weight = json["weight"] as? Int ?? 0
        let id = json["id"] as? Int ?? 0
        let order = json["order"] as? Int ?? 0
        // Error line below, not parsing data well
        let moves = json["moves"] as? [String] ?? [String]()
        
        return Pokemon(name: name, order: order, weight: weight, pokemonMoves: moves, pokemonID: id)
    }
}
